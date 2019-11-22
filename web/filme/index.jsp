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
                            <img class="rounded" src="../resources/${filme.Fil_Foto}" width="auto" height="400">
                            <!-- img class="card-img-top" src="${filme.Fil_Wallpaper}" -->
                    </div>

                    <div class="col-md-8">
                            <table class="table">
                                    <tbody>
                                                    <tr><th>T�tulo:</th><td>${filme.Fil_Titulo}</td></tr>
                                                    
                                                    <!-- Formatando Data de Lan�amento -->
                                                    <fmt:formatDate var="Fil_Lanc" value="${filme.Fil_Lancamento}" pattern="dd 'de' MMMM',' yyyy"/>
                                                    <tr><th>Data Lan�amento:</th><td>${Fil_Lanc}</td></tr>
                                                    
                                                    
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

                                                    <tr><th>Nota M�dia Usu�rios:<br></th>
                                                        <td>
                                                            <!-- Caso N�O TENHA avalia��es -->
                                                        <c:if test="${filme.qtd_com < 1}">
                                                            <p class="text-warning"><strong>Ainda n�o Avaliado!</strong></p>
                                                        </c:if>

                                                        <!-- Caso TENHA avalia��es -->
                                                        <c:if test="${filme.qtd_com >= 1}">
                                                            <!-- Formatando M�dia de Avalia��es -->
                                                            <fmt:formatNumber var="fil_media" value="${filme.media}" maxFractionDigits="2" />
                                                            <h2 class="text-warning d-flex align-items-center"> ${fil_media} </h2>                                                           
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
        
        <!-- Bloco de Coment�rios -->
        <div class='card bg-light' id='bloco_cmt'>
            <div class='card-header text-primary'><h2 class='card-title'>Avalia��es (${filme.qtd_com})</h2></div>
                <div class='card-body'>                    
                    <div class='card-columns bg-light'>
                        
                            <!-- Cards de Coment�rios -->
                            <c:forEach var="com" items="${comentarios.rows}">
                                
                                <div class='card bg-class'>
                                    <div class='card-body'>	
                                    <!-- h2 class='card-title text-warning d-inline'>**</h2 -->
                                    
                                    <!-- Estrelas -->
                                    <c:forEach begin="1" end="${com.Com_Avaliacao}">
                                        <img src="../resources/img/star.png" class="mr-2" style="height:30px; width:auto;"/>
                                    </c:forEach>
                                        
                                    <!-- h3 class='card-subtitle text-muted d-inline'>NOTA_DESCRI��O</h3 -->

                                    <c:if test="${com.Com_Usuario == sessionScope.Usu_Codigo}">
                                        <!-- Menu Op��es -->
                                        <div class='float-right dropright d-inline ml-2'>
                                            <button type='button' class='btn btn-secondary' id='opComentario_NUMERO' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i class="fa fa-bars" aria-hidden="false"></i></button>
                                            <div class='dropdown-menu' aria-labelledby='opComentario$com_cod'>
                                                <!-- a href="reagirComentario.jsp?id=${filme.Fil_Codigo}&editar=${com.Com_Codigo}" type='button' class='dropdown-item'>Editar</a -->
                                                <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&excluir=${com.Com_Codigo}' type='button' class='dropdown-item'>Excluir</a>
                                            </div>
                                         </div>
                                    </c:if>

                                    <!-- Info Coment�rio-->
                                    <blockquote class='blockquote mb-0'>
                                        <p>${com.Com_Comentario}</p>
                                        <footer class='blockquote-footer d-flex justify-content-end'>
                                            <!-- Formatando Data Coment�rio -->
                                            <fmt:formatDate var="Com_Data" value="${com.Com_Data}" pattern="dd 'de' MMMM',' yyyy '�s' hh:mm"/>
                                            ${com.Usu_Nome}
                                            <cite title='T�tulo da fonte'>, ${Com_Data}</cite>									
                                        </footer> 
                                    </blockquote>

                                    <!-- Linha Divis�ria -->
                                    <hr>
                                    <div class="d-flex justify-content-end">
                                        <!-- Links para Intera��o com os Coment�rios -->
                                        <a href='#' class='card-link' data-toggle="collapse" data-target="#addCom_${com.Com_Codigo}" data-tooltip="tooltip" title='Ver / Adicionar Coment�rios' data-placement="bottom">
                                            <!-- Comentarios (${com.qtd_addCom}) --> <i class="fa fa-comment"></i> (${com.qtd_addCom})
                                        </a>
                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&curtirComentario=${com.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Curtir Coment�rio" data-placement="bottom">
                                            
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
                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&descurtirComentario=${com.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Descurtir Coment�rio" data-placement="bottom">
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
                                        
                                        <!-- Formul�rio para Comentar um Coment�rio -->
                                        <form id="form_addCom_${com.Com_Codigo}" class="form-group" method="POST" action="reagirComentario.jsp">
                                            <textarea class="form-control" rows="5"  name="addComentario" placeholder="Digite seu coment�rio aqui..." required></textarea><br>
                                            <input type="hidden" name="Com_Codigo"  value="${com.Com_Codigo}"/>
                                            <input type="hidden" name="id" value="${filme.Fil_Codigo}" />
                                            <input class="btn btn-primary" type="submit" value="COMENTAR" form="form_addCom_${com.Com_Codigo}" />
                                        </form>
                                        
                                        <!-- Recupera Coment�rios de Coment�rios -->
                                        <c:if test="${com.qtd_addCom > 0}">
                                            <sql:query dataSource="${conexao}" var="add">
                                                SELECT c.*,
                                                (SELECT u.Usu_Nome FROM usuario u WHERE u.Usu_Codigo = Com_Usuario) as 'Usu_Nome',
                                                (SELECT COUNT(r.RC_Usuario) FROM reacaocomentario r WHERE r.Rc_Comentario = c.Com_Codigo and r.Rc_like = 'True') as 'qtd_like',
                                                (SELECT COUNT(r.RC_Usuario) FROM reacaocomentario r WHERE r.Rc_Comentario = c.Com_Codigo and r.Rc_dislike = 'True') as 'qtd_dislike'
                                                FROM comentario c WHERE c.Com_Parent = ? ;

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
                                                      <small class="text-muted">Postado em <fmt:formatDate value="${addCom.Com_Data}" pattern="dd 'de' MMMM',' yyyy"/> </i></small>
                                                      
                                                      <c:if test="${not empty sessionScope.Usu_Codigo}">
                                                            <sql:query dataSource="${conexao}" var="addRc">
                                                                SELECT Rc_Like, Rc_Dislike FROM reacaocomentario
                                                                WHERE Rc_Usuario = ? and Rc_Comentario = ?;

                                                                <sql:param value="${sessionScope.Usu_Codigo}" />
                                                                <sql:param value="${addCom.Com_Codigo}" />

                                                            </sql:query>
                                                        </c:if>
                                                            <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&curtirComentario=${addCom.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Curtir Coment�rio" data-placement="bottom">
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
                                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&descurtirComentario=${addCom.Com_Codigo}' class='card-link' data-tooltip="tooltip" title="Descurtir Coment�rio" data-placement="bottom">
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
                                                          <a href="reagirComentario.jsp?id=${filme.Fil_Codigo}&excluirAddCom=${addCom.Com_Codigo}" class='btn btn-danger text-white' data-tooltip='tooltip' title="Excluir Coment�rio" data-placement="bottom"><i class="fa fa-trash" aria-hidden="false"></i></a>
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
                    
                    <!-- Caso n�o haja coment�rios -->
                    <c:if test="${filme.qtd_com == 0}">
                        <div class='text-center'>
                            <h2 class='text-muted'>Seja o primeiro a comentar clicando abaixo!</h2>
                        </div>
                    </c:if>
                    
                    
                </div>
                
            </div>
                
        </div>
                
    </div>
                
    <!-- Bloco Para Coment�rios -->
    <div class="card bg-light">
        <div class="card-header text-center">
            <h3 class="card-title">Adicionar Avalia��o</h3>
            <button class="btn btn-primary" data-toggle="collapse" data-target="#frm-comentario">Comentar</button>
        </div>
        <div class="card-body collapse" id="frm-comentario">									
            <form class="form-group" method="POST" action="reagirComentario.jsp">
                <label for="nota">Avalia��o:</label>
                <select name="Fil_Avaliacao" class="form-control w-50" id="nota">
                    <option value="1">1 - P�ssimo</option>
                    <option value="2">2 - Ruim</option>
                    <option value="3">3 - Mais ou Menos</option>
                    <option value="4">4 - Bom</option>
                    <option value="5">5 - Excelente</option>
                </select>

                <label for="comment">Coment�rio:</label>
                <textarea class="form-control" rows="5" id="comment"  name="Comentario" placeholder="Digite seu coment�rio aqui..." required></textarea><br>

                <input type="hidden" name="Fil_Codigo" value="${filme.Fil_Codigo}">
                <input type="hidden" name="id" value="${filme.Fil_Codigo}">
                <input class="btn btn-primary" type="submit" value="Publicar">
            </form>
        </div>
</div>

<!-- Mensagens de ERRO -->
<c:if test="${not empty param.erro or not empty param.sucesso}">
    <c:choose>
        <c:when test="${param.erro == 1}">
            <script>
                alert("Voc� pode comentar apenas uma vez!");
            </script>
        </c:when>
        <c:when test="${param.erro == 2}">
            <script>
                alert("Necess�rio estar logado para executar essa a��o!");
            </script>
        </c:when>
        <c:when test="${param.erro == 3}">
            <script>
                alert("Voc� n�o � permitido executar essa a��o!");
            </script>
        </c:when>
        <c:when test="${param.sucesso == 1}">
            <script>
                alert("Opera��o Realizada com Sucesso!");
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
                    <h5 class='modal-title' id='exc_cmt'>Excluir Coment�rio</h5>
                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                        <span aria-hidden='true'>&times;</span>
                    </button>
                </div>

                <div class='modal-body'>
                    <p>Voc� realmente deseja excluir esse coment�rio?</p>
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
