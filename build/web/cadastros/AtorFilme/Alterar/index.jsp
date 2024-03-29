<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/navbar.jsp" %>
<%@include file="../../includes/conexao.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Ator</h1>
    
    <c:if test="${param.enviou == 'True'}">
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        

        <c:if test="${empty(param.atfl_atr_codigo)}">
            <c:set var="IsErro1" value="f" />
        </c:if>    
        <c:if test="${empty(param.atfl_papel)}">
                <c:set var="IsErro1" value="f" />
        </c:if>
        <c:if test="${empty(param.atfl_importancia)}">
                <c:set var="IsErro1" value="f" />
        </c:if>
                
        
        <c:if test="${IsErro1 == 's'}">
            <sql:update dataSource="${conexao}" var="r">
                UPDATE AtorFilme SET Atfl_Fil_Codigo=?,Atfl_Papel=?,Atfl_Importancia=?
                where Atfl_Codigo=?;
                <sql:param value="${param.fil}" />
                <sql:param value="${param.atfl_papel}" />
                <sql:param value="${param.atfl_importancia}" />
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
                    <a class="btn btn-warning" href="../Menu/index.jsp?fil=${param.fil}">Voltar P�gina Anterior</a>                
                </div>
            </c:if> 			

            <c:if test="${IsErro1 == 'f'}">
                <div class="alert alert-danger">
                    <h1><strong>Erro!</strong></h1>
                    <p>Ocorreram o(s) seguinte(s) erro(s): <br />
                        <c:if test="${empty(param.atfl_atr_codigo)}">
                            Voc� esqueceu de digitar o ator.<br />
                        </c:if>    
                        <c:if test="${empty(param.atfl_papel)}">
                                Voc� esqueceu de digitar o papel.<br />
                        </c:if>
                        <c:if test="${empty(param.atfl_importancia)}">
                                Voc� esqueceu de digitar a importancia.<br />
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
        SELECT * FROM AtorFilme WHERE Atfl_Codigo=?;
        <sql:param value="${param.id}" />
    </sql:query>
 
    <form action="index.jsp" method="post">
        <div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp?fil=${param.fil}">Voltar P�gina Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />
        </div>

        <c:forEach var="i" items="${r.rows}" >
            <div class="row">
                <div class="form-group col-md-12">

                    <label>Ator</label>
                    <select name="atfl_atr_codigo" id="atfl_atr_codigo" class="form-control w-3">                    
                        <sql:query dataSource="${conexao}" var="r">
                            select atr_codigo,atr_nome from Ator;
                        </sql:query>
                        <c:forEach var="y" items="${r.rows}">
                            <option value="${y.atr_codigo}">${y.atr_nome}</option>
                        </c:forEach>
                    </select>

                    <label>Papel</label>
                    <input type="text" name="atfl_papel" maxlength="50" class="form-control"
                        placeholder="Digite o papel do ator" 
                        value="<c:out value="${i.Atfl_Papel}"/>"
                    />

                    <label>Import�ncia</label>
                    <select name="atfl_importancia" id="atfl_importancia" class="form-control w-3">                
                        <option value="1">1 - Principal</option>
                        <option value="2">2 - Vil�o Principal</option>
                        <option value="3">3 - Second�rio</option>
                        <option value="3">4 - Figurante</option>					        
                    </select>  
                    
                    <script>
                        document.getElementById("atfl_atr_codigo").value=<c:out value="${i.atfl_atr_codigo}"/>;
                        document.getElementById("atfl_importancia").value=<c:out value="${i.atfl_importancia}"/>;
                    </script>
                </div>					
            </div>
                    
            <input type="hidden" name="fil" value="${param.fil}" />
            <input type="hidden" name="id" value="${param.id}" />
        </c:forEach>            
        
        <input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../includes/footer.jsp" %>