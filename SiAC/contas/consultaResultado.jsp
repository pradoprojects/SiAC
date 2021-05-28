<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Consulta Resultado</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
<f:view>

	<h:form id="frm" styleClass="centerPage">
		<h:graphicImage  value="../topConRes.png"/>
		<br/><br/>
		
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
		
		<h:outputText styleClass="msgErro" value="N�o h� resultado dispon�vel!" rendered="#{consultaResultadoBean.resultadoUsuario==null || !consultaResultadoBean.resultadoAvaiable}"/>	
		<h:dataTable rendered="#{consultaResultadoBean.resultadoUsuario!=null && consultaResultadoBean.resultadoAvaiable}"  value="#{consultaResultadoBean.resultadoUsuario}" var="item" width="900" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaAberta">
	
			<h:column>
				<f:facet name="header">
					<h:outputText value="Nota Avalia��o" rendered="true" />
				</f:facet>
				<h:outputText value="#{item.resultadoAvaliacao}"/>
			</h:column>
				
			<h:column>
				<f:facet name="header">
					<h:outputText value="Nota Reavalia��o" rendered="true" />
				</f:facet>
				<h:outputText value="#{item.resultadoReavaliacao}"/>
			</h:column>
			
	
			
		</h:dataTable>
		
		
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
	</h:form>

</f:view>
</body>
</html>