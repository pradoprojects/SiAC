<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ajuste de Clientes para empregados</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>

<body onunload="loadingOff();"  onload="loadingOn();">

		<script language="JavaScript">		
					
			function loadingOn(){
								
				document.getElementById('frm:table').style.visibility = "visible";
				document.getElementById('frm:message').style.visibility = "visible";
				document.getElementById('frm:loading').style.visibility = "hidden";
			}
					
			function loadingOff(){
					document.getElementById('frm:table').style.visibility = "hidden";
					document.getElementById('frm:message').style.visibility = "hidden";
					document.getElementById('frm:loading').style.visibility = "visible";
			}	
					
				
		</script>



<f:view>

	

	<h:form id="frm" styleClass="centerPage">
		<h:graphicImage   value="../topAjuCli.png"/>
		<br/>
		<h:graphicImage styleClass="centerPage" id="loading" value="../loading.gif" height="30" width="30"/>
		<br/><br/>
		
		<h:messages id="message"   layout="table"  showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo"  style="font-weight: bold; visibility:hidden; "/>
			
		<h:dataTable id="table" style="visibility:hidden;" value="#{ajusteClientesBean.incompletos}" var="item" width="600" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaPadrao">
		
			<h:column>
				<f:facet name="header">
						<h:outputText value="Empregado" rendered="true" />
				</f:facet>
				<h:outputText value="#{item[0].nome}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Candidatos"/>
				</f:facet>	
				
				<h:panelGroup>
					<h:selectOneListbox size="5" id="Candidatos"  
					value="#{item[3].empregado}"
					label="Comite" > 
						<f:selectItems value="#{ajusteClientesBean.empregados}" />	
					</h:selectOneListbox>
					 <h:message for="Candidatos" showSummary="true" showDetail="false" styleClass="msgErro"/>
				</h:panelGroup>
				
					<br/>	
					<h:panelGroup styleClass="centerPage2">
					<h:commandButton value="[+]"  styleClass="botao" action="#{ajusteClientesBean.addToComite}">
					<f:setPropertyActionListener value="#{item[2]}"
											target="#{ajusteClientesBean.clientesNovos}"/>		
					<f:setPropertyActionListener value="#{item[1]}"
											target="#{ajusteClientesBean.clientes}"/>
					<f:setPropertyActionListener value="#{item[0]}"
											target="#{ajusteClientesBean.selecionado}"/>
											
					</h:commandButton>
					
					</h:panelGroup>
					<br/>
				
			</h:column>			
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Clientes"/>
				</f:facet>	
				<h:panelGroup>
					<h:selectOneListbox size="5" id="ClientesNew" 
					value="#{item[4].empregado}"
					label="Clientes">
						<f:selectItems value="#{item[2]}"/>	
					</h:selectOneListbox>
					 <h:message for="ClientesNew" showSummary="true" showDetail="false" styleClass="msgErro"/>
				</h:panelGroup>
				
					<br/>	
					<h:panelGroup styleClass="centerPage2">
					<h:commandButton value="[-]" styleClass="botao" action="#{ajusteClientesBean.removeFromComite}">
					<f:setPropertyActionListener value="#{item[2]}"
											target="#{ajusteClientesBean.clientesNovos}"/>		
					<f:setPropertyActionListener value="#{item[0]}"
											target="#{ajusteClientesBean.selecionado}"/>
					
					</h:commandButton>
			
					</h:panelGroup>
					<br/>
			</h:column>	
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Clientes Definidos"/>
				</f:facet>	
				<h:panelGroup>
					<h:selectOneListbox size="8" id="Clientes" 
					value="" disabled="true"
					label="Clientes">
						<f:selectItems value="#{item[1]}" />	
					</h:selectOneListbox>
					 <h:message for="Clientes" showSummary="true" showDetail="false" styleClass="msgErro"/>
				</h:panelGroup>
			</h:column>	
			
		
			
		
					
			
		</h:dataTable>
		
		
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
		
		<h:commandLink action="consultaProcesso" styleClass="linkComEspaco">
			<h:outputText value="Voltar"/>
		</h:commandLink>
		
		<h:commandLink action="#{ajusteClientesBean.salvar}" >
			<h:outputText value="Salvar"/>
		</h:commandLink>	
			
		
		
	</h:form>

</f:view>
</body>
</html>