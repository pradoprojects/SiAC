<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Relatório Empregados</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />

</head>
<script language="JavaScript">

function showBalanco(){
	
	document.getElementById('frm:tabelaBalancoPessoa').style.visibility = "visible";
}


	
</script>
<body >
<f:view>

	<h:form id="frm" styleClass="centerPage">
		<h:graphicImage  value="../topConRel.png"/>
		<br/><br/>
		
		
		
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
		
		<h:outputText styleClass="msgErro" value="Não há resultado disponível!" rendered="#{consultaRelatorioBean.resultados == null}"/>	
		<h:dataTable rendered="#{consultaRelatorioBean.resultados != null}" value="#{consultaRelatorioBean.resuls}" var="item" width="1000" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaAberta">
	
	
			<h:column>
				<f:facet name="header">
					<h:outputText value="Matrícula" rendered="true" />
				</f:facet>
				<h:outputText value="#{item[0].matricula}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Nome Empregado" rendered="true" />
				</f:facet>
				<h:outputText value="#{item[0].nome}"/>
			</h:column>
			
		
	
			<h:column>	
				<f:facet name="header">
					<h:outputText value="Agrupamento" rendered="true" />
				</f:facet>
				<h:outputText value="#{item[0].agrupamento}"/>
			</h:column>
	
			<h:column>
				<f:facet name="header">
					<h:outputText value="Nota Avaliação" rendered="true" />
				</f:facet>
				<h:outputText value="#{item[1].resultadoAvaliacao}"/>
				<h:outputText value="-" rendered="#{item[1] == null || item[1].resultadoAvaliacao == null}"/>
			</h:column>
				
			<h:column>
				<f:facet name="header">
					<h:outputText value="Nota Reavaliação" rendered="true" />
				</f:facet>
				<h:outputText value="#{item[1].resultadoReavaliacao}"/>
				<h:outputText value="-" rendered="#{item[1] == null || item[1].resultadoReavaliacao == null}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{consultaRelatorioBean.ordenarPorBalancoAvaliado}" styleClass="linkComEspaco">
						<h:outputText value="Concluído/Total (Avaliado)" rendered="true"  />
					</h:commandLink>	
				</f:facet>
				<h:commandLink  styleClass="linkComEspaco" onclick="showBalanco();">
				<f:setPropertyActionListener value="#{null}"
										    target="#{consultaRelatorioBean.balancoAvaliado}"/>
				<f:setPropertyActionListener value="#{null}"
										    target="#{consultaRelatorioBean.balancoAvaliadores}"/>
				<f:setPropertyActionListener value="#{item[2]}"
										    target="#{consultaRelatorioBean.balancoAvaliado}"/>
					<h:outputText value="#{item[2].balanco}" rendered="#{item[2].desbalanceadoAsAvaliado == true}" style="color:RED"/>
					<h:outputText value="#{item[2].balanco}" rendered="#{item[2].desbalanceadoAsAvaliado == false}" style="color:GREEN"/>
					<h:outputText value="-" rendered="#{item[2].balanco == null}"/>
				</h:commandLink>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{consultaRelatorioBean.ordenarPorBalancoAvaliador}" styleClass="linkComEspaco">
						<h:outputText value="Concluído/Total (Avaliador)" rendered="true" />
					</h:commandLink>
				</f:facet>
				<h:commandLink type="reset" styleClass="linkComEspaco" onclick="showBalanco();">
				<f:setPropertyActionListener value="#{null}"
										    target="#{consultaRelatorioBean.balancoAvaliadores}"/>
				<f:setPropertyActionListener value="#{null}"
										    target="#{consultaRelatorioBean.balancoAvaliado}"/>
				<f:setPropertyActionListener value="#{item[3]}"
										    target="#{consultaRelatorioBean.balancoAvaliadores}"/>
				<h:outputText value="#{item[3].balanco}" rendered="#{item[3].desbalanceadoAsAvaliador == true}" style="color:RED"/>
				<h:outputText value="#{item[3].balanco}" rendered="#{item[3].desbalanceadoAsAvaliador == false}" style="color:GREEN"/>
				<h:outputText value="-" rendered="#{item[3].balanco == null}"/>
				</h:commandLink>
			</h:column>
	
			<h:column>
				<f:facet name="header">
					
						<h:outputText value="Enviar Carta por E-mail" rendered="true" />
					
				</f:facet>
				<h:commandLink type="reset" action="#{consultaRelatorioBean.enviaCartaAvaliacao}"  rendered="#{item[1].resultadoAvaliacao != null}">
							
				<f:setPropertyActionListener value="#{item[1]}"
										    target="#{consultaRelatorioBean.resultadoCarta}"/>
				<h:outputText value="Carta Avaliação" rendered="#{item[1].resultadoAvaliacao != null}" style="color:GREEN"/>
				<br/>
				</h:commandLink>
				<h:commandLink type="reset" action="#{consultaRelatorioBean.enviaCartaReavaliacao}" rendered="#{item[1].resultadoReavaliacao != null}">
							
				<f:setPropertyActionListener value="#{item[1]}"
										    target="#{consultaRelatorioBean.resultadoCarta}"/>
				<h:outputText value="Carta Reavaliação" rendered="#{item[1].resultadoReavaliacao != null}" style="color:GREEN"/>
				
				</h:commandLink>
				<h:outputText value="-" rendered="#{item[1].resultadoAvaliacao == null}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					
						<h:outputText value="Download" rendered="true" />
					
				</f:facet>
				<h:commandLink type="reset" action="#{consultaRelatorioBean.downCartaAvaliacao}"  rendered="#{item[1].resultadoAvaliacao != null}">
							
				<f:setPropertyActionListener value="#{item[1]}"
										    target="#{consultaRelatorioBean.resultadoCarta}"/>
				<h:outputText value="Carta Avaliação" rendered="#{item[1].resultadoAvaliacao != null}" style="color:GREEN"/>
				<br/>
				</h:commandLink>
				<h:commandLink type="reset" action="#{consultaRelatorioBean.downCartaReavaliacao}"  rendered="#{item[1].resultadoReavaliacao != null}">
							
				<f:setPropertyActionListener value="#{item[1]}"
										    target="#{consultaRelatorioBean.resultadoCarta}"/>
				<h:outputText value="Carta Reavaliação" rendered="#{item[1].resultadoReavaliacao != null}" style="color:GREEN"/>
				
				</h:commandLink>
				<h:outputText value="-" rendered="#{item[1].resultadoAvaliacao == null}"/>
			</h:column>
			
		</h:dataTable>
		
		<br/><br/>
		<h:dataTable id="tabelaBalancoPessoa" rendered="#{consultaRelatorioBean.resultados != null}" value="" var="item" width="900" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela"  columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaAberta">
			<h:column>
				<f:facet name="header">
					<h:outputText value="Completo" rendered="#{consultaRelatorioBean.balancoAvaliadores != null || consultaRelatorioBean.balancoAvaliado != null}"  />
				</f:facet>
				<h:outputText  escape="false"   value="#{consultaRelatorioBean.balancoAvaliadores.avaliadoresCompleto}"/>
				<h:outputText escape="false"  value="#{consultaRelatorioBean.balancoAvaliado.avaliadosCompleto}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Devendo" rendered="#{consultaRelatorioBean.balancoAvaliadores != null || consultaRelatorioBean.balancoAvaliado != null}" />
				</f:facet>
				<h:outputText  escape="false" value="#{consultaRelatorioBean.balancoAvaliadores.avaliadoresDevendo}"/>
				<h:outputText  escape="false" value="#{consultaRelatorioBean.balancoAvaliado.avaliadosDevendo}"/>
			</h:column>
		
		
		</h:dataTable>
		
		
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
		
		<h:commandLink action="#{consultaRelatorioBean.downExcel}" styleClass="linkComEspaco">
			<h:outputText value="Planilha de Notas"/>
		</h:commandLink>
		
		<h:commandLink action="#{consultaRelatorioBean.sendAllAvs}" rendered="#{consultaRelatorioBean.hasAvs}" styleClass="linkComEspaco">
			<h:outputText value="Enviar a Todos Carta Avaliação "/>
		</h:commandLink>
		
		<h:commandLink action="#{consultaRelatorioBean.sendAllReavs}" rendered="#{consultaRelatorioBean.hasReavs}" styleClass="linkComEspaco">
			<h:outputText value="Enviar a Todos Carta Reavaliação "/>
		</h:commandLink>
		
		<h:commandLink action="#{consultaRelatorioBean.downAllCartaAvaliacao}" rendered="#{consultaRelatorioBean.hasAvs}" styleClass="linkComEspaco">
			<h:outputText value="Download Todas Cartas Avaliações "/>
		</h:commandLink>
		
		<h:commandLink action="#{consultaRelatorioBean.downAllCartaReavaliacao}" rendered="#{consultaRelatorioBean.hasReavs}"styleClass="linkComEspaco">
			<h:outputText value="Download Todas Cartas Reavaliações "/>
		</h:commandLink>
		
	</h:form>

</f:view>
</body>
</html>