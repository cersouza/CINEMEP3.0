<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/navbar.jsp" %>
<%@include file="../../includes/conexao.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Classifica��o</h1>
    
    <c:if test="${param.enviou == 'True'}">
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        

        <c:if test="${empty(param.cla_descricao)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        
        <c:if test="${IsErro1 == 's'}">
            <sql:update dataSource="${conexao}" var="r">
                update classificacao set cla_descricao=?
                where cla_codigo=?;
                <sql:param value="${param.cla_descricao}" />
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
                        <c:if test="${empty(param.cla_descricao)}">
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
                
    <sql:query dataSource="${conexao}" var="r">
        SELECT * FROM classificacao WHERE cla_codigo=?;
        <sql:param value="${param.id}" />
    </sql:query> 
            
    <form action="index.jsp" method="post">
        <div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp">Voltar P�gina Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />
        </div>
        
        <c:forEach var="i" items="${r.rows}" >
        <div class="row">
            <div class="form-group col-md-12">
                <label>Descri��o</label>
		<input type="text" name="cla_descricao" maxlength="50" class="form-control"
                    placeholder="Digite a descri��o" 			
                    value="<c:out value="${i.cla_descricao}"/>"
                />
            </div>					
        </div>
        </c:forEach>
        
        <input type="hidden" name="id" value="${param.id}" />
        <input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../includes/footer.jsp" %>