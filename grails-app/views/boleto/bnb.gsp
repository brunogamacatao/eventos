<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
  <title>Vesitular FACISA-FCM-ESAC</title>
  <meta http-equiv="Content-Type" content="text/html charset=utf-8"/>
  <link rel="stylesheet" type="text/css" href="${resource(dir:'css/boleto',file:'sicoob.css')}"/>
  <script type="text/javascript">
    window.print();
  </script>
  <style type="text/css">
    fieldset {
      padding: 0;
    }

    legend {
      font-size: 14px;
      font-weight: bold;
    }

    .legenda {
      font-size: 14px;
      font-weight: bold;
      margin-left: 1em;
    }

    .resposta {
      font-size: 12px;
      display: block;
      line-height: 14px;
      margin-left: 2em;
    }
  </style>
</head>
<body>
  <div id="container">
    <div id="boleto">
      <table class="header" border="0" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td width="150"><img src="${resource(dir:'images/boletos',file:'bnb.gif')}" width="120px"/></td>
            <td width="50"><div class="field_cod_banco">${ String.format("%03d", banco.numero) }-0</div></td>
            <td class="linha_digitavel">
              ${ banco.getLinhaDigitavel()[0] } &nbsp;
              ${ banco.getLinhaDigitavel()[1] } &nbsp;
              ${ banco.getLinhaDigitavel()[2] } &nbsp;
              ${ banco.getLinhaDigitavel()[3] } &nbsp;
              ${ banco.getLinhaDigitavel()[4] }
            </td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellpadding="0">
        <tbody>
          <tr class="titulos">
            <td class="cedente">Cedente</td>
            <td class="ag_cod_cedente">Ag&ecirc;ncia / C&oacute;digo do Cedente</td>
            <td class="especie">Esp&eacute;cie</td>
            <td class="qtd">Quantidade</td>
            <td class="nosso_numero">Nosso n&uacute;mero</td>
          </tr>

          <tr class="campos">
            <td class="cedente">${ boleto.cedente.cedente } &nbsp;</td>
            <td class="ag_cod_cedente">${ String.format("%04d", boleto.cedente.agencia) } | ${ boleto.cedente.conta }-9 &nbsp;</td>
            <td class="especie">${ boleto.documento.especie } &nbsp;</td>
            <td class="qtd">1 &nbsp;</td>
            <td class="nosso_numero">${ boleto.cedente.nossoNumero } &nbsp;</td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellPadding="0">
        <tbody>
          <tr class="titulos">
            <td class="num_doc">N&uacute;mero do documento</td>
            <td class="contrato">Contrato</td>
            <td class="cpf_cei_cnpj">CPF/CEI/CNPJ</td>
            <td class="vencimento">Vencimento</td>
            <td class="valor_doc">Valor documento</td>
          </tr>
          <tr class="campos">
            <td class="num_doc">${ boleto.documento.numero }</td>
            <td class="contrato">${ boleto.cedente.convenio }</td>
            <td class="cpf_cei_cnpj">${ boleto.cedente?.cnpj } &nbsp;</td>
            <td class="vencimento"><g:formatDate format="dd/MM/yyyy" date="${ boleto.datas.vencimento }"/></td>
            <td class="valor_doc"><g:formatNumber number="${ boleto.valor }" type="currency" locale="pt_BR"/></td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellPadding="0">
        <tbody>
          <tr class="titulos">
            <td class="desconto">(-) Desconto / Abatimento</td>
            <td class="outras_deducoes">(-) Outras dedu&ccedil;&otilde;es</td>
            <td class="mora_multa">(+) Mora / Multa</td>
            <td class="outros_acrescimos">(+) Outros acr&eacute;scimos</td>
            <td class="valor_cobrado">(=) Valor cobrado</td>
          </tr>
          <tr class="campos">
            <td class="desconto">&nbsp;</td>
            <td class="outras_deducoes">&nbsp;</td>
            <td class="mora_multa">&nbsp;</td>
            <td class="outros_acrescimos">&nbsp;</td>
            <td class="valor_cobrado">&nbsp;</td>
          </tr>
        </tbody>
      </table>


      <table class="line" cellspacing="0" cellpadding="0">
        <tbody>
          <tr class="titulos">
            <td class="sacado">Sacado</td>
            <td class="cpf_cnpj">CPF/CNPJ</td>
          </tr>
          <tr class="campos">
            <td class="sacado">${ boleto.sacado.nome }</td>
            <td class="cpf_cnpj">${ boleto.sacado?.cpf }</td>
          </tr>
        </tbody>
      </table>

      <div class="footer">
        <p>Autentica&ccedil;&atilde;o mec&acirc;nica</p>
      </div>

      <div class="cut">
        <p>Corte na linha pontilhada</p>
      </div>

      <table class="header" border="0" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td width="150"><img src="${resource(dir:'images/boletos',file:'bnb.gif')}" width="120px"/></td>
            <td width="50"><div class="field_cod_banco">${ String.format("%03d", banco.numero) }-0</div></td>
            <td class="linha_digitavel">
              ${ banco.getLinhaDigitavel()[0] } &nbsp;
              ${ banco.getLinhaDigitavel()[1] } &nbsp;
              ${ banco.getLinhaDigitavel()[2] } &nbsp;
              ${ banco.getLinhaDigitavel()[3] } &nbsp;
              ${ banco.getLinhaDigitavel()[4] }
            </td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellpadding="0">
        <tbody>
          <tr class="titulos">
            <td class="local_pagto">Local de pagamento</td>
            <td class="vencimento2">Vencimento</td>
          </tr>
          <tr class="campos">
            <td class="local_pagto">PAG&Aacute;VEL EM QUALQUER BANCO AT&Eacute; O VENCIMENTO</td>
            <td class="vencimento2"><g:formatDate format="dd/MM/yyyy" date="${ boleto.datas.vencimento }"/></td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellpadding="0">
        <tbody>
          <tr class="titulos">
            <td class="cedente2">Cedente</td>
            <td class="ag_cod_cedente2">Ag&ecirc;ncia/C&oacute;digo cedente</td>
          </tr>
          <tr class="campos">
            <td class="cedente2">${ boleto.cedente.cedente }</td>
            <td class="ag_cod_cedente2">${ String.format("%04d", boleto.cedente.agencia) } | ${ boleto.cedente.conta }-9</td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellpadding="0">
        <tbody>
          <tr class="titulos">
            <td class="data_doc">Data do documento</td>
            <td class="num_doc2">No. documento</td>
            <td class="especie_doc">Esp&eacute;cie doc.</td>
            <td class="aceite">Aceite</td>
            <td class="data_process">Data process.</td>
            <td class="nosso_numero2">Nosso n&uacute;mero</td>
          </tr>
          <tr class="campos">
            <td class="data_doc"><g:formatDate format="dd/MM/yyyy" date="${ boleto.datas.documento }"/></td>
            <td class="num_doc2">${ boleto.documento.numero }</td>
            <td class="especie_doc">${ boleto.documento.especie }</td>
            <td class="aceite">${ boleto.aceite }</td>
            <td class="data_process"><g:formatDate format="dd/MM/yyyy" date="${ boleto.datas.processamento }"/></td>
            <td class="nosso_numero2">${ boleto.cedente.nossoNumero }</td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellPadding="0">
        <tbody>
          <tr class="titulos">
            <td class="reservado">Uso do banco</td>
            <td class="carteira">Carteira</td>
            <td class="especie2">Esp&eacute;cie</td>
            <td class="qtd2">Quantidade</td>
            <td class="xvalor">x Valor</td>
            <td class="valor_doc2">(=) Valor documento</td>
          </tr>
          <tr class="campos">
            <td class="reservado">&nbsp;</td>
            <td class="carteira"> ${ boleto.cedente.carteira } </td>
            <td class="especie2"> R$ </td>
            <td class="qtd2">1</td>
            <td class="xvalor"><g:formatNumber number="${ boleto.valor }" type="currency" locale="pt_BR"/></td>
            <td class="valor_doc2"><g:formatNumber number="${ boleto.valor }" type="currency" locale="pt_BR"/></td>
          </tr>
        </tbody>
      </table>

      <table class="line" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td class="last_line" rowspan="6">
              <table class="line" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr class="titulos">
                    <td class="instrucoes">Instru&ccedil;&otilde;es (Texto de responsabilidade do cedente)</td>
                  </tr>
                  <tr class="campos">
                    <td class="instrucoes" rowspan="5">
                      <g:each in="${ boleto.instrucoes }">
                        <p>${ it }</p>
                      </g:each>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>

          <tr>
            <td>
              <table class="line" style="border-right: 0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr class="titulos">
                    <td class="desconto2">(-) Desconto / Abatimento</td>
                  </tr>
                  <tr class="campos">
                    <td class="desconto2">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>

          <tr>
            <td>
              <table class="line" style="border-right: 0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr class="titulos">
                    <td class="outras_deducoes2">(-) Outras dedu&ccedil;&otilde;es</td>
                  </tr>
                  <tr class="campos">
                    <td class="outras_deducoes2">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>

          <tr>
            <td>
              <table class="line" style="border-right: 0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr class="titulos">
                    <td class="mora_multa2">(+) Mora / Multa</td>
                  </tr>
                  <tr class="campos">
                    <td class="mora_multa2">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>

          <tr>
            <td>
              <table class="line" style="border-right: 0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr class="titulos">
                    <td class="outros_acrescimos2">(+) Outros Acr&eacute;scimos</td>
                  </tr>
                  <tr class="campos">
                    <td class="outros_acrescimos2">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>

          <tr>
            <td class="last_line">
              <table class="line" style="border-right: 0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr class="titulos">
                    <td class="valor_cobrado2">(=) Valor cobrado</td>
                  </tr>
                  <tr class="campos">
                    <td class="valor_cobrado2">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>


      <table class="line" cellspacing="0" cellPadding="0">
        <tbody>
          <tr class="titulos">
            <td class="sacado2">Sacado</td>
            <td class="cpf_cnpj2">CPF/CNPJ</td>
          </tr>
          <tr class="campos">
            <td class="sacado2">
              <p>${ boleto.sacado.nome }</p>
              <p>${ boleto.sacado.endereco } - ${ boleto.sacado.bairro }</p>
              <p>CEP: ${ boleto.sacado.cep } - ${ boleto.sacado.cidade } - ${ boleto.sacado.estado }</p>
            </td>
            <td class="cpf_cnpj2">${ boleto.sacado?.cpf }</td>
          </tr>
          <tr class="titulos">
            <td class="sacador_avalista">Sacador/Avalista</td>
            <td class="cod_baixa">&nbsp;</td>
          </tr>
          <tr class="titulos">
            <td class="sacador_avalista">&nbsp;</td>
            <td class="cod_baixa">C&oacute;d. baixa</td>
          </tr>
          
        </tbody>
      </table>

      <div class="footer">
        <p>Autentica&ccedil;&atilde;o mec&acirc;nica</p>
      </div>

      <div class="barcode">
        <p>
          <g:barcode code="${ banco.getCodigoDeBarras() }"/>
        </p>
      </div>
    </div>
  </div>
</body>
</html>