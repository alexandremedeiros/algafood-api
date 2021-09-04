package com.algaworks.algafood.api.controller;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.CozinhaRepository;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/restaurantes")
public class RestauranteController {
	
	@Autowired
	private RestauranteRepository restauranteRepository;
	
	@Autowired
	private CozinhaRepository cozinhaRepository;
	
	
	@Autowired
	private CadastroRestauranteService cadastroRestaurante;
	
	@GetMapping
	public List<Restaurante> listar() {
		List<Restaurante> restaurantes = restauranteRepository.findAll();
		
		
		return restaurantes;
	}
	
	@GetMapping(value = "por-taxa-frete")
	public List<Restaurante> listarPorTaxaFrete(BigDecimal taxaInicial, BigDecimal taxaFinal) {
		return restauranteRepository.findByTaxaFreteBetween(taxaInicial, taxaFinal);
	}
	
	@GetMapping(value = "por-nome")
	public List<Restaurante> listarPorNomeCozinha(String nome, Long cozinha) {
		return restauranteRepository.consultaPorNome(nome, cozinha);
	}
	
	@GetMapping(value = "por-nome-e-frete")
	public List<Restaurante> listarPorNomeFrete(String nome, 
			BigDecimal taxaInicial, BigDecimal taxaFinal) {
		return restauranteRepository.find(nome, taxaInicial, taxaFinal);
	}
	
	
	@GetMapping(value = "{restauranteId}")
	public ResponseEntity<Restaurante> buscar(@PathVariable("restauranteId") Long id) {
		Optional<Restaurante> restaurante = restauranteRepository.findById(id);
		
		if (restaurante.isPresent()) {
			return ResponseEntity.ok(restaurante.get());
		}
		
		return ResponseEntity.notFound().build();
		
	}
	
	
	@PostMapping
	public ResponseEntity<?> adicionar(@RequestBody Restaurante restaurante) {
		try {
			Long cozinhaId = restaurante.getCozinha().getId();
			
			Cozinha cozinha = cozinhaRepository.findById(cozinhaId)
					.orElseThrow(() -> new EntidadeNaoEncontradaException(
					    String.format("Não existe cadastro de cozinha com código %d", cozinhaId)));
			
			restaurante.setCozinha(cozinha);
			
			restaurante = cadastroRestaurante.salvar(restaurante);
			return ResponseEntity.status(HttpStatus.CREATED).body(restaurante);
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}
	
	@PutMapping(value = "{restauranteId}")
	public ResponseEntity<?> atualizar(@PathVariable("restauranteId") Long id, 
			@RequestBody Restaurante restaurante) {
		try {
			Restaurante restauranteAtual = restauranteRepository.findById(id).orElse(null);
			
			if (restauranteAtual != null) {
				BeanUtils.copyProperties(restaurante, restauranteAtual, 
						"id", "formasPagamento", "endereco", "dataCadastro", "produtos");
				
				Restaurante restauranteSalvo = cadastroRestaurante.salvar(restauranteAtual);
				return ResponseEntity.ok(restauranteSalvo);
			}
			
			return ResponseEntity.notFound().build();
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}
	
	@PatchMapping("/{restauranteId}")
	public ResponseEntity<?> atualizarParcial(@PathVariable("restauranteId") Long restauranteId,
			@RequestBody Map<String, Object> campos) {
		Restaurante restauranteAtual = restauranteRepository.findById(restauranteId)
				.orElse(null);
		
		if (restauranteAtual == null) {
			return ResponseEntity.notFound().build();
		}
		
		merge(campos, restauranteAtual);
		
		return atualizar(restauranteId, restauranteAtual);
	}

	private void merge(Map<String, Object> dadosOrigem, Restaurante restauranteDestino) {
		ObjectMapper objectMapper = new ObjectMapper();
		Restaurante restauranteOrigem = objectMapper.convertValue(dadosOrigem, Restaurante.class);
				
		dadosOrigem.forEach((nomePropriedade, valorPropriedade) -> {
			Field field = ReflectionUtils.findField(Restaurante.class, nomePropriedade);
			field.setAccessible(true);
			
			Object novoValor = ReflectionUtils.getField(field, restauranteOrigem);
			
			ReflectionUtils.setField(field, restauranteDestino, novoValor);
		});
	}

}
