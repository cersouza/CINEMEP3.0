<%@include file="../resources/includes/header.jsp" %>
<%@include file="../resources/includes/navbar.jsp" %>
<%@include file="dao.jsp" %>

<!-- Criando um Array de Cores (usado nos Coment�rios de Coment�rios) -->
<c:set var="cores" value="${['primary','secondary', 'success']}" />

<div class="row">
    <div class="col-md-12">
            
    <!-- Filme -->
    <div class="card bg-light">
        
        <div class="card-header text-primary">
            <h3 class="card-title text-capitalize">${filme.Fil_Titulo}</h3>
        </div>
        
        <div class="card-body">
            <div class="row">
                    <div class="col-md-4 d-flex justify-content-center align-items-center">								
                            <img class="rounded" src="../resources/img/filmes/${filme.Fil_Foto}" width="auto" height="400">
                            <!-- img class="card-img-top" src="${filme.Fil_Wallpaper}" -->
                    </div>

                    <div class="col-md-8">
                            <table class="table">
                                    <tbody>
                                                    <tr><th>Titulo:</th><td>${filme.Fil_Titulo}</td></tr>
                                                    
                                                    <!-- Formatando Data de Lan�amento -->
                                                    <fmt:formatDate var="Fil_Lanc" value="${filme.Fil_Lancamento}" pattern="dd 'de' MMMM',' yyyy"/>
                                                    <tr><th>Data Lancamento:</th><td>${Fil_Lanc}</td></tr>
                                                    
                                                    
                                                            <c:if test="${not empty elenco.rows}">
                                                                <tr>
                                                                    <th>Elenco:</th>
                                                                    <td> 
                                                                        <c:forEach var="ator" items="${elenco.rows}">
                                                                            <a href="https://www.google.com/search?q=${ator.Atr_Nome}" target="_blank"> ${ator.Atr_Nome} (${ator.Atfl_Papel}),</a>
                                                                        </c:forEach>                                                                        
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                    <tr><th>Sinopse:</th>
                                                            <td><p>${filme.Fil_Sinopse}</p></td>
                                                    </tr>

                                                    <tr><th>Nota Media Usuarios:<br></th>
                                                        <td>
                                                            <!-- Caso NAO TENHA avaliacoes -->
                                                        <c:if test="${filme.qtd_com < 1}">
                                                            <p class="text-warning"><strong>Ainda nao Avaliado!</strong></p>
                                                        </c:if>

                                                        <!-- Caso TENHA avaliacoes�ões -->
                                                        <c:if test="${filme.qtd_com >= 1}">
                                                            <!-- Formatando Media de Avaliaco�es -->
                                                            <fmt:formatNumber var="fil_media" value="${filme.media}" maxFractionDigits="2" />
                                                            <!-- Inteiro da Media para Caculos -->
                                                            <fmt:parseNumber var="fil_media_int" value="${fil_media}" integerOnly="true" type="number" />
                                                            
                                                            <h2 class="text-warning d-flex align-items-center">
                                                                <!-- Compondo a Nota/Estrelas -->
                                                                 <c:forEach begin="1" end="5" varStatus="i">
                                                                     <c:choose>
                                                                       <c:when test="${i.index == fil_media_int + 1 && i.index - 0.5 <= filme.media}">
                                                                           <i class="fa fa-star-half-full"></i>
                                                                       </c:when>
                                                                       <c:when test="${i.index <= filme.media}">
                                                                           <i class="fa fa-star"></i>
                                                                       </c:when>       
                                                                       <c:otherwise>
                                                                           <i class="fa fa-star-o"></i>
                                                                       </c:otherwise>
                                                                     </c:choose>
                                                                </c:forEach>
                                                                <span class="text-muted"> - (${fil_media}) </span>
                                                            </h2>                                                           
                                                        </c:if>
                                                     </td>                                                        
                                                    </tr>
                                    </tbody>
                            </table>
                    </div>
            </div>
    </div>
