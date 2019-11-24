<%@include file="../../../resources/includes/header.jsp" %>
<%@include file="../../../resources/includes/navbar.jsp" %>
<%@include file="../../conexao.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Usu�rio</h1>
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
        
        <c:if test="${IsErro1 == 's'}">
            <sql:update dataSource="${conexao}" var="r">
                UPDATE Usuario set usu_nome=?,usu_usuario=?,usu_senha=?,usu_email=?,usu_situacao='Ativo' where usu_codigo = ?;
                <sql:param value="${param.usu_nome}" />
                <sql:param value="${param.usu_usuario}" />
                <sql:param value="${param.usu_senha}" />
                <sql:param value="${param.usu_email}" />
                <sql:param value="${param.id}" />
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
                    <a class="btn btn-warning" href="../Menu/index.jsp">Voltar P�gina Anterior</a>                
                </div>
            </c:if> 			

            <c:if test="${IsErro1 == 'f'}">
                <div class="alert alert-danger">
                    <h1><strong>Erro!</strong></h1>
                    <p>Ocorreram o(s) seguinte(s) erro(s): <br />
                        <c:if test="${empty(param.usu_nome)}">
                            Voc� esqueceu de digitar o nome.<br />
                        </c:if> 
                        <c:if test="${empty(param.usu_usuario)}">
                            Voc� esqueceu de digitar o usu�rio.<br />
                        </c:if> 
                        <c:if test="${empty(param.usu_senha)}">
                            Voc� esqueceu de digitar a senha.<br />
                        </c:if> 
                        <c:if test="${empty(param.usu_email)}">
                            Voc� esqueceu de digitar o e-mail.<br />
                        </c:if> 
                        <c:if test="${eS1 == 'f'}">
                            Erro na execu��o do SQL.<br />
                        </c:if>   
                    </p>
                    Por favor tente novamente.
                </div>
            </c:if>                           
        </c:if> 
    </c:if>
                                
    <sql:query dataSource="${conexao}" var="r">
        SELECT * FROM USUARIO WHERE usu_codigo=?;
        <sql:param value="${param.id}" />
    </sql:query>                            
           
    <form action="index.jsp" method="post">
        <div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp">Voltar P�gina Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />
        </div>
        
        <c:forEach var='i' items="${r.rows}">
            <div class="row">
                <div class="form-group col-md-12">
                    <label>Nome</label>
                    <input type="text" name="usu_nome" maxlength="50" class="form-control"
                        placeholder="Digite o nome do usu�rio" 
                        value="<c:out value="${i.usu_nome}"/>" />

                    <div class="row">
                        <div class="col-md-5">
                            <label>Usu�rio</label>
                            <input type="text" name="usu_usuario" maxlength="25" class="form-control"
                                    placeholder="Digite o usu�rio" 
                                    value="<c:out value="${i.usu_usuario}"/>" />
                        </div>
                        <div class="col-md-2">
                        </div>

                        <div class="col-md-5">				
                            <label>Senha</label>
                            <input type="password" name="usu_senha" maxlength="20" class="form-control"
                                placeholder="Digite a senha" 
                                value="<c:out value="${i.usu_senha}"/>" />

                        </div>	
                    </div>		

                    <label>E-mail</label>
                    <input type="email" name="usu_email" maxlength="100" class="form-control"
                        placeholder="Digite o e-mail do usu�rio" 
                        value="<c:out value="${i.usu_email}"/>" />
                </div>					
            </div>	
        </c:forEach>    
        <input type="hidden" name="id" value="${param.id}" />
 	<input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../../resources/includes/footer.jsp" %>