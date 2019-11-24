<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>      
      <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand" href="../home"><img class="d-inline-block align-top" src="../resources/img/icon_amarelo.png" width="30" height="30"> CINEMEP</a>          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navgation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navbarNav">         
          
            
            <ul class="navbar-nav d-flex align-items-center">  

              <li clss="nav-item active">
                  <a class="nav-link" href="../home">HOME</span></a>
              </li>
              <li clss="nav-item">
                <a class="nav-link" href="../listaFilmes">FILMES</span></a>
              </li>
              
              <!-- Se HOUVER Sessão Ativa -->
              <c:if test="${not empty sessionScope.Usu_Codigo}">
                
                <c:if test="${sessionScope.Usu_Perfil == 3}">
                  <!-- Verifica se é um Perfil Administrativo -->
                  <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="admin" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Administrativo
                        </a>
                        <div class="dropdown-menu" aria-labelledby="admin">
                            <a class="dropdown-item" href="../cadastros/Ator/Menu/index.jsp">Ator</a>
                            <a class="dropdown-item" href="../cadastros/Classificacao/Menu/index.jsp">Classificação</a>
                            <a class="dropdown-item" href="../cadastros/Distribuidora/Menu/index.jsp">Distribuidora</a>
                            <a class="dropdown-item" href="../cadastros/Filme/Menu/index.jsp">Filme</a>
                            <a class="dropdown-item" href="../cadastros/Genero/Menu/index.jsp">Genero</a>
                            <a class="dropdown-item" href="../cadastros/Usuario/Menu/index.jsp">Usuario</a>
                        </div>
                  </li>
                </c:if>

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="opcoes_login" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Olá ${sessionScope.Usu_Nome}
                  </a>
                  <div class="dropdown-menu" aria-labelledby="opcoes_login">
                      <!-- a class="dropdown-item" href="alt-cadastro.php">Minha Conta</a -->
                      <hr />
                      <a class="dropdown-item" href="../login/index.jsp?sair=true">Sair</a>                      
                  </div>
                </li>
              </c:if>
                
              <!-- Se NÃO HOUVER Sessão Ativa -->
              <c:if test="${empty sessionScope.Usu_Codigo}">
                <li clss="nav-item">
                    <a class='nav-link' href='../login'><button class='btn btn-light text-dark'>LOGAR</button></a>
                </li>
                <li clss="nav-item">
                    <a class='nav-link' href='cadastro.jsp'>CADASTRAR-SE</a>
                </li>            
              </c:if>
                
            </ul>

          </div> 
        </div>
      </nav>
    </header>
