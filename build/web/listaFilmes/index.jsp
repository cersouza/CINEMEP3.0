<%@include file="../resources/includes/header.jsp" %>
<%@include file="../resources/includes/navbar.jsp" %>
<%@include file="dao.jsp" %>

<div class="row">
       <div class="col-md-12"> 
           
           <!-- ÍNICIO: Menu de Pesquisa Filmes-->
           <nav class="navbar navbar-light navbar-expand-lg bg-light">
               <!-- Botão Toogler -->
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#opcoes-lista-filmes" aria-controls="opcoes-lista-filmes" aria-expanded="false" aria-label="Opções de Pesquisa">
                   <span class="navbar-toggler-icon"></span>
               </button>
               
               <!-- Botões para Pesquisa de Filmes -->
               <div class="collapse navbar-collapse" id="opcoes-lista-filmes">
                   <ul class="navbar-nav">
                       
                       <!-- Botão TODOS os Filmes-->
                       <li class="nav-item">
                           <a class="nav-link" href="listaFilmes.jsp">Todos</a>
                       </li>
                       
                       <!-- Botão para seleção por Gênero -->
                       <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#opcoes-class" role="button" aria-expanded="false" aria-controls="opcoes-class">
                                Gêneros
                            </a>
                            <div class="collapse" id="opcoes-class">
                                <div class="d-flex">   
                                    <c:forEach var="genero" items="${generos.rows}" varStatus="i">
                                        <a class="nav-link ${i.index == 0 ? "active" : ""}" href="lista-filmes.jsp?gen=${genero.Gen_Descricao}">${genero.Gen_Descricao} (${genero.qtd_fil})</a>
                                    </c:forEach>
                                </div>
                            </div>
                       </li>
                       
                       <!-- Botão Para Ordenação de Filmes-->
                       <li class="nav-item mx-2">
                            <div class="dropdown show">
                                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Ordenar
                                </a>
                                
                                <!-- Lista com tipos de Ordenação-->
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
                        
                        <!-- Campo de Pesquisa de Filme por Título -->
                        <form class="form-inline" method="GET" action="listaFilmes.jsp">
                            <input class="form-control mr-sm-2" type="search" name="q" placeholder="Pesquisar Título Filme" aria-label="Pesquisar">
                            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Pesquisar</button>
                        </form>
                    </ul>
                </div>
            </nav> 
       </div>
    </div>
    <!-- FIM: Menu de Pesquisa Filmes -->
    
    <!-- ÍNICIO: Lista de Filmes-->
    <div class="row">
        <div class="col-md-12">
            <!-- Lista de Filmes -->
            <div class="card bg-light">
                
                <div class="card-header text-primary">
                    <h3 class="card-title text-capitalize">Título Gênero / Ver todos os filmes</h3>
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
                                                <small class="text-small">${filme.Fil_Tempo} / ${filme.Fil_GeneroDesc} / ${filme.Fil_Lancamento}</small>
                                                <h3 class="card-title text-uppercase">${filme.Fil_Titulo} <img src="${"SOURCE"}" style="height:32px; width:auto;" /></h3>
                                                <p class="card-text">${filme.Fil_Sinopse}</p>
                                                <p class="card-text text-warning"> ${filme.media} - ${filme.qtd_com} Avaliação(s)
                                                <a href="${"LINK"}"><button class="btn btn-primary">Ver Mais</button></a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            
                            <!-- Caso não tenha Filmes cadastrados-->
                            <!-- div class='card'><div class='card-body d-flex justify-content-center'><p class='text-secondary m-0'>Não há filmes cadastrados com o Gênero ou Título informado.</p></div></div></div -->
                            
                        </div>
                    </div>
                </div>
            
            </div>                
        </div>
    <!-- FIM: Lista de Filmes-->
<%@include file="../resources/includes/footer.jsp" %>

