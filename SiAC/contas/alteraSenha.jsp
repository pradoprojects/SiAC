<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Alteração de Senha</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
<f:view>

	<h:form id="frm"  styleClass="centerPage" >
		<h:graphicImage  value="../topAltSen.png"/>
		<br/><br/>
		
		
		<h:messages layout="table" showSummary="true" 
		showDetail="false" globalOnly="true"
		styleClass="msgErro" infoClass="msgInfo"
		style="font-weight: bold"/>
		
		<h:panelGrid columns="2">
			
			<h:outputLabel value="Digite a nova senha:"  />
			<h:panelGroup >
				<h:inputSecret id="novaSenha"  size="10" value="#{alteraSenhaBean.novaSenha}"/>
				 <h:message for="novaSenha" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			<h:outputLabel value="Confirme a nova senha:"/>
			<h:panelGroup >
				<h:inputSecret id="confirmaSenha"  size="10" value="#{alteraSenhaBean.confirmaSenha}"/>
				 <h:message for="confirmaSenha" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			<br/><br/>
			<h:panelGroup styleClass="centerPage">
				<h:commandButton value="Salvar" actionListener="#{alteraSenhaBean.salvar}" styleClass="botao"/>
				<h:commandButton value="Cancelar" action="menu" immediate="true" styleClass="botao"/>
			</h:panelGroup>
			
		</h:panelGrid>
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
			
	</h:form>

</f:view>
</body>
</html>
