<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Avaliação</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />

</head>

<body>


<f:view>

	<h:form id="frm" styleClass="centerPage"  >
		
		<h1>
		<h:graphicImage value="../lupa.png" title="Avaliação"
		styleClass="imagemLink" height="70" width="70" />
		<h:outputText value="Avaliação"/>
		</h1>
		
		
		<h:messages layout="table" showSummary="true" 
		showDetail="false" globalOnly="true"
		styleClass="msgErro" infoClass="msgInfo"
		style="font-weight: bold"/>
		
		<h:panelGrid id="grid" columns="2" rendered="#{preencheAvaliacaoBean.avaliacaoEdicao.competencias != null}">
			
			<h:panelGrid  id="gradCod" columns="2" width="608" >
			
			<h:panelGroup rendered="#{preencheAvaliacaoBean.avaliacaoEdicao.id != null}">
				<h:outputText value="Código:" rendered="#{preencheAvaliacaoBean.avaliacaoEdicao.id != null}" />
				<h:outputText id="codigo"  value="#{preencheAvaliacaoBean.avaliacaoEdicao.id}" />
				
			</h:panelGroup>
			</h:panelGrid>
			
			<h:panelGroup/>
			<h:panelGrid  id="gradAvaliadorAvaliado" columns="2" width="608" styleClass="linhaAvaliador" >
			
			<h:panelGroup styleClass="centerPage2" > 
			<center>
			<h:outputLabel value="Avaliador:	"/>
			<h:outputText  value="#{preencheAvaliacaoBean.avaliacaoEdicao.avaliador.nome}"/>
			</center>
			</h:panelGroup>
			
			
								
			<h:panelGroup styleClass="centerPage2" > 
			<center>
				<h:outputLabel value="Avaliado:	"/>
				<h:outputText id="avaliado"  value="#{preencheAvaliacaoBean.avaliacaoEdicao.avaliado.nome}"/>
				</center>
			</h:panelGroup>
			
			
			</h:panelGrid>
			<br/>
			
			<h:panelGroup>
			<h:panelGrid  id="gradEscala" columns="1" width="608" styleClass="linhaEscala" >
			
			<h:outputLabel value=".:Instrução " styleClass="tituloEscala"/>
			
			<h:panelGroup>
				<h:outputText id="instrucao" 
				value="Selecione, de acordo com a escala dada, a nota para cada competência avaliada." />
				
			</h:panelGroup>
			
			<br/>
			
			<h:outputLabel value=".:Escala de Avaliação" styleClass="tituloEscala"/>
			<h:panelGroup>
			<h:outputText id="escala"  
				value="1: Não Apresenta - 2: Apresenta parcialmente - 3: Apresenta plenamente - 4: Supera" />
			</h:panelGroup>
			
			<h:panelGroup/>
			</h:panelGrid>
			</h:panelGroup>
			
			<h:panelGroup/>
			
			<h:panelGroup  rendered="#{preencheAvaliacaoBean.avaliacaoEdicao != null}" id="pg" styleClass="centerPage">
							
				
				<h:outputText value="Assistente, classe A" rendered="#{preencheAvaliacaoBean.avaliacaoEdicao.avaliado.cargo eq 'ASSISTENTE_A'}" styleClass="msgAlerta"/>
				<h:outputText value="Analista, Pesquisador e Gerentes" rendered="#{preencheAvaliacaoBean.avaliacaoEdicao.avaliado.cargo eq 'ANALISTA_ou_PESQUISADOR'}" styleClass="msgAlerta"/>
				<h:outputText value="Assistente, classes B e C" rendered="#{preencheAvaliacaoBean.avaliacaoEdicao.avaliado.cargo eq 'ASSISTENTE_B_ou_C'}" styleClass="msgAlerta"/>
							
				<h:dataTable id="dt1" value="#{preencheAvaliacaoBean.avaliacaoEdicao.competencias}" var="item" styleClass="tabela" headerClass="cabecalhoTabela" rowClasses = "linha1Tabela, linha2Tabela" columnClasses="colunaTipo, colunaPessoa">
																					
									<h:column id="c1"> 
											
										<f:facet name="header">
											<h:outputText value="Competências" rendered="true"/>
										</f:facet>																
										<h:dataTable id="dt2"  value="#{item.questoes}" var="item3" width="600" styleClass="tabela" rowClasses="linha2Tabela" >
											<h:column id="c2">
												
												<f:facet name="header">
													<h:outputText  value="#{item.indice} - #{item.titulo}"/>
														
													
												</f:facet>
													<h:outputText  value="#{item3.enunciado}" styleClass="corpoTabela" />
													
													<script language="JavaScript">
													
														//Função para atualizar campo de media e soma para uma determinada competencia														
														function atualizaSomaeMedia(g1,quantQuestoes){
															//g1 representa o indice da competencia a ser atualizada
															var j;
															var media;
															var soma= new Number(0.0);
															var quantZeros= new Number(0.0);
															var notaQuestao= new Number(0.0);
															g1--; //ajuste do índice para correspondência ao nome do respectivo elemento html
															
															for(j=0; j<quantQuestoes; j++){
																
																for( i=0; i<=4; i++){//percorre os itens da questão, buscando o marcado.
																	ele = document.getElementById('frm:dt1:'+g1+':dt2:'+j+':notas:'+i+'');
																																	
																	if(ele.checked ==true ){		
																		ele3 = new Number( ele.getAttribute("value"));
																		notaQuestao=ele3;
																		if(notaQuestao==0){
																			quantZeros++;
																		}
																		soma += new Number(notaQuestao);		
																		
																	}
													
																}
													
															}
													
															document.getElementById('frm:dt1:'+g1+':calc2').value =  soma; //atualiza valor do campo soma
															if(quantZeros==quantQuestoes){ //atualiza valor do campo media
																document.getElementById('frm:dt1:'+g1+':calc3').value = 0;
															}else{
																media = parseFloat(soma/(quantQuestoes-quantZeros));
																document.getElementById('frm:dt1:'+g1+':calc3').value = new Number(media); 
															}
															
															
														}
														
														function atualizaEscore(sizeCompetencias){
															
															var k;
															var mediaCompetencia;
															var soma= new Number(0.0);
															var media= new Number(0.0);
															var quantZeros= new Number(0.0);
															
															for(k=0; k<sizeCompetencias; k++){
																mediaCompetencia=new Number(document.getElementById('frm:dt1:'+k+':calc3').value);
																if(mediaCompetencia==0){
																	quantZeros++;
																}
																soma += mediaCompetencia;
															
															}
															
															
															if(quantZeros==sizeCompetencias){
																document.getElementById('frm:escore').value = new Number(0);
																alert("Preencha pelo menos uma alternativa antes de salvar!");	
															}else{
																media=soma/(sizeCompetencias-quantZeros);
																document.getElementById('frm:escore').value = new Number(media);
																
															}
															
															
														}
														
													</script>
													
													

													<h:selectOneRadio styleClass="centerPage" id="notas" value="#{item3.nota}" label=""  disabled="#{preencheAvaliacaoBean.permissaoPrazoAvaliacao eq false}"  onclick="atualizaSomaeMedia(#{item.indice},#{item.sizeQuestoes}); atualizaEscore(#{preencheAvaliacaoBean.avaliacaoEdicao.sizeCompetencias});">
														<f:selectItem itemValue="0" itemLabel="Não se Aplica"/>
														<f:selectItem itemValue="1" itemLabel="1"/> 
														<f:selectItem itemValue="2" itemLabel="2"/>
														<f:selectItem itemValue="3" itemLabel="3"/>
														<f:selectItem itemValue="4" itemLabel="4"/>
																																				
													</h:selectOneRadio>
													
													
								
											</h:column>					
										</h:dataTable>
									
									
									<h:panelGrid  id="gradnotas" columns="2" width="600" styleClass="linha2" >		
									
											<h:panelGroup>
											<h:outputText value="Somatório da Competência:"  id="somatorioLabel"/>	
											<br/>
											<h:inputText styleClass="nota"  id="calc2" value="#{item.somaNotas}" size="2" />
											</h:panelGroup>
											
											<h:panelGroup>
											<h:outputText value="Média da Competência:" id="mediaLabel"/>
											<br/>
											<h:inputText styleClass="nota"   id="calc3" value="#{item.mediaNotas}" size="2"  />
											</h:panelGroup>
									
									</h:panelGrid>					
									</h:column>
									
									
									
									
								
				</h:dataTable>
				
				</h:panelGroup>
			
			
			<h:panelGroup/>

			
			<h:panelGrid id="gradFooter" columns="1" width="608" styleClass="linha2" >
			
			
			<h:panelGroup>
				<center>
				<h:outputText value="Escore Competência:"  id="escoreLabel"/>	
				<br/>
				<h:inputText styleClass="nota"   id="escore" value="#{preencheAvaliacaoBean.avaliacaoEdicao.escoreCompetencias}" size="4" />
				</center>
			</h:panelGroup>
			
									
			
			<h:panelGroup >
				<center>
					<h:commandButton value="Salvar" actionListener="#{preencheAvaliacaoBean.salvar}" onmousedown="atualizaEscore(#{preencheAvaliacaoBean.avaliacaoEdicao.sizeCompetencias});" styleClass="botao"/>
			
					<h:commandButton value="Cancelar" action="menu" immediate="true" styleClass="botao"/>
				</center>
			</h:panelGroup>
			</h:panelGrid>
			
		</h:panelGrid>
			<br/><br/><br/>	
		<h:commandLink action="menu" styleClass="linkComEspaco" immediate="true">
			<h:outputText value="Menu do sistema"/>
		</h:commandLink>	
		
	</h:form>

</f:view>
</body>
</html>
