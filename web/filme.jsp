<%@include file="../resources/includes/header.jsp" %>
<%@include file="../resources/includes/navbar.jsp" %>
<%@include file="dao.jsp" %>

<div class="row">
    <div class="col-md-12">
            
    <!-- Filme -->
    <div class="card bg-light">
        
        <div class="card-header text-primary">
            <h3 class="card-title text-capitalize">${filme.getFil_Titulo()}</h3>
        </div>
        
        <div class="card-body">
            <div class="row">
                    <div class="col-md-4 d-flex justify-content-center align-items-center">								
                            <img class="rounded" src="${filme.getFil_Foto()}" width="auto" height="400">
                            <!-- img class="card-img-top" src="${filme.getFil_Wallpaper()}" -->
                    </div>

                    <div class="col-md-8">
                            <table class="table">
                                    <tbody>
                                                    <tr><th>Título:</th><td>${filme.getFil_Titulo()}</td></tr>							
                                                    <tr><th>Data Lançamento:</th><td>${filme.getFil_Lancamento()}</td></tr>
                                                    
                                                    
                                                            <tr><th>Elenco:</th>
                                                                <td> <strong class="text-danger">***</strong>
                                                                        <c:forEach var="ator" items="${filme.getFil_Atores()}">
                                                                            <a href="https://www.google.com/search?q=${ator}" target="_blank"> ${ator} (PAPEL),</a>
                                                                        </c:forEach>
                                                                     <strong class="text-danger">***</strong>
                                                                </td>
                                                            </tr>
                                                    <tr><th>Sinopse:</th>
                                                            <td><p>${filme.getFil_Sinopse()}</p></td>
                                                    </tr>

                                                    <tr ><th>Nota Usuários:<br> <small class="text-muted">QTD Avaliações</small></th>
                                                            <td><h2 class="text-muted d-flex align-items-center"><img src="resources/img/star.png" class="mr-2" style="height:30px; width:auto;"/><span class="text-warning">Media(Avaliação)</span>Nota</h2></td>
                                                            <!-- td class="d-flex align-items-center p-4"><p class="text-warning"><strong>Ainda não Avaliado!</strong></p></td -->
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
            <div class='card-header text-primary'><h2 class='card-title'>Avaliações (QUANTIDADE)</h2></div>
                <div class='card-body'>                    
                    <div class='card-columns bg-light'>
                        
                            <!-- Cards de Comentários -->
                            <c:forEach var="comentario" items="${filme.comentarios}">
                                <div class='card bg-class'>
                                    <div class='card-body'>	
                                    <h2 class='card-title text-warning d-inline'>NOTA</h2>
                                    <h3 class='card-subtitle text-muted d-inline'>NOTA_DESCRIÇÃO</h3>

                                    <!-- Menu Opções -->
                                    <div class='dropright d-inline ml-2'>
                                        <button type='button' class='btn btn-secondary dropdown-toggle' id='opComentario_NUMERO' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>+</button>
                                        <div class='dropdown-menu' aria-labelledby='opComentario$com_cod'>
                                            <button type='button' class='dropdown-item' data-toggle='modal' data-target='#mdl_confAlt".$com_cod."'>Editar</button>
                                            <button type='button' class='dropdown-item' data-toggle='modal' data-target='#mdl_confExc".$com_cod."'>Excluir</button>
                                        </div>
                                     </div>

                                    <!-- Infor Comentário-->
                                    <blockquote class='blockquote mb-0'>
                                        <p>COMENTARIO</p>
                                        <footer class='blockquote-footer'>
                                                USER<cite title='Título da fonte'>, DATA</cite>									
                                        </footer> 
                                    </blockquote>

                                    <!-- Linha Divisória -->
                                    <hr>

                                    <!-- Links para Interação com os Comentários -->
                                    <a href='BD/curtirComentario.php?fil_id=$filme_id&com_cod=$com_cod' class='card-link'>Curti! (QTD_CURTI)</a>
                                    <a href='BD/descurtirComentario.php?fil_id=$filme_id&com_cod=$com_cod' class='card-link'>Não Gostei! (QTD_DISLIKE)</a>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%@include file="../resources/includes/footer.jsp" %>
