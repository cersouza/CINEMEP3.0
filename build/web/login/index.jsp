<%@include file="../resources/includes/header.jsp" %>
<%@include file="../resources/includes/navbar.jsp" %>
<%@include file="dao.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-12 d-flex justify-content-center align-items-center p-5" style="height:42rem;"> 
                <div class="card w-50">
                    <div class="card-header text-center"><h1 class="card-title">Login</h1></div>
                    <div class="card-body text-left">
                        
                        <!-- Se Login estiver errado -->
                        <c:if test="${not empty param.error}">
                            <div class='alert alert-danger text-center' role='alert'>
                                Usuario ou Senha incorreto(s)
                                <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                <span aria-hidden='true'>&times;</span>
                               </button>
                            </div>
                        </c:if>
                        
                        <!-- Se Deslogado -->
                        <c:if test="${not empty param.deslogado}">
                            <div class='alert alert-primary text-center' role='alert'>
                                Obrigado por estar com a gente, ate breve!
                                <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                <span aria-hidden='true'>&times;</span>
                               </button>
                            </div>
                        </c:if>
                        
                        <form class="form-group" action="index.jsp" method="POST">
                            <label for="inp_usr">Email:</label>
                            <input type="text" class="form-control mb-3" name="usuario" id="inp_usr" placeholder="Digite seu email" required>
                            <label for="inp_pss">Senha:</label>
                            <input type="password" class="form-control mb-3" name="senha" id="inp_pss" placeholder="Digite sua senha" required>
                            <input type="submit" class="form-control btn btn-primary" value="Logar">
                        </form>
                    </div>
                    
                    <div class="card-footer text-center">
                        <!-- a class="card-link" href="#">Esqueceu a Senha?</a -->
                        <a class="card-link" href="../cadUsuario/index.jsp">Cadastrar-se</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
<%@include file="../resources/includes/footer.jsp" %>
