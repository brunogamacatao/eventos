package util.boleto

/**
 * Esta classe define os campos que os boletos devem ter.
 * 
 * @author Bruno Gama Catão
 */
class Boleto {
	def datas            = [:]
	def cedente          = [:]
	def sacado           = [:]
	def documento        = [:]
	def locaisPagamento  = []
	def instrucoes       = []
	def aceite
	def moeda
	def valor
	
	static Boleto getInstance(Closure buildClosure) {
		def boleto = new Boleto()
		
		buildClosure.delegate = boleto
		buildClosure()
		
		return boleto
	}
	
	def datas(Closure datasClosure) {
		datasClosure.delegate = new Object() {
			def vencimento (def vencimento) {
				datas.vencimento = vencimento
			}
			def documento (def documento) {
				datas.documento = documento
			}
			def processamento (def processamento) {
				datas.processamento = processamento
			}
		}
	
		datasClosure()
	}
	
	def cedente(Closure cedenteClosure) {
		cedenteClosure.delegate = new Object() {
			def cedente(def nomeCedente) {
				cedente.cedente = nomeCedente
			}
			def cnpj(def cnpj) {
				cedente.cnpj = cnpj
			}
			def agencia(def agencia) {
				cedente.agencia = agencia
			}
			def conta(def conta) {
				cedente.conta = conta
			}
			def convenio(def convenio) {
				cedente.convenio = convenio
			}
			def carteira(def carteira) {
				cedente.carteira = carteira
			}
			def operacao(def operacao) {
				cedente.operacao = operacao
			}
			def nossoNumero(def nossoNumero) {
				cedente.nossoNumero = nossoNumero
			}
		}
		cedenteClosure()
	}
	
	def sacado(Closure sacadoClosure) {
		sacadoClosure.delegate = new Object() {
			def nome(def nome) {
				sacado.nome = nome
			}
			def cpf(def cpf) {
				sacado.cpf = cpf
			}
			def endereco(def endereco) {
				sacado.endereco = endereco
			}
			def bairro(def bairro) {
				sacado.bairro = bairro
			}
			def cep(def cep) {
				sacado.cep = cep
			}
			def cidade(def cidade, def estado) {
				sacado.cidade = cidade
				sacado.estado = estado
			}
		}
		sacadoClosure()
	}
	
	def aceite(def aceite) {
		this.aceite = aceite
	}
	
	def documento(Closure documentoClosure) {
		documentoClosure.delegate = new Object() {
			def numero(def numero) {
				documento.numero = numero
			}
			def especie(def especie) {
				documento.especie = especie
			}
			def parcela(def parcela) {
				documento.parcela = parcela
			}
		}
		documentoClosure()
	}
	
	def moeda(def moeda) {
		this.moeda = moeda
	}
	
	def valor(def valor) {
		this.valor = valor
	}
	
	def pagamento(String... pagamentos) {
		this.locaisPagamento.addAll(pagamentos)
	}
	
	def instrucoes(String... instrucoes) {
		this.instrucoes.addAll(instrucoes)
	}
}