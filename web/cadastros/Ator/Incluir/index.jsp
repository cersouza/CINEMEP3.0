<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/navbar.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Ator</h1>
    
    <c:if test="${param.enviou == 'True'}">
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        

        <c:if test="${empty(param.atr_nome)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        
        <c:if test="${empty(param.Atr_DataNasc)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        
        <c:if test="${IsErro1 == 's'}">
            <%@include file="../../includes/conexao.jsp" %>
            <sql:update dataSource="${conexao}" var="r">
                INSERT INTO Ator (atr_nome,Atr_DataNasc) VALUES (?,?);
                <sql:param value="${param.atr_nome}" />
                <sql:param value="${param.Atr_DataNasc}" />
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
                        <c:if test="${empty(param.atr_nome)}">
                            Voc� esqueceu de digitar um nome.<br />
                        </c:if> 
                            
                        <c:if test="${empty(param.Atr_DataNasc)}">
                            Voc� esqueceu de digitar um nome.<br />
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

                <label>Nome</label>
                <input type="text" name="atr_nome" maxlength="50" class="form-control"
                    placeholder="Digite o nome" 
                    <c:if test="${IsErro1 == 'f'}">
                        value="<c:out value="${param.atr_nome}"/>"
                    </c:if>
                />                    
            </div>
            <div class="row">
                <div class="form-group col-md-12">
                    <label>Data de nascimento</label>
                    <input type="date" name="Atr_DataNasc" class="form-control"
                        data-date-format="DD MM YYYY" 
                        placeholder="Digit e uma data de nascimento." 
                        <c:if test="${IsErro1 == 'f'}">
                            value="<c:out value="${param.Atr_DataNasc}"/>"
                        </c:if>
                    />
                </div>           
            </div>           
        </div>			

        <input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../includes/footer.jsp" %>