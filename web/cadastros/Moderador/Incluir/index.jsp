<%@include file="../../../resources/includes/header.jsp" %>
<%@include file="../../../resources/includes/navbar.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Moderador</h1>
    <c:if test="${param.enviou == 'True'}">
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        

        <c:if test="${empty(param.mod_nome)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.mod_usuario)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.mod_senha)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.mod_email)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.mod_telefone)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.mod_cpf)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        
        <c:if test="${IsErro1 == 's'}">
            <%@include file="../../conexao.jsp" %>
            <sql:update dataSource="${conexao}" var="r">
                INSERT INTO moderador (mod_nome,mod_usuario,mod_senha,mod_email,mod_situacao,mod_telefone,mod_cpf)
				VALUES (?,?,?,?,?,?,?);
                <sql:param value="${param.mod_nome}" />
                <sql:param value="${param.mod_usuario}" />
                <sql:param value="${param.mod_senha}" />
                <sql:param value="${param.mod_email}" />
                <sql:param value="${'Ativo'}" />
                <sql:param value="${param.mod_telefone}" />
                <sql:param value="${param.mod_cpf}" />
            </sql:update>
            
            <c:if test="${not (r>0)}">
                <c:set var="eS1" value="f" />
            </c:if>    
        </c:if>
                                
        <c:if test="${IsErro1 == 's' or IsErro1 == 'f'}">
            <c:if test="${IsErro1 == 's'}">
                <div class="alert alert-success">
                    <h1><strong>Sucesso!</strong></h1>
                    <p>Seu registro foi incluido com sucesso!</p>
                    <a class="btn btn-warning" href="../Menu/index.jsp">Voltar Página Anterior</a>                
                </div>
            </c:if> 			

            <c:if test="${IsErro1 == 'f'}">
                <div class="alert alert-danger">
                    <h1><strong>Erro!</strong></h1>
                    <p>Ocorreram o(s) seguinte(s) erro(s): <br />
                        <c:if test="${empty(param.mod_nome)}">
                            Você esqueceu de digitar o nome.<br />
                        </c:if> 
                        <c:if test="${empty(param.mod_usuario)}">
                            Você esqueceu de digitar o usuário.<br />
                        </c:if> 
                        <c:if test="${empty(param.mod_senha)}">
                            Você esqueceu de digitar a senha.<br />
                        </c:if> 
                        <c:if test="${empty(param.mod_email)}">
                            Você esqueceu de digitar o e-mail.<br />
                        </c:if> 
                        <c:if test="${empty(param.mod_telefone)}">
                            Você esqueceu de digitar o telefone.<br />
                        </c:if> 
                        <c:if test="${empty(param.mod_cpf)}">
                            Você esqueceu de digitar o cpf.<br />
                        </c:if> 
                        <c:if test="${eS1 == 'f'}">
                            Erro na execução do SQL.<br />
                        </c:if>   
                    </p>
                    Por favor tente novamente.
                </div>
            </c:if>                           
        </c:if> 
    </c:if>                                
            
    <form action="index.jsp" method="post">
        <div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp">Voltar Página Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />
        </div>
        
            <div class="form-group col-md-12">
                <div class="row">
                    <label>Nome</label>
                    <input type="text" name="mod_nome" maxlength="50" class="form-control"
                        placeholder="Digite o nome"
                        <c:if test="${IsErro1 == 'f'}">
                            value="<c:out value="${param.mod_nome}"/>"
                        </c:if>
                        />                            
                </div>

                <div class="row">
                        <div class="col-md-5">
                                <label>Usuário</label>
                                <input type="text" name="mod_usuario" maxlength="25" class="form-control"
                                    placeholder="Digite o usuário"
                                    <c:if test="${IsErro1 == 'f'}">
                                        value="<c:out value="${param.mod_usuario}"/>" 
                                    </c:if>
                                />                                        

                        </div>

                        <div class="col-md-2">
                        </div>

                        <div class="col-md-5">				
                                <label>Senha</label>
                                <input type="password" name="mod_senha" maxlength="20" class="form-control"
                                    placeholder="Digite a senha" 
                                    <c:if test="${IsErro1 == 'f'}">
                                        value="<c:out value="${param.mod_senha}"/>"
                                    </c:if>
                                />
                        </div>	
                </div>		

                <label>E-mail</label>
                <input type="email" name="mod_email" maxlength="100" class="form-control"
                    placeholder="Digite o e-mail" 
                    <c:if test="${IsErro1 == 'f'}">
                        value="<c:out value="${param.mod_email}"/>"
                    </c:if>
                />

                <div class="row">
                        <div class="col-md-5">
                                <label>Telefone</label>
                                <input type="tel" name="mod_telefone" maxlength="15" class="form-control"
                                    pattern="[0-9]{5}-[0-9]{4}"
                                    placeholder="Digite o telefone"    
                                    <c:if test="${IsErro1 == 'f'}">
                                        value="<c:out value="${param.mod_telefone}"/>"
                                    </c:if>
                                 />
                        </div>

                        <div class="col-md-2">
                        </div>

                        <div class="col-md-5">				
                                <label>CPF</label>
                                <input type="text" name="mod_cpf" maxlength="11" class="form-control"
                                    placeholder="Digite o CPF" 
                                    <c:if test="${IsErro1 == 'f'}">
                                        value="<c:out value="${param.mod_cpf}"/>"
                                    </c:if>
                                 />
                        </div>	
                </div>		
	</div>			

 	<input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../../resources/includes/footer.jsp" %>