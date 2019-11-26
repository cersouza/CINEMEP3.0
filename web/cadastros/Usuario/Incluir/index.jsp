<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/navbar.jsp" %>
<%@include file="../../includes/conexao.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Usuário</h1>
    <c:if test="${param.enviou == 'True'}" >
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        
        
        <c:if test="${empty(param.usu_nome)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.usu_usuario)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.usu_senha)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.usu_email)}">
            <c:set var="IsErro1" value="f" />
        </c:if>
        <c:if test="${empty(param.usu_perfil)}">
            <c:set var="IsErro1" value="f" />
        </c:if>
        
        <c:if test="${IsErro1 == 's'}">
            <sql:update dataSource="${conexao}" var="r">
                INSERT INTO Usuario (usu_nome,usu_usuario,usu_senha,usu_email,usu_situacao,usu_perfil)
				VALUES (?,?,?,?,'Ativo',?);
                <sql:param value="${param.usu_nome}" />
                <sql:param value="${param.usu_usuario}" />
                <sql:param value="${param.usu_senha}" />
                <sql:param value="${param.usu_email}" />
                <sql:param value="${param.usu_perfil}" />
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
                        <c:if test="${empty(param.usu_nome)}">
                            Você esqueceu de digitar o nome.<br />
                        </c:if> 
                        <c:if test="${empty(param.usu_usuario)}">
                            Você esqueceu de digitar o usuário.<br />
                        </c:if> 
                        <c:if test="${empty(param.usu_senha)}">
                            Você esqueceu de digitar a senha.<br />
                        </c:if> 
                        <c:if test="${empty(param.usu_email)}">
                            Você esqueceu de digitar o e-mail.<br />
                        </c:if> 
                        <c:if test="${empty(param.usu_perfil)}">
                            Você esqueceu de informa o perfil.<br />
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
        
        <div class="row">
            <div class="form-group col-md-12">
		<label>Nome</label>
		<input type="text" name="usu_nome" maxlength="50" class="form-control"
                    placeholder="Digite o nome do usuário" 
                    <c:if test="${IsErro1 == 'f'}">
                        value="<c:out value="${param.usu_nome}"/>" 
                    </c:if>
                    />
            
                
		<div class="row">
                    <div class="col-md-5">
			<label>Usuário</label>
			<input type="text" name="usu_usuario" maxlength="25" class="form-control"
				placeholder="Digite o usuário" 
                                <c:if test="${IsErro1 == 'f'}">
                                    value="<c:out value="${param.usu_usuario}"/>" 
                                </c:if>
                        />                                    
                    </div>
                    <div class="col-md-2">
                    </div>

                    <div class="col-md-5">				
                        <label>Senha</label>
                        <input type="password" name="usu_senha" maxlength="20" class="form-control"
                            placeholder="Digite a senha" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.usu_senha}"/>" 
                            </c:if>
                        />
                    </div>	
		</div>		
		
                <div class="row">
                        <div class="col-md-5">				
                        <label>E-mail</label>
                        <input type="email" name="usu_email" maxlength="100" class="form-control"
                            placeholder="Digite o e-mail do usuário" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.usu_email}"/>" 
                            </c:if>
                        />    
                        </div>
                        
                        <div class="col-md-2">
                        </div>
                        
                        <div class="col-md-5">				
                            <label>Perfil</label>
                            <select name="usu_perfil" id="usu_perfil" class="form-control w-3">
                                <sql:query dataSource="${conexao}" var="zr">
                                    select Prf_Codigo,Prf_Descricao from perfil;
                                </sql:query>

                                <c:forEach var="z" items="${zr.rows}">
                                    <option value="${z.Prf_Codigo}">${z.Prf_Descricao}</option>
                                </c:forEach>
                            </select>
                        </div>	
                    </div>
       	    </div>           
            <c:if test="${IsErro1 == 'f'}">
                <script>document.getElementById("usu_perfil").value = <c:out value="${param.usu_perfil}"/></script>
            </c:if>              
	</div>			
 	<input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../includes/footer.jsp" %>