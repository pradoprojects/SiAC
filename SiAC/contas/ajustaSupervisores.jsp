<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ajuste de Supervisores</title>
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

	<h:form id="frm" styleClass="centerPage">
		<h:graphicImage  value="../topCarrEmp.png"/>
		<br/><br/>
		
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
		
		
		<h:panelGrid  id="gradEscala" columns="1" width="608" styleClass="linhaInstrucao" >
			
					
			<h:panelGroup styleClass="centerPage2">
				<h:outputText id="instrucao" 
				value="Selecione o supervisor imediato de cada Área/Setor" />
				
			</h:panelGroup>
			
		</h:panelGrid>
			
		<h:dataTable id="table" value="#{carregaEmpregadosBean.lstAreas}" var="item" width="600" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaPadrao">
		
			<h:column>
				<f:facet name="header">
						<h:outputText value="Área/Setor" rendered="true" />
				</f:facet>
				<h:outputText value="#{item[0]}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Supervisor"/>
				</f:facet>	
				
				<h:panelGroup>
					<h:selectOneListbox size="5" id="Empregados" 
					value="#{item[1]}" required="true"
					label="Escolha de supervisor" > 
						<f:selectItems value="#{carregaEmpregadosBean.empregadosComponent}" />	
					</h:selectOneListbox>
					<br/>
					 <h:message for="Empregados" showSummary="true" showDetail="false" styleClass="msgErro"/>
				</h:panelGroup>
				
				
				
			</h:column>			
			
	
			
			
			
			
			
		
			
		
					
			
		</h:dataTable>
		
		<CENTER>
			<h:graphicImage styleClass="centerPage2" id="loading" style="visibility:hidden;" value="../loading.gif" height="30" width="30"/>
		</CENTER>
		
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
		
		<h:commandLink action="consultaProcesso" styleClass="linkComEspaco">
			<h:outputText value="Voltar"/>
		</h:commandLink>
		
		<h:commandLink action="#{carregaEmpregadosBean.salvar}" onclick="loadingOn();"  >
			<h:outputText value="Salvar"/>
		</h:commandLink>	
			
		
		
	</h:form>

</f:view>
</body>
</html>