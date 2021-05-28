<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Consulta Empregado</title>
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
		<h:graphicImage  value="../topConEmp.png"/>
		<br/><br/>
		
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
			
		<h:dataTable value="#{consultaEmpregadoBean.empregados}" var="item" width="1400" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaPadrao">
	
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{consultaEmpregadoBean.ordenarPorNome}" styleClass="linkComEspaco">
						<h:outputText value="Empregado" rendered="true" />
					</h:commandLink>
				</f:facet>
				<h:outputText value="#{item.nome}"/>
			</h:column>
				
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{consultaEmpregadoBean.ordenarPorMatricula}" styleClass="linkComEspaco">
						<h:outputText value="Matricula" rendered="true" />
					</h:commandLink>
					
				</f:facet>
				<h:outputText value="#{item.matricula}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{consultaEmpregadoBean.ordenarPorCargo}" styleClass="linkComEspaco">
						<h:outputText value="Cargo" rendered="true" />
					</h:commandLink>
					
				</f:facet>
				<h:outputText value="#{item.cargo}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{consultaEmpregadoBean.ordenarPorAgrupamento}" styleClass="linkComEspaco">
						<h:outputText value="Agrupamento" rendered="true" />
					</h:commandLink>
				</f:facet>
				<h:outputText value="#{item.agrupamento}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{consultaEmpregadoBean.ordenarPorSupervisor}" styleClass="linkComEspaco">
						<h:outputText value="Supervisor" rendered="true" />
					</h:commandLink>
				</f:facet>
				<h:outputText value="#{item.supervisor.nome}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Unidade" rendered="true" />
				</f:facet>
				<h:outputText value="#{item.unidade}"/>
			</h:column>
				
			<h:column>
				<f:facet name="header">
					<h:outputText value="Codigo de Afastamento" rendered="true" />
				</f:facet>
				<h:outputText value="#{item.codigoAfastamento}" />
				<h:outputText value=" Não possui " rendered="#{item.codigoAfastamento eq '' or item.codigoAfastamento eq null}" />
			</h:column>
			
			

			<h:column>
				<f:facet name="header">
					<h:outputText value="Ações"/>
				</f:facet>
				
				<h:panelGroup styleClass="centerPage2" >
				<h:commandLink action="#{consultaEmpregadoBean.excluir}" onclick="return confirm('Confirma exclusão do empregado #{item.nome}?');" >
				<f:setPropertyActionListener value="#{item}"
											target="#{consultaEmpregadoBean.empregadoExclusao}"/>
						<h:graphicImage value="../delete.png" alt="Excluir"
										title="Excluir Empregado do Sistema"
										styleClass="imageLink"  />
				</h:commandLink>
				
				<h:commandLink action="cadastroEmpregado">
				<f:setPropertyActionListener value="#{item}"
											target="#{cadastroEmpregadoBean.empregadoEdicao}"/>
				<f:setPropertyActionListener value="#{false}"
											target="#{cadastroEmpregadoBean.novo}"/>

				
						
						<h:graphicImage id="editar" value="../editarLapisAzul.png" alt="Editar"
										title="Editar Dados do Empregado"
										styleClass="imageLink"  />
						
						
				</h:commandLink>


								
				<h:commandLink action="#{cadastraReavaliacaoBean.consultar}" > 
				<f:setPropertyActionListener value="#{item}"
											target="#{cadastraReavaliacaoBean.requisitante}"/>
				
							
							
						<h:graphicImage id="imgReav" value="../reavaliacao.png" alt="Reavaliação" 
										title="Gerar Reavaliação" rendered="#{consultaUsuarioBean.reavaliacaoPeriodActive}"
										styleClass="imageLink" />
				</h:commandLink>
				
				
					<h:commandLink action="#{consultaEmpregadoBean.lembrarSenha}" > 
				<f:setPropertyActionListener value="#{item}"
											target="#{consultaEmpregadoBean.empregadoExclusao}"/>
				
							
							
						<h:graphicImage value="../botaolemSen.png" alt="Lembrar Senha" 
										title="Lembrar Senha"
										styleClass="imageLink" />
				</h:commandLink>
				
				</h:panelGroup>
			</h:column>
		
				
			
		</h:dataTable>
		
		<h:graphicImage styleClass="centerPage2" id="loading" style="visibility:hidden;" value="../loading.gif" height="30" width="30"/>
		<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
		
		<h:commandLink action="#{cadastroEmpregadoBean.inicializar}" styleClass="linkComEspaco">
			<h:outputText value="Cadastrar novo empregado"/>
			
		</h:commandLink>
		
		
		
		<h:commandLink action="#{consultaEmpregadoBean.excluirTodos}" onclick=" if(confirm('ATENÇÃO! Confirma exclusão de todos os empregados do sistema?') ){loadingOn(); return true}else{return false} ;" styleClass="linkComEspaco">
			<h:outputText value="Excluir todos empregados"/>
			
		</h:commandLink>
	</h:form>

</f:view>
</body>
</html>