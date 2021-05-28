<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Consulta Convites Enviados</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
<f:view>

	<h:form id="frm" styleClass="centerPage">
		<h:graphicImage styleClass="imageLink" value="../topConEnv.png"/>
		<br/><br/>
		
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
		
		<h:outputText styleClass="msgErro" value="Nenhum convite foi enviado!" rendered="#{consultaConvitesBean.sizeEnviados == 0}"/>	
		<h:dataTable value="#{consultaConvitesBean.convitesEnviados}" var="item" width="790" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaInstauracao, colunaPresidente, colunaInicioConvite, colunaFinalConvite, colunaInicioPeS, colunaFinalPeS, colunaInicioReav, colunaFinalReav, colunaParecer, colunaFormula, colunaFormula" rendered="#{consultaConvitesBean.sizeEnviados != 0}">
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
					<h:outputText value="Convidado"/>
				</f:facet>
				<h:outputText value="#{item.convidado.nome}"/>
			</h:column>
			


			<h:column>
				<f:facet name="header">
					<h:outputText value="Ações"/>
				</f:facet>
				<h:commandLink action="#{consultaConvitesBean.reenviar}">
				<f:setPropertyActionListener value="#{item}"
											target="#{consultaConvitesBean.convite}"/>
						<h:graphicImage value="../reenviar.png" rendered="#{item.confirmacaoSupervisor == 'AGUARDANDO' || item.confirmacaoSupervisor == 'ACEITO'}"
										title="Reenviar"
										styleClass="imageLink"  />
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