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
                                                    <tr><th>T�tulo:</th><td>${filme.getFil_Titulo()}</td></tr>							
                                                    <tr><th>Data Lan�amento:</th><td>${filme.getFil_Lancamento()}</td></tr>
                                                    
                                                    
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

                                                    <tr ><th>Nota Usu�rios:<br> <small class="text-muted">QTD Avalia��es</small></th>
                                                            <td><h2 class="text-muted d-flex align-items-center"><img src="resources/img/star.png" class="mr-2" style="height:30px; width:auto;"/><span class="text-warning">Media(Avalia��o)</span>Nota</h2></td>
                                                            <!-- td class="d-flex align-items-center p-4"><p class="text-warning"><strong>Ainda n�o Avaliado!</strong></p></td -->
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
            <div class='card-header text-primary'><h2 class='card-title'>Avalia��es (QUANTIDADE)</h2></div>
                <div class='card-body'>                    
                    <div class='card-columns bg-light'>
                        
                            <!-- Cards de Coment�rios -->
                            <c:forEach var="comentario" items="${filme.comentarios}">
                                <div class='card bg-class'>
                                    <div class='card-body'>	
                                    <h2 class='card-title text-warning d-inline'>NOTA</h2>
                                    <h3 class='card-subtitle text-muted d-inline'>NOTA_DESCRI��O</h3>

                                    <!-- Menu Op��es -->
                                    <div class='dropright d-inline ml-2'>
                                        <button type='button' class='btn btn-secondary dropdown-toggle' id='opComentario_NUMERO' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>+</button>
                                        <div class='dropdown-menu' aria-labelledby='opComentario$com_cod'>
                                            <button type='button' class='dropdown-item' data-toggle='modal' data-target='#mdl_confAlt".$com_cod."'>Editar</button>
                                            <button type='button' class='dropdown-item' data-toggle='modal' data-target='#mdl_confExc".$com_cod."'>Excluir</button>
                                        </div>
                                     </div>

                                    <!-- Infor Coment�rio-->
                                    <blockquote class='blockquote mb-0'>
                                        <p>COMENTARIO</p>
                                        <footer class='blockquote-footer'>
                                                USER<cite title='T�tulo da fonte'>, DATA</cite>									
                                        </footer> 
                                    </blockquote>

                                    <!-- Linha Divis�ria -->
                                    <hr>

                                    <!-- Links para Intera��o com os Coment�rios -->
                                    <a href='BD/curtirComentario.php?fil_id=$filme_id&com_cod=$com_cod' class='card-link'>Curti! (QTD_CURTI)</a>
                                    <a href='BD/descurtirComentario.php?fil_id=$filme_id&com_cod=$com_cod' class='card-link'>N�o Gostei! (QTD_DISLIKE)</a>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%@include file="../resources/includes/footer.jsp" %>
