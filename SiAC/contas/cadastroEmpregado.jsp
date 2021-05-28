<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cadastro de Empregado</title>
<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>

<body onload="checkSelections();" onunload="loadingOff();">
<body>
<f:view>

		<script language="JavaScript">
													
				function showOption(){
					var ele;
					var i;
					
					for( i=0; i<=4; i++){
						ele = document.getElementById('frm:funcao:'+i);
						if(ele.checked == true){
							alert(ele.getAttribute("value"));
						}
					}
					
				}
		</script>
	
	<h:form id="frm" styleClass="centerPage" >
		<h:graphicImage styleClass="imageLink" value="../topCadEmp.png"/>
		<br/><br/>
		<h:messages layout="table" showSummary="true" 
		showDetail="false" globalOnly="true"
		styleClass="msgErro" infoClass="msgInfo"
		style="font-weight: bold"/>
		
		<h:panelGrid columns="2"  styleClass="leftPage">
			
			<h:outputLabel styleClass="label" value="Código:" rendered="false" />
			<h:panelGroup rendered="false">
				<h:inputText id="codigo" size="10" value="#{cadastroEmpregadoBean.empregadoEdicao.id}"
				 label="Código do empregado" disabled="true"/>
				 <h:message for="codigo" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			
			<h:outputLabel styleClass="label" value="Cargo:"/>
			<h:panelGroup>
				<h:selectOneMenu id="cargo" value="#{cadastroEmpregadoBean.empregadoEdicao.cargo}"
					label="Qual o cargo do empregado?" required="true" >
					<f:selectItems value="#{cadastroEmpregadoBean.tiposCargos}"/>					
				</h:selectOneMenu>
				 <h:message for="cargo" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			<h:outputLabel styleClass="label" value="Nome:"/>
			<h:panelGroup>
				<h:inputText id="nome" size="35" maxlength="60" disabled="#{cadastroEmpregadoBean.empregadoEdicao.id != null}"
				value="#{cadastroEmpregadoBean.empregadoEdicao.nome}" required="true" label = "Nome"/>
				<h:message for="nome" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			<h:outputLabel styleClass="label" value="Função:"/>
			<h:panelGroup>
				<h:selectOneRadio layout="pageDirection" id="funcao"  value="#{cadastroEmpregadoBean.permissao_empregado.nome_permissao}"
					label="Função" required="true">
					<f:selectItem itemValue="comum" itemLabel="Empregado Comum" />
					<f:selectItem itemValue="supervisor" itemLabel="Supervisor"/>					
					<f:selectItem itemValue="comite" itemLabel="Membro de Comitê" itemDisabled="false"/>
					<f:selectItem itemValue="supervisorecomite" itemLabel="Supervisor e Membro de Comitê" itemDisabled="false"/>
					<f:selectItem itemValue="presidente" itemLabel="Presidente de Comitê" itemDisabled="false" />
				</h:selectOneRadio>
				 <h:message for="funcao" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			<h:outputLabel styleClass="label" value="Matricula"/>
			<h:panelGroup >
				<h:inputText id="matricula" size="10" maxlength="10" disabled="#{cadastroEmpregadoBean.empregadoEdicao.id != null}"
				value="#{cadastroEmpregadoBean.empregadoEdicao.matricula}" required="true" label = "Matricula">
				
				</h:inputText>
				<h:message for="matricula" showSummary="true"
					showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			
			
			<h:outputLabel styleClass="label" value="email"/>
			<h:panelGroup >
				<h:inputText id="email" size="20" maxlength="50"
				value="#{cadastroEmpregadoBean.empregadoEdicao.email}" required="true" label = "Email">
				
				</h:inputText>
				<h:message for="email" showSummary="true"
					showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			
					
						
			<h:outputLabel styleClass="label" value="Agrupamento:"/>
			<h:panelGroup>
				<h:selectOneMenu id="agrupamento"
				value="#{cadastroEmpregadoBean.empregadoEdicao.agrupamento}"
				label="Empregado" required="true">
					<f:selectItems value="#{cadastroEmpregadoBean.tiposAgrupamentos}"/>	
				</h:selectOneMenu>
				 <h:message for="agrupamento" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			<h:outputLabel styleClass="label" value="Unidade"/>
			<h:panelGroup>
				<h:inputText id="unidade" size="10" maxlength="10" value="#{cadastroEmpregadoBean.empregadoEdicao.unidade}" required="true" label="Unidade de lotação">
					
				</h:inputText>
				<h:message for="unidade" showSummary="true"	showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
		   <h:outputLabel styleClass="label" value="Supervisor"/>
			<h:panelGroup>
				<h:selectOneMenu id="supervisor" 
				value="#{cadastroEmpregadoBean.empregadoEdicao.supervisor}"
				label="Supervisor" >
					<f:selectItems value="#{cadastroEmpregadoBean.supervisores}"/>	
				</h:selectOneMenu>
				 <h:message for="supervisor" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
			
			
			<h:outputLabel styleClass="label" value="Código de afastamento"/>
			<h:panelGroup>
				<h:inputText id="codigoAfastamento" size="12" maxlength="10" value="#{cadastroEmpregadoBean.empregadoEdicao.codigoAfastamento}" label="Código de afastamento">
				
				</h:inputText>
				<h:message for="codigoAfastamento" showSummary="true" showDetail="false" styleClass="msgErro"/>
			</h:panelGroup>
		
		
			
		</h:panelGrid>
		
		<br/>
		<h:panelGroup  styleClass="centerPage">
				<h:commandButton value="Salvar" actionListener="#{cadastroEmpregadoBean.salvar}" styleClass="botao">
					<f:setPropertyActionListener value="true"
											target="#{cadastroEmpregadoBean.novo}"/>
				</h:commandButton>
				<h:commandButton value="Cancelar" action="menu" immediate="true" styleClass="botao"/>
		</h:panelGroup>
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco" immediate="true">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
		
		<h:commandLink action="consultaEmpregado" actionListener="#{consultaEmpregadoBean.consultar}" styleClass="linkComEspaco" immediate="true">
			<h:outputText value="Consulta de Empregados"/>
		</h:commandLink>		
		
		<h:commandLink action="carregaEmpregado" styleClass="linkComEspaco" immediate="true">
			<h:outputText value="Carregar lista de empregados"/>
		</h:commandLink>		
	</h:form>


</f:view>
</body>
</html>