</div>  
<div class="row">
    <div class="col-md-12">
        
        <!-- Bloco de Comentarios -->
        <div class='card bg-light' id='bloco_cmt'>
            <div class='card-header text-primary'><h2 class='card-title'>Avaliacoes (${filme.qtd_com})</h2></div>
                <div class='card-body'>                    
                    <div class='card-columns bg-light'>
                        
                            <!-- Cards de Comentarios -->
                            <c:forEach var="com" items="${comentarios.rows}">
                                
                                <div class='card bg-class'>
                                    <div class='card-body'>	
                                    
                                    <!-- Estrelas -->
                                    <span class="h3 text-warning">
                                        <c:forEach begin="1" end="${com.Com_Avaliacao}">
                                            <i class="fa fa-star"></i>
                                        </c:forEach>
                                    </span>
                                    
                                    <c:if test="${com.Com_Usuario == sessionScope.Usu_Codigo}">
                                        <!-- Menu Opcoes -->
                                        <div class='float-right dropright d-inline ml-2'>
                                            <button type='button' class='btn btn-secondary' id='opComentario_NUMERO' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i class="fa fa-bars" aria-hidden="false"></i></button>
                                            <div class='dropdown-menu' aria-labelledby='opComentario$com_cod'>
                                                <a class='dropdown-item' href='#editaCom_${com.Com_Codigo}' role='button' data-toggle='collapse'>Editar</a>
                                                <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&excluir=${com.Com_Codigo}' type='button' class='dropdown-item'>Excluir</a>
                                            </div>
                                         </div>
                                            
                                        <div class="accordion" id='comBloco_${com.Com_Codigo}'>
                                        <!-- Info Comentario-->
                                        <div id="infoCom_${com.Com_Codigo}" class="collapse show"data-parent='#comBloco_${com.Com_Codigo}'>
                                            <blockquote class='blockquote mb-0'>
                                                <p>${com.Com_Comentario}</p>
                                                <footer class='blockquote-footer d-flex justify-content-end'>
                                                    <!-- Formatando Data Comentario -->
                                                    <fmt:formatDate var="Com_Data" value="${com.Com_Data}" pattern="dd 'de' MMMM',' yyyy 'as' hh:mm"/>
                                                    ${com.Usu_Nome}
                                                    <cite title='Titulo da fonte'>, ${Com_Data}</cite>									
                                                </footer> 
                                            </blockquote>
                                        </div>

                                        <!-- Formulario para Edicao de Comentario -->
                                        <div id="editaCom_${com.Com_Codigo}" class="collapse" data-parent='#comBloco_${com.Com_Codigo}'>
                                            <form id="form_editaCom_${com.Com_Codigo}" class="form-group text-right" method="POST" action="reagirComentario.jsp">
                                                
                                                <p class="text-left">Avaliação:</p>                                                
                                                <select name="Fil_Avaliacao" class="form-control" form="form_editaCom_${com.Com_Codigo}">
                                                    <option value="1" ${com.Com_Avaliacao == 1 ? "selected" : ""}>1 - Pessimo</option>
                                                    <option value="2" ${com.Com_Avaliacao == 2 ? "selected" : ""}>2 - Ruim</option>
                                                    <option value="3" ${com.Com_Avaliacao == 3 ? "selected" : ""}>3 - Mais ou Menos</option>
                                                    <option value="4" ${com.Com_Avaliacao == 4 ? "selected" : ""}>4 - Bom</option>
                                                    <option value="5" ${com.Com_Avaliacao == 5 ? "selected" : ""}>5 - Excelente</option>
                                                </select>
                                                
                                                <p class="text-left">Comentario:</p>
                                                <textarea class="form-control" rows="5" name="editaComentario" placeholder="Digite seu comentário aqui..." required>${com.Com_Comentario}</textarea><br>
                                                <input type="hidden" name="Com_Codigo"  value="${com.Com_Codigo}"/>
                                                <input type="hidden" name="id" value="${filme.Fil_Codigo}" />                                            
                                                <input class="btn btn-secondary" type="reset" value="CANCELAR"  data-target='#infoCom_${com.Com_Codigo}' data-toggle='collapse' aria-expanded='true'/>
                                                <input class="btn btn-primary" type="submit" value="SALVAR" form="form_editaCom_${com.Com_Codigo}" />
                                            </form>
                                        </div>
                                    </div>      
                                    </c:if>
                                    
                                    <!-- Se NAO HOUVER Sessao Ativa, ou Comentario NAO FOR do usuario atual -->
                                    <c:if test="${empty sessionScope.Usu_Codigo || com.Com_Usuario != sessionScope.Usu_Codigo}">
                                        <!-- Info Comentario-->
                                        <blockquote class='blockquote mb-0'>
                                            <p>${com.Com_Comentario}</p>
                                            <footer class='blockquote-footer d-flex justify-content-end'>
                                                <!-- Formatando Data Comentário -->
                                                <fmt:formatDate var="Com_Data" value="${com.Com_Data}" pattern="dd 'de' MMMM',' yyyy 'as' hh:mm"/>
                                                ${com.Usu_Nome}
                                                <cite title='Titulo da fonte'>, ${Com_Data}</cite>									
                                            </footer> 
                                        </blockquote>
                                    </c:if>

                                    <!-- Linha Divisoria -->
                                    <hr>
                                    <div class="d-flex justify-content-end">
                                        <!-- Links para Interacao com os Comentarios -->
                                        <a href='#' class='card-link' data-toggle="collapse" data-target="#addCom_${com.Com_Codigo}" data-tooltip="tooltip" title='Ver / Adicionar Comentários' data-placement="bottom">
                                            <i class="fa fa-comment"></i> (${com.qtd_addCom})
                                        </a>
                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&curtirComentario=${com.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Curtir Comentário" data-placement="bottom">
                                            
                                            <c:if test="${not empty sessionScope.Usu_Codigo}">
                                                <sql:query dataSource="${conexao}" var="rc">
                                                    SELECT Rc_Like, Rc_Dislike FROM reacaocomentario
                                                    WHERE Rc_Usuario = ? and Rc_Comentario = ?;
                                                    
                                                    <sql:param value="${sessionScope.Usu_Codigo}" />
                                                    <sql:param value="${com.Com_Codigo}" />
                                                    
                                                </sql:query>
                                            </c:if>
                                            
                                            <c:choose>
                                                <c:when test="${not empty rc.rows and rc.rows[0].Rc_Like}">
                                                    <!-- strong>Curtido (${com.qtd_like})</strong -->
                                                    <i class="fa fa-thumbs-up"></i> (${com.qtd_like})
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Curtir (${com.qtd_like}) -->
                                                    <i class="fa fa-thumbs-o-up"></i> (${com.qtd_like})
                                                </c:otherwise>
                                            </c:choose>
                                            
                                        </a>  
                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&descurtirComentario=${com.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Descurtir Comentário" data-placement="bottom">
                                           <c:choose>
                                            <c:when test="${not empty rc.rows and rc.rows[0].Rc_Dislike}">
                                                <!-- strong>Descurtido (${com.qtd_dislike})</strong -->
                                                <i class="fa fa-thumbs-down"></i> (${com.qtd_dislike})
                                            </c:when>
                                            <c:otherwise>
                                                <!-- Descurtir (${com.qtd_dislike}) -->
                                                <i class="fa fa-thumbs-o-down"></i> (${com.qtd_dislike})
                                            </c:otherwise>
                                           </c:choose>
                                               
                                        </a>
                                         
                                    </div>
                                           
                                           
                                    <div class="collapse text-right" id="addCom_${com.Com_Codigo}">
                                        <hr />
                                        
                                        <!-- Formulario para Comentar um Comentario -->
                                        <form id="form_addCom_${com.Com_Codigo}" class="form-group" method="POST" action="reagirComentario.jsp">
                                            <textarea class="form-control" rows="5"  name="addComentario" placeholder="Digite seu comentário aqui..." required></textarea><br>
                                            <input type="hidden" name="Com_Codigo"  value="${com.Com_Codigo}"/>
                                            <input type="hidden" name="id" value="${filme.Fil_Codigo}" />
                                            <input class="btn btn-primary" type="submit" value="COMENTAR" form="form_addCom_${com.Com_Codigo}" />
                                        </form>
                                        
                                        <!-- Recupera Comentarios de Comentarios -->
                                        <c:if test="${com.qtd_addCom > 0}">
                                            <sql:query dataSource="${conexao}" var="add">
                                                SELECT c.*,
                                                (SELECT u.Usu_Nome FROM usuario u WHERE u.Usu_Codigo = Com_Usuario) as 'Usu_Nome',
                                                (SELECT COUNT(r.RC_Usuario) FROM reacaocomentario r WHERE r.Rc_Comentario = c.Com_Codigo and r.Rc_like = 'True') as 'qtd_like',
                                                (SELECT COUNT(r.RC_Usuario) FROM reacaocomentario r WHERE r.Rc_Comentario = c.Com_Codigo and r.Rc_dislike = 'True') as 'qtd_dislike'
                                                FROM comentario c WHERE c.Com_Parent = ? and c.Com_Situacao = 'A';

                                                <sql:param value="${com.Com_Codigo}" />
                                            </sql:query> 
                                            <c:forEach var="addCom" items="${add.rows}" varStatus="i">
                                                
                                                 <div class="card border-${cores[Math.random()*2]}">
                                                    <div class="card-body">
                                                      <p class="card-text">
                                                        "${addCom.Com_Comentario}" - <strong>${addCom.Usu_Nome} </strong>
                                                      </p>
                                                    </div>
                                                    <div class="card-footer">
                                                      <small class="text-muted">Postado em <fmt:formatDate value="${addCom.Com_Data}" pattern="dd 'de' MMMM',' yyyy"/> </i></small><br>
                                                      
                                                      <c:if test="${not empty sessionScope.Usu_Codigo}">
                                                            <sql:query dataSource="${conexao}" var="addRc">
                                                                SELECT Rc_Like, Rc_Dislike FROM reacaocomentario
                                                                WHERE Rc_Usuario = ? and Rc_Comentario = ?;

                                                                <sql:param value="${sessionScope.Usu_Codigo}" />
                                                                <sql:param value="${addCom.Com_Codigo}" />

                                                            </sql:query>
                                                        </c:if>
                                                            <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&curtirComentario=${addCom.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Curtir Comentário" data-placement="bottom">
                                                            <c:choose>
                                                                <c:when test="${not empty addRc.rows and addRc.rows[0].Rc_Like}">
                                                                    <!-- strong>Curtido (${addCom.qtd_like})</strong -->
                                                                    <i class="fa fa-thumbs-up"></i> (${addCom.qtd_like})
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- Curtir (${addCom.qtd_like}) -->
                                                                    <i class="fa fa-thumbs-o-up"></i> (${addCom.qtd_like})
                                                                </c:otherwise>
                                                               
                                                            </c:choose>
                                                        </a>   
                                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&descurtirComentario=${addCom.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Descurtir Comentário" data-placement="bottom">
                                                            <c:choose>
                                                                <c:when test="${not empty addRc.rows and addRc.rows[0].Rc_Dislike}">
                                                                    <!-- strong>Curtido (${addCom.qtd_dislike})</strong -->
                                                                    <i class="fa fa-thumbs-down"></i> (${addCom.qtd_dislike})
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- Curtir (${addCom.qtd_dislike}) -->
                                                                    <i class="fa fa-thumbs-o-down"></i> (${addCom.qtd_dislike})
                                                                </c:otherwise>
                                                               
                                                            </c:choose>
                                                        </a>   
                                                      <c:if test="${not empty sessionScope.Usu_Codigo and addCom.Com_Usuario == sessionScope.Usu_Codigo}">
                                                          <a href="reagirComentario.jsp?id=${filme.Fil_Codigo}&excluirAddCom=${addCom.Com_Codigo}" class='btn btn-danger text-white' data-tooltip='tooltip' title="Excluir Comentário" data-placement="bottom"><i class="fa fa-trash" aria-hidden="false"></i></a>
                                                      </c:if>
                                                      
                                                    </div>
                                                  </div>
                                                
                                            </c:forEach>
                                        </c:if>
                                        
                                    </div>
                                        
                                </div>
                            </div>
                                        
                        </c:forEach>
                            
                        
                    </div>
                    
                    <!-- Caso não haja comentários -->
                    <c:if test="${filme.qtd_com == 0}">
                        <div class='text-center'>
                            <h2 class='text-muted'>Seja o primeiro a comentar clicando abaixo!</h2>
                        </div>
                    </c:if>
                    
                    
                </div>
                
            </div>
                
        </div>
                
    </div>
                
    <!-- Bloco Para Comentarios -->
    <div class="card bg-light">
        <!-- Testa se usuario Ja comentou - Variavel instanciada no DAO-->
        <c:if test="${jaComentou && not empty sessionScope.Usu_Codigo}">
            <div class="card-body text-center text-primary">
                Voce Ja Avaliou este Filme ; )
            </div>
        </c:if>
        <c:if test="${not jaComentou || empty sessionScope.Usu_Codigo}">
            <div class="card-header text-center">
                <h3 class="card-title">Adicionar Avaliacao</h3>
                <button class="btn btn-primary" data-toggle="collapse" data-target="#frm-comentario">Comentar</button>
            </div>
            <div class="card-body collapse" id="frm-comentario">									
                <form class="form-group" method="POST" action="reagirComentario.jsp">
                    <label for="nota">Avaliacao:</label>
                    <select name="Fil_Avaliacao" class="form-control w-50" id="nota">
                        <option value="1">1 - Pessimo</option>
                        <option value="2">2 - Ruim</option>
                        <option value="3">3 - Mais ou Menos</option>
                        <option value="4">4 - Bom</option>
                        <option value="5">5 - Excelente</option>
                    </select>

                    <label for="comment">Comentario:</label>
                    <textarea class="form-control" rows="5" id="comment"  name="Comentario" placeholder="Digite seu comentário aqui..." required></textarea><br>

                    <input type="hidden" name="Fil_Codigo" value="${filme.Fil_Codigo}">
                    <input type="hidden" name="id" value="${filme.Fil_Codigo}">
                    <input class="btn btn-primary" type="submit" value="Publicar">
                </form>
            </div>
        </c:if>  
</div>

<!-- Mensagens de ERRO -->
<c:if test="${not empty param.erro or not empty param.sucesso}">
    <c:choose>
        <c:when test="${param.erro == 1}">
            <script>
                alert("Voce pode comentar apenas uma vez!");
            </script>
        </c:when>
        <c:when test="${param.erro == 2}">
            <script>
                alert("Necessario estar logado para executar essa acao!");
            </script>
        </c:when>
        <c:when test="${param.erro == 3}">
            <script>
                alert("Voce nao tem permissao executar essa acao!");
            </script>
        </c:when>
        <c:when test="${param.sucesso == 1}">
            <script>
                alert("Operacao Realizada com Sucesso!");
            </script>
        </c:when>
    </c:choose>  
</c:if>

            
<!-- MODAIS -->

<c:if test="${not empty param.excluir}">
    <!-- MODAL EXCLUIR -->    
    <div class='modal' id='mdl_confExc' tabindex='-1' role='dialog' aria-hidden='true'>
        <div class='modal-dialog modal-dialog-centered' role='document'>
            <div class='modal-content'>
                <div class='modal-header'>
                    <h5 class='modal-title' id='exc_cmt'>Excluir Comentario</h5>
                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                        <span aria-hidden='true'>&times;</span>
                    </button>
                </div>

                <div class='modal-body'>
                    <p>Voce realmente deseja excluir esse comentario?</p>
                </div>

                <div class='modal-footer'>
                    <button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancelar</button>
                    <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&excluir=${param.excluir}'><button type='button' class='btn btn-danger'>Excluir</button></a>
                </div>
            </div>
        </div>
    </div>
</c:if>

<%@include file="../resources/includes/footer.jsp" %>
