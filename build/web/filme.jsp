<%@page import="Model.Filme"%>
<%@include file="resources/includes/header.jsp" %>
<%@include file="resources/includes/navbar.jsp" %>
<jsp:useBean id="colecao_filmes" class="ColecoesTeste.ColecaoDeFilmes" />

<c:set var="filme" value="${ colecao_filmes.getFilmeById(param.id) }" scope="request" />

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
    
<%@include file="resources/includes/footer.jsp" %>
