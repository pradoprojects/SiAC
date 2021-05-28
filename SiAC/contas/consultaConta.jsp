<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Consulta conta</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
<f:view>

	<h:form id="frm">
		<h1> <h:outputText value="Consulta de contas"/></h1>
		
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
			
		<h:dataTable value="#{consultaContaBean.contas}" var="item" width="900" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa, colunaDescricao, colunaValor, colunaVencimento, colunaAberta, colunaAcoes">
			<h:column>
				<f:facet name="header">
					<h:outputText value="Tipo"/>
				</f:facet>
				<h:graphicImage value="../receita.png" title="Conta a receber" rendered="#{item.tipo eq 'RECEITA'}"/>
				<h:graphicImage value="../despesa.png" title="Conta a pagar" rendered="#{item.tipo eq 'DESPESA'}"/>
			</h:column>


			<h:column>
				<f:facet name="header">
					<h:outputText value="Empregado" rendered="true" />
				</f:facet>
				<h:outputText value="#{item.empregado.nome}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Descrição"/>
				</f:facet>
				<h:outputText value="#{item.descricao}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Valor"/>
				</f:facet>
				<h:outputText value="#{item.valor}" style="color: #{item.tipo eq 'RECEITA' ? 'blue' : 'red'} ">
					<f:convertNumber minFractionDigits="2" currencyCode="BRL" type="currency"/>
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Vencimento"/>
				</f:facet>
				<h:outputText value="#{item.dataVencimento}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Aberta"/>
				</f:facet>
				<h:outputText value="#{item.dataBaixa == null ? 'Sim' : 'Não'}"/>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Ações"/>
				</f:facet>
				<h:commandLink action="#{consultaContaBean.excluir}">
				<f:setPropertyActionListener value="#{item}"
											target="#{consultaContaBean.contaExclusao}"/>
						<h:graphicImage value="../excluir.png"
										title="Excluir"
										styleClass="imagemLink" height="50" width="50" />
				</h:commandLink>
				
				<h:commandLink action="cadastroConta">
				<f:setPropertyActionListener value="#{item}"
											target="#{cadastroContaBean.contaEdicao}"/>
						<h:graphicImage value="../editar.png"
										title="Editar"
										styleClass="imagemLink" height="50" width="50" />
				</h:commandLink>
				
				
			</h:column>
			
			
				
			
		</h:dataTable>
		
		<br/><br/><br/>	
		<h:commandLink action="#{cadastroContaBean.inicializar}" styleClass="linkComEspaco">
			<h:outputText value="Nova conta"/>
		</h:commandLink>
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
	</h:form>

</f:view>
</body>
</html>