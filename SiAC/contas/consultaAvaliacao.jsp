<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Consulta Avaliação</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
<f:view>

	<h:form id="frm" styleClass="centerPage">
	
		<h:graphicImage styleClass="imageLink" value="../topConsAval.png"/>
		<br/><br/>
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
			
		<h:outputText value="Não há avaliações a serem preenchidas" rendered="#{consultaAvaliacaoBean.hasAvaliacoes == false}" styleClass="msgErro"/>
		<h:dataTable value="#{consultaAvaliacaoBean.avaliacoes}" rendered="#{consultaAvaliacaoBean.hasAvaliacoes == true}" var="item" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaAcoes">
			
						
			<h:column>
				<f:facet name="header">
					<h:outputText value="Empregado" rendered="true" />
				</f:facet>
				<h:panelGrid>
				<h:outputText value="#{item.avaliado.nome}"/>
				</h:panelGrid>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Tipo de Avaliação" rendered="true" />
				</f:facet>
				<h:panelGrid>
				<h:outputText value="Reavaliação" rendered="#{item.tipoReavaliacao}"/>
				<h:outputText value="Avaliação" rendered="#{!item.tipoReavaliacao}"/>
				</h:panelGrid>
			</h:column>
			

			<h:column>
				
				
				<f:facet name="header">
					<h:outputText value="Ações"/>
				</f:facet>
				<h:panelGrid>
				
				<h:panelGroup styleClass="centerPage2">
				
				
				
				
				
							
				
				<h:commandLink action="preencheAvaliacao">
				<f:setPropertyActionListener value="#{item}"
											target="#{preencheAvaliacaoBean.avaliacaoEdicao}"/>
				<!-- Comando para repassar a informaçao de login para o Bean ativo trabalhar dentro do perfil do usuario -->
				<f:setPropertyActionListener value="#{facesContext.externalContext.userPrincipal.name}"
											target="#{preencheAvaliacaoBean.userLogin}"/>							
						<h:graphicImage value="../avaliar.png"
										title="Editar"
										styleClass="imagemLink" height="50" width="50" />
				</h:commandLink>
				
				</h:panelGroup>
				
				</h:panelGrid>
				
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Papel Avaliador" rendered="true" />
				</f:facet>
				<h:panelGrid>
				<h:outputText value="#{item.tipoAvaliador}"/>
				
				</h:panelGrid>
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