<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Consulta Convites Recebidos</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
<f:view>

	<h:form id="frm" styleClass="centerPage">
		<h:graphicImage styleClass="imageLink" value="../topConRec.png"/>
		<br/><br/>
		
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>

		<h:outputText styleClass="msgErro" value="Nenhum convite foi recebido!" rendered="#{consultaConvitesBean.sizeRecebidos == 0}"/>			
		<h:dataTable value="#{consultaConvitesBean.convitesRecebidos}" var="item" width="790" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaInstauracao, colunaPresidente, colunaInicioConvite, colunaFinalConvite, colunaInicioPeS, colunaFinalPeS, colunaInicioReav, colunaFinalReav, colunaParecer, colunaFormula, colunaFormula" rendered="#{consultaConvitesBean.sizeRecebidos!= 0}" > 
			<h:column>
				<f:facet name="header">
					<h:outputText value="Status Final" rendered="true"/>
				</f:facet>
				<h:graphicImage value="../espera.png" title="Aguardando"  rendered="#{item.aceite eq 'AGUARDANDO' }"/>
				<h:graphicImage value="../negado.png" title="rejeitado"  rendered="#{item.aceite eq 'NEGADO'}"/>
				<h:graphicImage value="../aceito.png" title="aceito"  rendered="#{item.aceite eq 'ACEITO' && item.confirmacaoSupervisor eq 'ACEITO'}"/>
				
				
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Aprovação Convidado" rendered="true"/>
				</f:facet>
				<h:graphicImage value="../espera.png" title="Aguardando"rendered="#{item.confirmacaoConvidado eq 'AGUARDANDO'}"/>
				<h:graphicImage value="../negado.png" title="rejeitado"  rendered="#{item.confirmacaoConvidado eq 'NEGADO'}"/>
				<h:graphicImage value="../aceito.png" title="aceito" rendered="#{item.confirmacaoConvidado eq 'ACEITO'}"/>
				
				
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Aprovação Supervisor" rendered="true"/>
				</f:facet>
				<h:graphicImage value="../espera.png" title="Aguardando"rendered="#{item.confirmacaoSupervisor eq 'AGUARDANDO'}"/>
				<h:graphicImage value="../negado.png" title="rejeitado"  rendered="#{item.confirmacaoSupervisor eq 'NEGADO'}"/>
				<h:graphicImage value="../aceito.png" title="aceito" rendered="#{item.confirmacaoSupervisor eq 'ACEITO'}"/>
				
				
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Envio"/>
				</f:facet>
				<h:outputText value="#{item.dataConvite}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Requisitante"/>
				</f:facet>
				<h:outputText value="#{item.requisitante.nome}"/>
			</h:column>
			


			<h:column>
				<f:facet name="header">
					<h:outputText value="Ações"/>
				</f:facet>
				<h:commandLink action="#{consultaConvitesBean.negar}">
				<f:setPropertyActionListener value="#{item}"
											target="#{consultaConvitesBean.convite}"/>
						<h:graphicImage value="../polegar_down.png" rendered="#{item.aceite eq 'AGUARDANDO'}"
										title="Rejeitar"
										styleClass="imagemLink"  />
						
				</h:commandLink>
				
				<h:commandLink action="#{consultaConvitesBean.aceitar}">
				<f:setPropertyActionListener value="#{item}"
											target="#{consultaConvitesBean.convite}"/>
						<h:graphicImage value="../polegar_up.png" rendered="#{item.aceite eq 'AGUARDANDO'}"
										title="Aceitar"
										styleClass="imagemLink"  />
				</h:commandLink>
				<br/>
				<h:outputText value="#{item.aceite}"/>
				
			</h:column>
			
		</h:dataTable>
		<br/>
		
		<h3>
		<h:outputText value="Convites feitos pelos subordinados" rendered="#{consultaConvitesBean.sizeSubordinados != 0}"/>
		</h3>
		<h:outputText styleClass="msgErro" value="Não há convites para os seus subordinados!" rendered="#{(consultaUsuarioBean.permissaoUser == 'supervisor' || consultaUsuarioBean.permissaoUser == 'supervisorecomite'|| consultaUsuarioBean.permissaoUser == 'presidente')&& consultaConvitesBean.sizeSubordinados == 0}"/>
		<h:dataTable value="#{consultaConvitesBean.convitesSubordinados}" var="item2" width="790" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaInstauracao, colunaPresidente, colunaInicioConvite, colunaFinalConvite, colunaInicioPeS, colunaFinalPeS, colunaInicioReav, colunaFinalReav, colunaParecer, colunaFormula, colunaFormula" rendered="#{consultaConvitesBean.sizeSubordinados != 0}" >
			<h:column>
				<f:facet name="header">
					<h:outputText value="Status Final" rendered="true"/>
				</f:facet>
				<h:graphicImage value="../espera.png" title="Aguardando"  rendered="#{item2.aceite eq 'AGUARDANDO'}"/>
				<h:graphicImage value="../negado.png" title="rejeitado"  rendered="#{item2.aceite eq 'NEGADO'}"/>
				<h:graphicImage value="../aceito.png" title="aceito"  rendered="#{item2.aceite eq 'ACEITO' && item2.confirmacaoSupervisor eq 'ACEITO'}"/>
				
				
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Aprovação Convidado" rendered="true"/>
				</f:facet>
				<h:graphicImage value="../espera.png" title="Aguardando" rendered="#{item2.confirmacaoConvidado eq 'AGUARDANDO'}"/>
				<h:graphicImage value="../negado.png" title="rejeitado"  rendered="#{item2.confirmacaoConvidado eq 'NEGADO'}"/>
				<h:graphicImage value="../aceito.png" title="aceito" rendered="#{item2.confirmacaoConvidado eq 'ACEITO'}"/>
				
				
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Aprovação Supervisor" rendered="true"/>
				</f:facet>
				<h:graphicImage value="../espera.png" title="Aguardando" rendered="#{item2.confirmacaoSupervisor eq 'AGUARDANDO'}"/>
				<h:graphicImage value="../negado.png" title="rejeitado"  rendered="#{item2.confirmacaoSupervisor eq 'NEGADO'}"/>
				<h:graphicImage value="../aceito.png" title="aceito" rendered="#{item2.confirmacaoSupervisor eq 'ACEITO'}"/>
				
				
			</h:column>


			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Envio"/>
				</f:facet>
				<h:outputText value="#{item2.dataConvite}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Requisitante"/>
				</f:facet>
				<h:outputText value="#{item2.requisitante.nome}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Convidado"/>
				</f:facet>
				<h:outputText value="#{item2.convidado.nome}"/>
			</h:column>
			


			<h:column>
				<f:facet name="header">
					<h:outputText value="Ações"/>
				</f:facet>
				<h:commandLink action="#{consultaConvitesBean.negarSubordinado}" >
				<f:setPropertyActionListener value="#{item2}"
											target="#{consultaConvitesBean.convite}"/>
						<h:graphicImage value="../rejeitar.png" 
										title="Rejeitar"
										styleClass="imagemLink" />
				</h:commandLink>
				
				<h:commandLink action="#{consultaConvitesBean.aceitarSubordinado}">
				<f:setPropertyActionListener value="#{item2}"
											target="#{consultaConvitesBean.convite}"/>
						<h:graphicImage value="../aprovar.png" 
										title="Aprovar"
										styleClass="imagemLink"  />
				</h:commandLink>
				
				
			</h:column>
			
		</h:dataTable>
		
		
		
		
		
		<br/><br/><br/>	
	
		<h:commandLink action="menu">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
		
		<br/>
		
		
	</h:form>

</f:view>
</body>
</html>