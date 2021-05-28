<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SiAC</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
	
</head>
<body style="background-image: URL(../targetree3.png); background-repeat: no-repeat;
	background-position: center; background-attachment: fixed; " onunload="loadingOff();">
<f:view >
	<h:form id="frm"  styleClass="centerPage"  >


	
		<br/><br/><br/><br/><br/><br/>	
		
		<h:panelGrid columns="2" styleClass="leftAlign">
	
	
		<h:panelGroup  >
		<br/>
		
			<h:graphicImage styleClass="imageLink" value="../topo.png" />	
			
	
		
		</h:panelGroup>
		<h:panelGroup/>
<h:panelGroup  style="padding-right: 5px;">
		<CENTER>
		<h2><h:outputText value=" Bem vindo #{consultaUsuarioBean.userName}!" /></h2>
		<h:graphicImage styleClass="centerPage2" id="loading" style="visibility:hidden;" value="../loading.gif" height="30" width="30"/>
		</CENTER>
		
	<h:panelGroup>
		
		
		
		
		<h:panelGroup>
		<br/>
		<h:commandLink action="#{alteraSenhaBean.inicializar}">
			<h:graphicImage styleClass="imageLink" value="../botaoAltSen.png" onclick="loadingOn();"/>	
			<f:setPropertyActionListener value="#{consultaUsuarioBean.activeUser}"
											target="#{alteraSenhaBean.activeUser}"/>		
			<f:setPropertyActionListener value="#{consultaUsuarioBean.permissaoUser}"
											target="#{alteraSenhaBean.permissaoUser}"/>
		</h:commandLink>
		
		</h:panelGroup>
		
		
		<h:panelGroup   rendered="#{(consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')}">
		<br/>
		<h:commandLink action="#{cadastroEmpregadoBean.inicializar}" >
			<h:graphicImage styleClass="imageLink" value="../botaoCadEmp.png" onclick="loadingOn();"/>
			
		</h:commandLink>
		
		
		</h:panelGroup>
		
		<h:panelGroup rendered="#{(consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')}">
		<br/>
		<h:commandLink action="consultaEmpregado" actionListener="#{consultaEmpregadoBean.consultar}">
			<h:graphicImage styleClass="imageLink" value="../botaoConEmp.png" onclick="loadingOn();"/>
		</h:commandLink>
									
		</h:panelGroup>
		
		
		<h:panelGroup rendered="#{(consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')}">
		<br/>
		<h:commandLink action="#{cadastroProcessoBean.inicializar}">
			<h:graphicImage styleClass="imageLink" value="../botaoCadPro.png" onclick="loadingOn();"/>
		</h:commandLink>
		
		
		</h:panelGroup>
		
		<h:panelGroup >
		<br/>
		<h:commandLink action="#{consultaProcessoBean.consultar}">
			<h:graphicImage styleClass="imageLink" value="../botaoConPro.png" onclick="loadingOn();"/>
			<f:setPropertyActionListener value="#{consultaUsuarioBean.permissaoUser}"
											target="#{consultaProcessoBean.permission}"/>	
		</h:commandLink>	
					
		</h:panelGroup>
		
			
		<h:panelGroup >
		<br/>
		<h:commandLink action="#{consultaAvaliacaoBean.consultar}">
			<h:graphicImage styleClass="imageLink" value="../botaoAV.png" onclick="loadingOn();"/>
			<f:setPropertyActionListener value="#{facesContext.externalContext.userPrincipal.name}"
											target="#{consultaAvaliacaoBean.userLogin}" />	
			
			
		</h:commandLink>
		</h:panelGroup>
			
		<h:panelGroup>
		<br/>
		<h:commandLink action="#{consultaResultadoBean.consultaNota}">
		<f:setPropertyActionListener value="#{consultaUsuarioBean.activeUser}"
											target="#{consultaResultadoBean.activeUser}"/>
		<f:setPropertyActionListener value="#{consultaUsuarioBean.currentProcess}"
											target="#{consultaResultadoBean.activeProcess}"/>
			<h:graphicImage styleClass="imageLink" value="../botaoConRes.png" onclick="loadingOn();"/>	
		</h:commandLink>
		</h:panelGroup>
		
		<h:panelGroup  rendered="#{(consultaUsuarioBean.permissaoUser.nome_permissao == 'presidente') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'super') ||(consultaUsuarioBean.permissaoUser.nome_permissao == 'comite')||(consultaUsuarioBean.permissaoUser.nome_permissao == 'supervisorecomite')}">
		<br/>
		<h:commandLink action="#{consultaRelatorioBean.consultar}" >
		<f:setPropertyActionListener value="#{consultaUsuarioBean.currentProcess}"
											target="#{consultaRelatorioBean.activeProcess}"/>
			<h:graphicImage styleClass="imageLink" value="../botaoConRel.png" onclick="loadingOn();"/>
			
		</h:commandLink>
				
		</h:panelGroup>
		
		
		
		<h:panelGroup rendered="#{consultaUsuarioBean.clientPeriodActive}">
		<br/>
		<h:commandLink action="#{envioConviteBean.inicializar}">
			<h:graphicImage styleClass="imageLink" value="../botaoEnvCon.png" onclick="loadingOn();"/>
		</h:commandLink>
		
		
				
		</h:panelGroup>
		
		<h:panelGroup rendered="#{consultaUsuarioBean.clientChoiceActive}">
		<br/>
		<h:commandLink action="#{consultaConvitesBean.consultar}">
		<h:graphicImage styleClass="imageLink" value="../botaoConRec.png" onclick="loadingOn();"/>			
		</h:commandLink>
		
			
		</h:panelGroup>
		
		<h:panelGroup rendered="#{consultaUsuarioBean.clientChoiceActive}">
		<br/>
		<h:commandLink action="#{consultaConvitesBean.consultarEnviados}">
			<h:graphicImage styleClass="imageLink" value="../botaoConEnv.png" onclick="loadingOn();"/>			
		</h:commandLink>
		</h:panelGroup>
		
		
		<h:panelGroup/>

		
		
	
		
		

		
	
		
	</h:panelGroup>
	<CENTER>
		<h:outputLink value="logout.jsp">
			<h2> <h:outputText value="Sair"/> </h2>
		</h:outputLink>
	</CENTER>

</h:panelGroup>
		
		
		
		<h:panelGroup/>
		

		</h:panelGrid>
	 </h:form>
</f:view>

		<script language="JavaScript">		
					
					function loadingOn(){
							document.getElementById('frm:loading').style.visibility = "visible";						
					}
						
					function loadingOff(){
						document.getElementById('frm:loading').style.visibility = "hidden";						
				}	
					
				
				</script>
</body>
</html>