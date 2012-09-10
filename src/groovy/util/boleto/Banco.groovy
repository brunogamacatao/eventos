package util.boleto

import java.util.List;

/**
 * Esta interface deve ser implementada para todos os bancos que seja 
 * necessária a emissão de boletos.
 * 
 * @author Bruno Gama Catão
 *
 */
interface Banco {
	int getNumero();
	void setBoleto(Boleto boleto);
	String getTemplateName();
	String getNossoNumero();
	int getNossoNumeroDV();
	long getFatorVencimento();
	String getCodigoDeBarras();
	List<String> getLinhaDigitavel();
}
