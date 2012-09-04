<%@ page import="eventos.Participante" %>



<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="participante.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${participanteInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="participante.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${participanteInstance.constraints.sexo.inList}" required="" value="${participanteInstance?.sexo}" valueMessagePrefix="participante.sexo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'dataNascimento', 'error')} required">
	<label for="dataNascimento">
		<g:message code="participante.dataNascimento.label" default="Data Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataNascimento" precision="day"  value="${participanteInstance?.dataNascimento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="participante.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${participanteInstance?.cpf}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'rg', 'error')} ">
	<label for="rg">
		<g:message code="participante.rg.label" default="Rg" />
		
	</label>
	<g:textField name="rg" value="${participanteInstance?.rg}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'orgaoEmissor', 'error')} required">
	<label for="orgaoEmissor">
		<g:message code="participante.orgaoEmissor.label" default="Orgao Emissor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="orgaoEmissor" required="" value="${participanteInstance?.orgaoEmissor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'estadoRG', 'error')} required">
	<label for="estadoRG">
		<g:message code="participante.estadoRG.label" default="Estado RG" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estadoRG" from="${participanteInstance.constraints.estadoRG.inList}" required="" value="${participanteInstance?.estadoRG}" valueMessagePrefix="participante.estadoRG"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'estadoCivil', 'error')} required">
	<label for="estadoCivil">
		<g:message code="participante.estadoCivil.label" default="Estado Civil" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estadoCivil" from="${participanteInstance.constraints.estadoCivil.inList}" required="" value="${participanteInstance?.estadoCivil}" valueMessagePrefix="participante.estadoCivil"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'nacionalidade', 'error')} required">
	<label for="nacionalidade">
		<g:message code="participante.nacionalidade.label" default="Nacionalidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nacionalidade" from="${participanteInstance.constraints.nacionalidade.inList}" required="" value="${participanteInstance?.nacionalidade}" valueMessagePrefix="participante.nacionalidade"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'pais', 'error')} ">
	<label for="pais">
		<g:message code="participante.pais.label" default="Pais" />
		
	</label>
	<g:textField name="pais" value="${participanteInstance?.pais}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'estadoNaturalidade', 'error')} required">
	<label for="estadoNaturalidade">
		<g:message code="participante.estadoNaturalidade.label" default="Estado Naturalidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estadoNaturalidade" from="${participanteInstance.constraints.estadoNaturalidade.inList}" required="" value="${participanteInstance?.estadoNaturalidade}" valueMessagePrefix="participante.estadoNaturalidade"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'cidadeNaturalidade', 'error')} ">
	<label for="cidadeNaturalidade">
		<g:message code="participante.cidadeNaturalidade.label" default="Cidade Naturalidade" />
		
	</label>
	<g:textField name="cidadeNaturalidade" value="${participanteInstance?.cidadeNaturalidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'cep', 'error')} required">
	<label for="cep">
		<g:message code="participante.cep.label" default="Cep" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cep" required="" value="${participanteInstance?.cep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="participante.rua.label" default="Endereço" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required="" value="${participanteInstance?.endereco}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="participante.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numero" required="" value="${participanteInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'bairro', 'error')} required">
	<label for="bairro">
		<g:message code="participante.bairro.label" default="Bairro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bairro" required="" value="${participanteInstance?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="participante.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cidade" required="" value="${participanteInstance?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'telefone1', 'error')} required">
	<label for="telefone1">
		<g:message code="participante.telefone1.label" default="Telefone1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone1" required="" value="${participanteInstance?.telefone1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="participante.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${participanteInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'complemento', 'error')} ">
	<label for="complemento">
		<g:message code="participante.complemento.label" default="Complemento" />
		
	</label>
	<g:textField name="complemento" value="${participanteInstance?.complemento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="participante.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${participanteInstance.constraints.estado.inList}" required="" value="${participanteInstance?.estado}" valueMessagePrefix="participante.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'socio', 'error')} required">
	<label for="socio">
		<g:message code="participante.socio.label" default="Socio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="socio" from="${participanteInstance.constraints.socio.inList}" required="" value="${participanteInstance?.socio}" valueMessagePrefix="participante.socio"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'comprovante', 'error')} required">
	<label for="comprovante">
		<g:message code="participante.comprovante.label" default="Comprovante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="comprovante" name="comprovante.id" from="${eventos.Imagem.list()}" optionKey="id" required="" value="${participanteInstance?.comprovante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'telefone2', 'error')} ">
	<label for="telefone2">
		<g:message code="participante.telefone2.label" default="Telefone2" />
		
	</label>
	<g:textField name="telefone2" value="${participanteInstance?.telefone2}"/>
</div>

