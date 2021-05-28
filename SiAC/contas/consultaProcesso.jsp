<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Consulta processo</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body  onunload="loadingOff();">
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
		<h:graphicImage styleClass="imageLink" value="../topConProc.png"/>
		<br/><br/>
		<h:messages layout="table" showSummary="true" showDetail="false" globalOnly="true" styleClass="msgErro" infoClass="msgInfo" style="font-weight: bold"/>
		
		<h:outputText styleClass="msgErro" value="Não há processos cadastrados!" rendered="#{consultaProcessoBean.sizeProcessos == 0}"/>
		<h:dataTable id="dt" rendered="#{consultaProcessoBean.sizeProcessos != 0}" value="#{consultaProcessoBean.processos}"  var="item" width="700" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao, colunaPadrao">
			
			
			
			<h:column >
				<f:facet name="header">
					<h:outputText value="Tipo" rendered="true"/>
				</f:facet>
				<h:graphicImage value="../processo.png" title="Processo" height="50" width="50"/>
				
			</h:column>


			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Instauração"/>
				</f:facet>
				<h:outputText value="#{item.dataInstauracao}">
				<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Presidente"/>
				</f:facet>
				<h:outputText value="#{item.presidente.nome}"/>
				
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Início Convites"/>
				</f:facet>
				<h:outputText value="#{item.dataInicioConvites}">
				<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Final Convites"/>
					
				</f:facet>
				<h:outputText value="#{item.dataFinalConvites}">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Inicio Preenchimento/submissão"/>
				</f:facet>
				<h:outputText value="#{item.dataInicioPeS}">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Final Preenchimento/submissão"/>
				</f:facet>
				<h:outputText value="#{item.dataFinalPeS}">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Parecer Recursos"/>
				</f:facet>
				<h:outputText value="#{item.dataParecer}">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Inicio Reavaliação"/>
				</f:facet>
				<h:outputText value="#{item.dataInicioReAvaliacao}">
				<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Data Final Reavaliação"/>
				</f:facet>
				<h:outputText value="#{item.dataFinalReAvaliacao}">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</h:outputText>
			</h:column>
			
		
			
			<h:column>
				<f:facet name="header">
					<h:outputText value="Formula"/>
				</f:facet>
				<h:selectManyCheckbox id="fontes" value="#{item.formula.fontesAvaliadoras}" layout="lineDirection" disabled="true" >
					<f:selectItem itemValue="1" itemLabel="Supervisor imediato (Peso: #{item.formula.pesos[0]})"  itemDisabled="true" />
					<f:selectItem itemValue="2" itemLabel="Auto-avaliação (Peso: #{item.formula.pesos[1]})"/>
					<f:selectItem itemValue="3" itemLabel="Clientes  (Peso: #{item.formula.pesos[2]})"/>  
					<f:selectItem itemValue="4" itemLabel="Pares  (Peso: #{item.formula.pesos[3]})" />
				</h:selectManyCheckbox>
			
			</h:column>
			
			<h:column rendered="#{consultaProcessoBean.sizeProcessos != 0 && ((consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite') || (consultaUsuarioBean.permissaoUser.nome_permissao == 'comite' )||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente' ))}">
			
				<f:facet name="header">
					<h:outputText value="Ações"/>
				</f:facet>
				
				<h:panelGrid columns="4">	
				
				<h:panelGroup>
				<h:commandLink action="#{consultaProcessoBean.excluir}" onclick="return confirm('Confirma exclusão do processo #{item.id}?');">
				<f:setPropertyActionListener value="#{item}"
											target="#{consultaProcessoBean.processoExclusao}"/>
						<h:graphicImage value="../delete.png"
										title="Excluir"
										styleClass="imageLink" />
				</h:commandLink>
				</h:panelGroup>
				
				<h:panelGroup>
				<h:commandLink action="cadastroProcesso">
				<f:setPropertyActionListener value="#{item}"
											target="#{cadastroProcessoBean.processoEdicao}"/>
				<f:setPropertyActionListener value="#{null}"
											target="#{cadastroProcessoBean.comite}"/>
						<h:graphicImage value="../editarLapisAzul.png"
										title="Editar"
										styleClass="imageLink"  />
				</h:commandLink>
				</h:panelGroup>
				
				
				<h:panelGroup>
				<h:commandLink action="#{consultaLogBean.consultar}" rendered="#{(consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')}">
				<f:setPropertyActionListener value="#{consultaUsuarioBean.currentProcess}"
													target="#{consultaLogBean.processoOwner}"/>
					<h:graphicImage styleClass="imageLink" value="../botaoLog.png"  alt="logs"/>			
				</h:commandLink>
				</h:panelGroup>
			
			
				
				<h:panelGroup>
				<h:commandLink action="#{consultaProcessoBean.notificaEmpregados}" rendered="#{item.ativo && (consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')}">
				<f:setPropertyActionListener value="#{item}"
													target="#{consultaProcessoBean.processoExclusao}"/>
					<h:graphicImage styleClass="imageLink" onclick="loadingOn();"  value="../botaoNotificar.png" alt="Avisar empregados por e-mail sobre o processo" />			
				</h:commandLink>
				</h:panelGroup>
				
				<h:panelGroup>
				<h:commandLink action="#{consultaProcessoBean.geraAvaliacoes}" rendered="#{item.ativo && (consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')}">
				<f:setPropertyActionListener value="#{item}"
													target="#{consultaProcessoBean.processoExclusao}"/>
					<h:graphicImage styleClass="imageLink" onclick="loadingOn();" value="../botaoGeraAvaliacao.png" alt="Gera as avaliações de todos os empregados para este processo" />			
				</h:commandLink>
				</h:panelGroup>
				
				<h:panelGroup>
				<h:commandLink action="#{ajusteClientesBean.consultar}" rendered="#{(item.ativo && ( (consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')))&&(!consultaProcessoBean.lstIncompletosEmpty)}">
				<f:setPropertyActionListener value="#{item}"
													target="#{ajusteClientesBean.procAjuste}"/>
					<h:graphicImage styleClass="imageLink" onclick="loadingOn();" value="../ajusteClientes.png" alt="Ajuste de clientes para empregados." />			
				</h:commandLink>
				</h:panelGroup>
			
			
				
			</h:panelGrid>
				
			</h:column>
			
			<h:column rendered="#{consultaProcessoBean.sizeProcessos != 0 && ((consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite') || (consultaUsuarioBean.permissaoUser.nome_permissao == 'comite' )||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente' ))}">
				<f:facet name="header">
					<h:outputText value="Processo Ativo"/>
				</f:facet>
				
				<script language="JavaScript">
					function clearPriorSelection(sizeProcessos){
						var k;
															
						for(k=0; k<sizeProcessos; k++){
							
							document.getElementById('frm:dt:'+k+':ativo:0').checked = false;
	
						}
				
					}
							
				</script>
				<h:selectOneRadio id="ativo"  value="#{item.ativo}" label=""  onmousedown="clearPriorSelection(#{consultaProcessoBean.sizeProcessos});" >
						<f:selectItem  itemValue="true" />
				</h:selectOneRadio>
			</h:column>

			
			
		</h:dataTable>
		
		<CENTER>
			<h:graphicImage styleClass="centerPage2" id="loading" style="visibility:hidden;" value="../loading.gif" height="30" width="30"/>
		</CENTER>
		
		<br/><br/><br/>	
		
		<h:commandLink action="menu" styleClass="linkComEspaco">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>
		
		
		<h:commandLink action="#{cadastroProcessoBean.inicializar}" styleClass="linkComEspaco">
			<h:outputText value="Novo Processo" rendered="#{((consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite') || (consultaUsuarioBean.permissaoUser.nome_permissao == 'comite' )||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente' ))}"/>
		</h:commandLink>
		
		
		<h:commandLink value=" Log de eventos offline " styleClass="linkComEspaco" action="#{consultaProcessoBean.downloadOffline}" immediate="true" rendered="#{((consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite') || (consultaUsuarioBean.permissaoUser.nome_permissao == 'comite' )||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente' ))}"/>
		
		
		<h:commandLink rendered="#{consultaProcessoBean.sizeProcessos != 0 && ((consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite') || (consultaUsuarioBean.permissaoUser.nome_permissao == 'comite' )||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente' ))}" action="#{consultaProcessoBean.salvar}" styleClass="linkComEspaco">
			<h:outputText value="Salvar"/>
		</h:commandLink>
		
		
		<br/>
		
		
		
	</h:form>

</f:view>
</body>
</html>