<%@include file="../../../resources/includes/header.jsp" %>
<%@include file="../../../resources/includes/navbar.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Genero</h1>
    
    <c:if test="${param.enviou == 'True'}">
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        

        <c:if test="${empty(param.gen_descricao)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    

        <c:if test="${IsErro1 == 's'}">
            <%@include file="../../conexao.jsp" %>
            <sql:update dataSource="${conexao}" var="r">
                INSERT INTO genero (gen_descricao)
                VALUES (?)
                <sql:param value="${param.gen_descricao}" />
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
                        <c:if test="${empty(param.gen_descricao)}">
                            Voc� esqueceu de digitar a descri��o.<br />
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
    
    <form action="index.jsp" method="post">
        <div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp">Voltar P�gina Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label>Descri��o</label>
		<input type="text" name="gen_descricao" maxlength="50" class="form-control"
                    placeholder="Digite a descri��o" 
                    <c:if test="${IsErro1 == 'f'}">
                        value="<c:out value="${param.gen_descricao}"/>" 
                    </c:if>
                    />
            </div>					
        </div>			

        <input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../../resources/includes/footer.jsp" %>