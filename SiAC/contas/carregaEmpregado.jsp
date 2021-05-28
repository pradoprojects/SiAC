<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Carrega Empregados</title>
<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>


<body onunload="loadingOff();">

		<script language="JavaScript">		
					
			function loadingOn(){
					document.getElementById('frm:loading').style.visibility = "visible";						
			}
					
			function loadingOff(){
					document.getElementById('frm:loading').style.visibility = "hidden";						
			}	
					
				
		</script>

<f:view>
	
		
	
	<h:form id="frm" styleClass="centerPage" >
		<h:graphicImage styleClass="imageLink" value="../topCarrEmp.png"/>
		<br/><br/>
		<h:messages layout="table" showSummary="true" 
		showDetail="false" globalOnly="true"
		styleClass="msgErro" infoClass="msgInfo"
		style="font-weight: bold"/>
		
	
		<h:graphicImage styleClass="centerPage2" id="loading" style="visibility:hidden;" value="../loading.gif" height="30" width="30"/>
	
		
		<br/>
		<h:panelGroup  styleClass="centerPage">
				
				
				
			
				
				<br/>
	
				<h:commandButton value="Carregar" action="#{carregaEmpregadosBean.carregar}" styleClass="botao">
				</h:commandButton>
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