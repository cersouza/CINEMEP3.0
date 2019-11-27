<%@include file="../resources/includes/header.jsp" %>
<%@include file="../resources/includes/navbar.jsp" %>
<%@include file="dao.jsp" %>

        <!-- Carrosel de Imagens Inicial -->
        <!-- Exibe Wallpapers Ativos dos Filmes -->
        <div class="row">
            <div class="col-md-12"> 
                <div id="carroselWallpapers" class="carousel slide" data-ride="carousel" data-interval="3000" style="height:100%">
                    
                    <!-- Bot�es para cada Slide-->
                    <ol class="carousel-indicators">
                        
                        <c:forEach var="filme" items="${filmes.rows}" varStatus="i">
                            <li class="${i.index == 0 ? "active" : ""}" data-target="#carroselWallpapers" data-slide-to="${i.index}"></li>
                        </c:forEach>                       
                        
                    </ol>
                    
                    <!-- Imagens -->
                    <div class="carousel-inner">
                        <c:forEach var="filme" items="${filmes.rows}" varStatus="i">  
                            
                            <!-- Deixar ativo apenas a primeira imagem -->
                            <div class="carousel-item ${i.index == 0 ? "active" : ""}">
                                
                                <!-- Redireciona para a p�gina Detalhe do Filme -->
                                <a href="../filme/index.jsp?id=${filme.Fil_Codigo}">
                                    <img class="d-block w-100" src="../resources/img/filmes/${filme.Fil_Wallpaper}" alt="Slide ${i.index + 1}">
                                </a>
                                
                                <div class="carousel-caption d-none d-md-block rounded" style="background-color: rgba(0, 0, 0, 0.7)">
                                    <h5>${filme.Fil_Titulo}</h5>
                                </div>
                                    
                            </div>
                                
                        </c:forEach>
                    </div>
                    
                    <!-- Setas de Pr�ximo/Anterior Slides -->
                    <a class="carousel-control-prev" href="#carroselWallpapers" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Anterior</span>
                    </a>
                    
                    <a class="carousel-control-next" href="#carroselWallpapers" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Pr�ximo</span>
                    </a>
                </div>
            </div>            
        </div>
        
<%@include file="../resources/includes/footer.jsp" %>
