<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cadastro de Processo</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body onload="checkSelections();supervisorChecked();" onunload="loadingOff();">

	<script language="JavaScript">		
					
			function loadingOn(){
					document.getElementById('frm:loading').style.visibility = "visible";						
			}
					
			function loadingOff(){
					document.getElementById('frm:loading').style.visibility = "hidden";						
			}	
					
				
	</script>
<f:view>

	<h:form  id="frm" styleClass="centerPage" >
		<h:graphicImage styleClass="imageLink" value="../topCadProc.png"/>
		<br/><br/>
		<h:messages layout="table" showSummary="true" 
		showDetail="false" globalOnly="true"
		styleClass="msgErro" infoClass="msgInfo"
		style="font-weight: bold"/>
		
		<h:panelGrid columns="2" width="580" styleClass="leftAlign" >
			
			<h:outputLabel styleClass="label" value="Código:" rendered="#{cadastroProcessoBean.processoEdicao.id != null}" />
			<h:panelGroup rendered="#{cadastroProcessoBean.processoEdicao.id != null}">
				<h:inputText id="codigo" size="10" value="#{cadastroProcessoBean.processoEdicao.id}"
				 label="Código do Processo" disabled="true"/>
				 <h:message for="codigo" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
	
			
			<h:outputLabel styleClass="label" value="Data de Instauração"/>
			<h:panelGroup>
 			<h:outputText id="dataInstauracao" value="#{cadastroProcessoBean.processoEdicao.dataInstauracao}">
	 			<f:convertDateTime pattern="dd/MM/yyyy" />
			</h:outputText>
			</h:panelGroup>
			
				<h:panelGroup>
				<h:outputLabel styleClass="label" value="Empregados:"/>
				</h:panelGroup>
		
				<h:panelGroup>
					<h:selectOneListbox size="8" id="Empregados"  
					value="#{cadastroProcessoBean.candidatoInclusao}"
					label="Comite" valueChangeListener="#{cadastroProcessoBean.addToComite}"> 
						<f:selectItems value="#{cadastroProcessoBean.empregados}" />	
					</h:selectOneListbox>
					 <h:message for="Empregados" showSummary="true" showDetail="false" styleClass="msgErro"/>
				</h:panelGroup>
					
					<br/>	
					
					<h:panelGroup styleClass="centerPage2">
					<h:commandButton value="[+]" styleClass="botao"/>
					<h:commandButton value="[-]" styleClass="botao"/>
					</h:panelGroup>
					<h:panelGroup/>
					<br/>
				
				<h:panelGroup>
				<h:outputLabel styleClass="label" value="Comitê:"/>
				</h:panelGroup>	
				<h:panelGroup>
					<h:selectOneListbox size="8" id="Comite" 
					value="#{cadastroProcessoBean.candidatoExclusao}"
					valueChangeListener="#{cadastroProcessoBean.removeFromComite}"
					label="Comite">
						<f:selectItems value="#{cadastroProcessoBean.comite}"/>	
					</h:selectOneListbox>
					 <h:message for="Comite" showSummary="true" showDetail="false" styleClass="msgErro"/>
				</h:panelGroup>
				
			
			
		
	        <h:outputLabel styleClass="label" value="Presidente:"/>
			<h:panelGroup>
				<h:selectOneListbox size="1" id="presidente" 
					value="#{cadastroProcessoBean.processoEdicao.presidente}"
					label="Comite" > 
						<f:selectItems value="#{cadastroProcessoBean.comite}" />	
					</h:selectOneListbox>
				 <h:message for="presidente" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>                                 
			
			
			<h:outputLabel styleClass="label" value="Fórmula de cálculo de nota final de competência:"/>
			<h:panelGroup >
			
				<script language="JavaScript">
					
					function supervisorChecked(){
						document.getElementById('frm:fontes:0').checked=true;
						
					}
					
					function checkSelections(){
						if(document.getElementById('frm:fontes:0').checked==false){
							document.getElementById('frm:fontes:0').checked=true;
							

						}

						if(document.getElementById('frm:fontes:1').checked==true ){
							document.getElementById('frm:pesoAA').style.visibility = "visible";
						}else{
							document.getElementById('frm:pesoAA').style.visibility = "hidden";
							document.getElementById('frm:pesoAA').value = 0;
						}
						
						if(document.getElementById('frm:fontes:2').checked==true){
							document.getElementById('frm:pesoCli').style.visibility = "visible";
							document.getElementById('frm:quantCli').style.visibility = "visible";
							document.getElementById('frm:dtiniCliLabel').style.visibility = "visible";
							document.getElementById('frm:dtfinCliLabel').style.visibility = "visible";
							document.getElementById('frm:quantCliLabel').style.visibility = "visible";
							document.getElementById('frm:dataIConvite').style.visibility = "visible";
							document.getElementById('frm:dataFConvite').style.visibility = "visible";
						}else{
							document.getElementById('frm:pesoCli').style.visibility = "hidden";
							document.getElementById('frm:quantCli').style.visibility = "hidden";
							document.getElementById('frm:dtiniCliLabel').style.visibility = "hidden";
							document.getElementById('frm:dtfinCliLabel').style.visibility = "hidden";
							document.getElementById('frm:quantCliLabel').style.visibility = "hidden";
							document.getElementById('frm:dataIConvite').style.visibility = "hidden";
							document.getElementById('frm:dataFConvite').style.visibility = "hidden";
							document.getElementById('frm:dataIConvite').value = "";
							document.getElementById('frm:dataFConvite').value = "";
							document.getElementById('frm:pesoCli').value = 0;
						}
						
						if(document.getElementById('frm:fontes:3').checked==true){
							document.getElementById('frm:pesoPar').style.visibility = "visible";
						}else{
							document.getElementById('frm:pesoPar').style.visibility = "hidden";
							document.getElementById('frm:pesoPar').value = 0;
						}
						
						
					} 	
				
				</script>
			
				<h:panelGrid id="formula" columns="2" >
				
				<h:outputText value="Fontes Avaliadoras" style="color: green;"/>
				<h:outputText value="Pesos" style="color: green;"/>
				
				
				<h:panelGroup>
				<br/><br/>
				<h:selectManyCheckbox styleClass="checkbox" id="fontes"  onclick="checkSelections();" layout="pageDirection" value="#{cadastroProcessoBean.processoEdicao.formula.fontesAvaliadoras}" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					
					
					<f:selectItem itemValue="1" itemLabel="Supervisor imediato"  />
					
					<f:selectItem itemValue="2" itemLabel="Auto-avaliação" />
					 									 				
					<f:selectItem itemValue="3" itemLabel="Clientes"/>
					
					<f:selectItem itemValue="4" itemLabel="Pares" />
				
				</h:selectManyCheckbox>
				
				</h:panelGroup>
				
				
				<h:panelGroup>
				<br/><br/>
				
				<h:inputText id="pesoSI" size="4" required="false" value="#{cadastroProcessoBean.pesoSI}" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}"/><br/>

				<h:inputText id="pesoAA" size="4" required="false" value="#{cadastroProcessoBean.pesoAA}" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}"/><br/>
				
				
				<h:inputText id="pesoCli" size="4"  required="false" value="#{cadastroProcessoBean.pesoCli}" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}"/><br/>
				
			
				<h:inputText id="pesoPar" size="4" required="false"  value="#{cadastroProcessoBean.pesoPar}" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}"/><br/>
				
				<h:message for="pesoSI" showSummary="true"	showDetail="false" styleClass="msgErro"/>
				<h:message for="pesoAA" showSummary="true"	showDetail="false" styleClass="msgErro"/>
				<h:message for="pesoCli" showSummary="true"	showDetail="false" styleClass="msgErro"/>
				<h:message for="pesoPar" showSummary="true"	showDetail="false" styleClass="msgErro"/>
				</h:panelGroup>
				
				 
						
				</h:panelGrid>	
		
			</h:panelGroup>
			
			
			<h:outputLabel styleClass="label" id="quantCliLabel"  value="Quant. Clientes" style="color: green;"/>
				
			<h:panelGroup>
			<h:inputText id="quantCli" size="4"   required="false" value="#{cadastroProcessoBean.processoEdicao.formula.quantCliente}" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}"/>
			</h:panelGroup>
		
				
			<h:outputLabel id="dtiniCliLabel"  styleClass="label" value="Data inicio para convite de clientes:" style="color: green;"/>
			<h:panelGroup>
				<h:inputText id="dataIConvite" size="12" maxlength="10" value="#{cadastroProcessoBean.processoEdicao.dataInicioConvites}" required="false" label="Data Início de Convites" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:inputText>      
				<h:message for="dataIConvite" showSummary="true"	showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
				
						
			
			<h:outputLabel id="dtfinCliLabel"  styleClass="label" value="Data final para convite de clientes:" style="color: green;"/>
			<h:panelGroup>
				<h:inputText id="dataFConvite" size="12" maxlength="10" value="#{cadastroProcessoBean.processoEdicao.dataFinalConvites}" required="false" label="Data Final de Convites" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:inputText>
				<h:message for="dataFConvite" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
		
		
			<h:outputLabel styleClass="label" value="Data inicio para preenchimento e submissão de avaliações:" />
			<h:panelGroup>
				<h:inputText id="dataIPeS" size="12" maxlength="10" value="#{cadastroProcessoBean.processoEdicao.dataInicioPeS}" required="false" label="Data Início de Preenchimento e Submissão" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:inputText>
				<h:message for="dataIPeS" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
					
			<h:outputLabel styleClass="label" value="Data final para preenchimento e submissão de avaliações:"/>
			<h:panelGroup>
				<h:inputText id="dataFPeS" size="12" maxlength="10" value="#{cadastroProcessoBean.processoEdicao.dataFinalPeS}" required="false" label="Data Final de de Preenchimento e Submissão" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:inputText>
				<h:message for="dataFPeS" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
		
			<h:outputLabel styleClass="label" value="Data de parecer de recursos:"/>
			<h:panelGroup>
				<h:inputText id="dataParecer" size="12" maxlength="10" value="#{cadastroProcessoBean.processoEdicao.dataParecer}" required="false" label="Data Parecer" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:inputText>
				<h:message for="dataParecer" showSummary="true"	showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
		
			<h:outputLabel styleClass="label" value="Data inicio para Reavaliação:"/>
			<h:panelGroup>
				<h:inputText id="dataIReavaliacao" size="12" maxlength="10" value="#{cadastroProcessoBean.processoEdicao.dataInicioReAvaliacao}" required="false" label="Data Início de Reavaliação" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:inputText>
				<h:message for="dataIReavaliacao" showSummary="true"	showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
					
			<h:outputLabel styleClass="label" value="Data final para Reavaliação:"/>
			<h:panelGroup>
				<h:inputText id="dataFReavaliacao" size="12" maxlength="10" value="#{cadastroProcessoBean.processoEdicao.dataFinalReAvaliacao}" required="false" label="Data Final de Reavaliação" disabled="#{cadastroProcessoBean.processoEdicao.id != null && consultaUsuarioBean.permissaoUser.nome_permissao != 'super'}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:inputText>
				<h:message for="dataFReavaliacao" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
		
					
			
			</h:panelGrid>
	
		
			<h:panelGroup>
				<h:commandButton value="Salvar" actionListener="#{cadastroProcessoBean.salvar}" onclick="supervisorChecked(); loadingOn();" styleClass="botao" />
				<h:commandButton value="Cancelar" action="menu" immediate="true" styleClass="botao"/>
			</h:panelGroup>
		
			<CENTER>
			<h:graphicImage styleClass="centerPage2" id="loading" style="visibility:hidden;" value="../loading.gif" height="30" width="30"/>
			</CENTER>
		
			<br/><br/><br/>	
			
			
			
		<h:commandLink action="menu" styleClass="linkComEspaco" immediate="true">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>	
		
		<h:commandLink action="#{consultaProcessoBean.consultar}">
			<h:outputText value="Consulta Processos"/>
			<f:setPropertyActionListener value="#{consultaUsuarioBean.permissaoUser}"
											target="#{consultaProcessoBean.permission}"/>	
		</h:commandLink>

		
			
	</h:form>

</f:view>
</body>
</html>
