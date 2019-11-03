<header>      
      <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand" href="index.jsp"><img class="d-inline-block align-top" src="resources/img/icon_amarelo.png" width="30" height="30"> CINEMEP</a>          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navgation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navbarNav">         
          
            
            <ul class="navbar-nav d-flex align-items-center">  

              <li clss="nav-item active">
                <a class="nav-link" href="index.jsp">HOME</span></a>
              </li>
              <li clss="nav-item">
                <a class="nav-link" href="listaFilmes.jsp">FILMES</span></a>
              </li>

              <!-- ?php if($usu_perfil == 3) {?>
              <li clss="nav-item">
                <a class="nav-link" href="dashboard.php">Administrativo</span></a>
              </li>
              <?php } ?>

              <?php if($usu_id > -1){ ?>

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="opcoes_login" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Olá ?= $usu_nome;?
                  </a>
                  <div class="dropdown-menu" aria-labelledby="opcoes_login">
                      <a class="dropdown-item" href="alt-cadastro.php">Alterar Conta</a>
                      <hr />
                      <a class="dropdown-item" href="BD/deslogar.php">Sair</a>                      
                  </div>
                </li>
              
              <!-- ?php } else {  ? --> 
                <li clss="nav-item">
                    <a class='nav-link' href='login.jsp'><button class='btn btn-light text-dark'>LOGAR</button></a>
                </li>
                <li clss="nav-item">
                    <a class='nav-link' href='cadastro.jsp'>CADASTRAR-SE</a>
                </li>
              <!-- ?php } ?-->            
              
            </ul>

          </div> 
        </div>
      </nav>
    </header>