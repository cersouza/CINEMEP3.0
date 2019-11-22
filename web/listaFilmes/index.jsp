<%@include file="../resources/includes/header.jsp" %>
<%@include file="../resources/includes/navbar.jsp" %>
<%@include file="dao.jsp" %>

<div class="row">
       <div class="col-md-12"> 
           
           <!-- �NICIO: Menu de Pesquisa Filmes-->
           <nav class="navbar navbar-light navbar-expand-lg bg-light">
               <!-- Bot�o Toogler -->
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#opcoes-lista-filmes" aria-controls="opcoes-lista-filmes" aria-expanded="false" aria-label="Op��es de Pesquisa">
                   <span class="navbar-toggler-icon"></span>
               </button>
               
               <!-- Bot�es para Pesquisa de Filmes -->
               <div class="collapse navbar-collapse" id="opcoes-lista-filmes">
                   <ul class="navbar-nav">
                       
                       <!-- Bot�o TODOS os Filmes-->
                       <li class="nav-item">
                           <a class="nav-link" href="../listaFilmes">Todos</a>
                       </li>
                       
                       <!-- Bot�o para sele��o por G�nero -->
                       <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#opcoes-class" role="button" aria-expanded="false" aria-controls="opcoes-class">
                                G�neros
                            </a>
                            <div class="collapse" id="opcoes-class">
                                <div class="d-flex">   
                                    <c:forEach var="genero" items="${generos.rows}" varStatus="i">
                                        <a class="nav-link ${genero.Gen_Descricao == param.gen ? "active" : ""}" href="index.jsp?gen=${genero.Gen_Descricao}" data-toggle="tooltip" title="${genero.qtd_fil}" data-placement="bottom">${genero.Gen_Descricao}</a>
                                    </c:forEach>
                                </div>
                            </div>
                       </li>
                       
                       <!-- Bot�o Para Ordena��o de Filmes-->
                       <li class="nav-item mx-2 d-none">
                            <div class="dropdown show">
                                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Ordenar
                                </a>
                                
                                <!-- Lista com tipos de Ordena��o-->
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <!--a class="dropdown-item" href="#">Melhores Avaliados</a>
                                    <a class="dropdown-item" href="#">Menos Avaliados</a -->
                                    <a class="dropdown-item" href="lista-filmes.php?ord=data DESC">Mais Recentes</a>
                                    <a class="dropdown-item" href="lista-filmes.php?ord=data ASC">Mais Antigos</a>
                                    <a class="dropdown-item" href="lista-filmes.php?ord=til ASC">Nome (A-Z)</a>
                                    <a class="dropdown-item" href="lista-filmes.php?ord=til DESC">Nome (Z-A)</a>
                                </div>
                            </div>
                        </li>
                        
                        <!-- Campo de Pesquisa de Filme por T�tulo -->
                        <form class="form-inline" method="GET" action="index.jsp">
                            <input class="form-control mr-sm-2" type="search" name="pesquisa" placeholder="Pesquisar T�tulo Filme" aria-label="Pesquisar">
                            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Pesquisar</button>
                        </form>
                    </ul>
                </div>
            </nav> 
       </div>
    </div>
    <!-- FIM: Menu de Pesquisa Filmes -->
    
    <!-- �NICIO: Lista de Filmes-->
    <div class="row">
        <div class="col-md-12">
            <!-- Lista de Filmes -->
            <div class="card bg-light">
                
                <div class="card-header text-primary">
                    <h3 class="card-title text-capitalize"><c:out value="${param.gen}" default="Ver todos os filmes" /></h3>
                </div>
                
                    <div class="card-body">
                        <div class="card-column bg-light">
                            
                            <!-- Filme -->
                            <c:forEach var="filme" items="${filmes.rows}">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <!-- Foto do Filme -->
                                            <div class="col-md-2 d-flex align-items-center">
                                                <img class="rounded" src="../resources/${filme.Fil_Foto}" width="auto" height="250">
                                            </div>

                                            <!-- Detalhes do Filme -->
                                            <div class="col-md-10">
                                                <!-- Formatando Data de Lan�amento -->
                                                <fmt:formatDate var="Fil_Lanc" value="${filme.Fil_Lancamento}" pattern="dd 'de' MMMM',' yyyy"/>
                                                <small class="text-small">${filme.Fil_Tempo} / <a href="index.jsp?gen=${filme.Fil_GeneroDesc}" data-toggle="tooltip" title="Ir para Filmes de ${filme.Fil_GeneroDesc}">${filme.Fil_GeneroDesc}</a> / ${Fil_Lanc}</small>
                                                <h3 class="card-title text-uppercase">${filme.Fil_Titulo} <img src="../resources/img/classificacao_${filme.Fil_Classificacao}.png" style="height:32px; width:auto;" /></h3>
                                                <p class="card-text">${filme.Fil_Sinopse}</p>
                                                
                                                <!-- Caso N�O TENHA avalia��es -->
                                                <c:if test="${filme.qtd_com < 1}">
                                                    <p class="card-text text-warning"> Ainda n�o avaliado</p>
                                                </c:if>
                                                
                                                <!-- Caso TENHA avalia��es -->
                                                <c:if test="${filme.qtd_com >= 1}">
                                                    <!-- Formatando M�dia de Avalia��es -->
                                                    <fmt:formatNumber var="fil_media" value="${filme.media}" maxFractionDigits="2" />
                                                    <p class="card-text text-warning"> ${fil_media} - ${filme.qtd_com} ${filme.qtd_com <= 1 ? "Avalia��o" : "Avalia��es"}</p>
                                                </c:if> 
                                                    
                                                <a href="../filme/index.jsp?id=${filme.Fil_Codigo}"><button class="btn btn-primary">Ver Mais</button></a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            
                            <!-- Caso n�o tenha Filmes cadastrados-->
                            <!-- div class='card'><div class='card-body d-flex justify-content-center'><p class='text-secondary m-0'>N�o h� filmes cadastrados com o G�nero ou T�tulo informado.</p></div></div></div -->
                            
                        </div>
                    </div>
                </div>
            
            </div>                
        </div>
    <!-- FIM: Lista de Filmes-->
<%@include file="../resources/includes/footer.jsp" %>

