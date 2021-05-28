<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Envio de Convite</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
<f:view>

	<h:form id="frm" styleClass="centerPage">
		<h:graphicImage styleClass="imageLink" value="../topEnvCon.png"/>
		<br/><br/>
		
		<h:messages layout="table" showSummary="true" 
		showDetail="false" globalOnly="true"
		styleClass="msgErro" infoClass="msgInfo"
		style="font-weight: bold"/>
		
		<h:panelGrid columns="2">
						
			<h:outputLabel styleClass="label" value="Empregado:"/>
			<h:panelGroup>
				<h:selectOneListbox size="8" id="empregado"
				value="#{envioConviteBean.conviteEdicao.convidado}"
				label="Empregado" required="true">
					<f:selectItems value="#{envioConviteBean.empregados}"/>	
				</h:selectOneListbox>
				 <h:message for="empregado" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
								
			<h:outputLabel styleClass="label" value="Data do convite"/>
			<h:panelGroup>
 			<h:outputText id="dataInstauracao" value="#{envioConviteBean.conviteEdicao.dataConvite}">
	 			<f:convertDateTime pattern="dd/MM/yyyy hh:mm" />
			</h:outputText>
			</h:panelGroup>
			
				

			
		</h:panelGrid>
		
		<br/><br/><br/>	
		<h:panelGroup>
			<h:commandButton value="Enviar" actionListener="#{envioConviteBean.salvar}" styleClass="botao"/>
		
			<h:commandButton value="Cancelar" action="menu" immediate="true" styleClass="botao"/>
		</h:panelGroup>
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco" immediate="true">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>	
	</h:form>

</f:view>
</body>
</html>
