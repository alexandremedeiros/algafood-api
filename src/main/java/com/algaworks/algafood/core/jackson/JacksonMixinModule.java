package com.algaworks.algafood.core.jackson;

import org.springframework.stereotype.Component;

import com.algaworks.algafood.api.model.mixin.CidadeMixin;
import com.algaworks.algafood.api.model.mixin.GrupoMixin;
import com.algaworks.algafood.api.model.mixin.UsuarioMixin;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Grupo;
import com.algaworks.algafood.domain.model.Usuario;
import com.fasterxml.jackson.databind.module.SimpleModule;

@Component
public class JacksonMixinModule extends SimpleModule {

	private static final long serialVersionUID = 1L;
	
	public JacksonMixinModule() {
		setMixInAnnotation(Cidade.class, CidadeMixin.class);
		setMixInAnnotation(Grupo.class, GrupoMixin.class);
		setMixInAnnotation(Usuario.class, UsuarioMixin.class);
	}

}
