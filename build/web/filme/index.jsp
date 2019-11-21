<%@include file="../resources/includes/header.jsp" %>
<%@include file="../resources/includes/navbar.jsp" %>
<%@include file="dao.jsp" %>

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
                                                    <tr><th>Título:</th><td>${filme.Fil_Titulo}</td></tr>
                                                    
                                                    <!-- Formatando Data de Lançamento -->
                                                    <fmt:formatDate var="Fil_Lanc" value="${filme.Fil_Lancamento}" pattern="dd-MMMM-yyyy"/>
                                                    <tr><th>Data Lançamento:</th><td>${Fil_Lanc}</td></tr>
                                                    
                                                    
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

                                                    <tr><th>Nota Usuários:<br></th>
                                                        <td>
                                                            <!-- Caso NÃO TENHA avaliações -->
                                                        <c:if test="${filme.qtd_com < 1}">
                                                            <p class="text-warning"><strong>Ainda não Avaliado!</strong></p>
                                                        </c:if>

                                                        <!-- Caso TENHA avaliações -->
                                                        <c:if test="${filme.qtd_com >= 1}">
                                                            <!-- Formatando Média de Avaliações -->
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
        
        <!-- Bloco de Comentários -->
        <div class='card bg-light' id='bloco_cmt'>
            <div class='card-header text-primary'><h2 class='card-title'>Avaliações (${filme.qtd_com})</h2></div>
                <div class='card-body'>                    
                    <div class='card-columns bg-light'>
                        
                            <!-- Cards de Comentários -->
                            <c:forEach var="com" items="${comentarios.rows}">
                                
                                <div class='card bg-class'>
                                    <div class='card-body'>	
                                    <!-- h2 class='card-title text-warning d-inline'>**</h2 -->
                                    
                                    <!-- Estrelas -->
                                    <c:forEach begin="0" end="${com.Com_Avaliacao - 1}">
                                        <img src="../resources/img/star.png" class="mr-2" style="height:30px; width:auto;"/>
                                    </c:forEach>
                                        
                                    <!-- h3 class='card-subtitle text-muted d-inline'>NOTA_DESCRIÇÃO</h3 -->

                                    <c:if test="${com.Com_Usuario == sessionScope.Usu_Codigo}">
                                        <!-- Menu Opções -->
                                        <div class='float-right dropright d-inline ml-2'>
                                            <button type='button' class='btn btn-secondary' id='opComentario_NUMERO' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>+<i class="fa fa-bars" aria-hidden="false"></i></button>
                                            <div class='dropdown-menu' aria-labelledby='opComentario$com_cod'>
                                                <button type='button' class='dropdown-item' data-toggle='modal' data-target='#mdl_confAlt".$com_cod."'>Editar</button>
                                                <button type='button' class='dropdown-item' data-toggle='modal' data-target='#mdl_confExc".$com_cod."'>Excluir</button>
                                            </div>
                                         </div>
                                    </c:if>

                                    <!-- Info Comentário-->
                                    <blockquote class='blockquote mb-0'>
                                        <p>${com.Com_Comentario}</p>
                                        <footer class='blockquote-footer d-flex justify-content-end'>
                                            <!-- Formatando Data Comentário -->
                                            <fmt:formatDate var="Com_Data" value="${com.Com_Data}" pattern="dd-MMMM-yyyy hh:mm"/>
                                            ${com.Usu_Nome}
                                            <cite title='Título da fonte'>, ${Com_Data}</cite>									
                                        </footer> 
                                    </blockquote>

                                    <!-- Linha Divisória -->
                                    <hr>
                                    <div class="d-flex justify-content-end">
                                        <!-- Links para Interação com os Comentários -->
                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&curtirComentario=${com.Com_Codigo}' class='card-link'>
                                            
                                            <c:choose>
                                                <c:when test="${false}">
                                                    <strong>Curtido (${com.qtd_like})</strong>
                                                </c:when>
                                                <c:otherwise>
                                                    Curtir (${com.qtd_like})
                                                </c:otherwise>
                                            </c:choose>
                                            
                                        </a>  
                                        <a href='reagirComentario.jsp?id=${filme.Fil_Codigo}&descurtirComentario=${com.Com_Codigo}' class='card-link'>
                                           <c:choose>
                                            <c:when test="${false}">
                                                <strong>Descurtido (${com.qtd_dislike})</strong>
                                            </c:when>
                                            <c:otherwise>
                                                Descurtir (${com.qtd_dislike})
                                            </c:otherwise>
                                           </c:choose>
                                               
                                        </a>
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
                
    <!-- Bloco Para Comentários -->
    <div class="card bg-light">
        <div class="card-header text-center">
            <h3 class="card-title">Adicionar Avaliação</h3>
            <button class="btn btn-primary" data-toggle="collapse" data-target="#frm-comentario">Comentar</button>
        </div>
        <div class="card-body collapse" id="frm-comentario">									
            <form class="form-group" method="POST" action="reagirComentario.jsp">
                <label for="nota">Avaliação:</label>
                <select name="nota_fil" class="form-control w-50" id="nota">
                    <option value="1">1 - Péssimo</option>
                    <option value="2">2 - Ruim</option>
                    <option value="3">3 - Mais ou Menos</option>
                    <option value="4">4 - Bom</option>
                    <option value="5">5 - Excelente</option>
                </select>

                <label for="comment">Comentário:</label>
                <textarea class="form-control" rows="5" id="comment"  name="comentario" placeholder="Digite seu comentário aqui..." required></textarea><br>

                <input type="hidden" name="Fil_Codigo" value="${filme.Fil_Codigo}">										
                <input class="btn btn-primary" type="submit" value="Publicar">
            </form>
        </div>
</div>
<%@include file="../resources/includes/footer.jsp" %>
