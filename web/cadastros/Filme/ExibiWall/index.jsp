<%@include file="../../../resources/includes/header.jsp" %>
<%@include file="../../../resources/includes/navbar.jsp" %>
<%@include file="../../conexao.jsp" %>

<c:set var="exiba" value="10" />
	
<c:choose>
    <c:when test="${not empty(param.q)}">
        <c:set var="where" value="${param.q}" />
    </c:when>
    <c:otherwise>
        <c:set var="where" value="" />
    </c:otherwise>
</c:choose>

<sql:query dataSource="${conexao}" var="qr">
    SELECT COUNT(fil_codigo) as qtd FROM filmes WHERE fil_titulo like '%${where}%';
</sql:query>    

<c:set var="qtde" value="0" />
<c:forEach var="i" items="${qr.rows}">
    <c:set var="qtde" value="${i.qtd}" />
</c:forEach>


<c:choose>
    <c:when test="${qtde > exiba}">
        <c:set var="pagina" value="${qtde/exiba}" />
    </c:when>
    <c:otherwise>
        <c:set var="pagina" value="1" />
    </c:otherwise>
</c:choose>

<c:if test="${(pagina - Integer(pagina)) != 0 }">
    <c:set var="pagina" value="${Integer(pagina) + 1}" />
</c:if>   
        
<c:choose>
    <c:when test="${not empty(param.s)}">
        <c:set var="inicio" value="${param.s}" />
    </c:when>
    <c:otherwise>
        <c:set var="inicio" value="0" />
    </c:otherwise>
</c:choose>    

<c:choose>
    <c:when test="${not empty(param.ordem)}">
        <c:set var="ordem" value="${param.ordem}" />
    </c:when>
    <c:otherwise>
        <c:set var="ordem" value="tit" />
    </c:otherwise>
</c:choose>
    
<c:choose>
    <c:when test="${ordem == 'cod'}">
        <c:set var="order_by" value="fil_codigo" />
    </c:when>
    <c:when test="${ordem == 'tit'}">
        <c:set var="order_by" value="fil_titulo" />
    </c:when>
    <c:when test="${ordem == 'exi'}">
        <c:set var="order_by" value="fil_exibiwallpaper" />
    </c:when>
    <c:otherwise>
        <c:set var="ordem" value="tit" />
        <c:set var="order_by" value="fil_titulo" />
    </c:otherwise>
</c:choose>    

<sql:query dataSource="${conexao}" var="r">
    SELECT fil_codigo, fil_titulo, fil_exibiwallpaper FROM filmes WHERE fil_titulo like '%${where}%' ORDER BY ${order_by} LIMIT ${inicio}, ${exiba};
</sql:query>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <div class="row">
	<div class="col-md-3 mt-3">
            <h2>Filme</h2>
        </div>
    </div>			

    <hr />
	
	<div id="list" class="row">
            <c:choose>
                <c:when test="${qtde > 0}" >
                    <div class='table-responsive col-md-12'>
                        <table class='table table-striped'>
                            <thead>
                                    <tr>
                                            <th width='10%'>
                                                <a href="index.jsp?ordem=cod">Código</a>
                                            </th>
                                            <th width='40%'>
                                                <a href="index.jsp?ordem=tit">Título</a>
                                            </th>
                                            <th width='10%'>
                                                <a href="index.jsp?ordem=exi">Exibi WallPaper</a>
                                            </th>
                                            <th width='40%'>Ações</th>
                                    </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="i" items="${r.rows}">
                                    <tr>
                                        <tr>
                                        <td><c:out value="${i.fil_codigo}"/></td> 
                                        <td><c:out value="${i.fil_titulo}"/></td>
                                        <td><c:out value="${i.fil_exibiwallpaper}"/></td>
                                        <td class='actions'>
                                            <a href="javascript:confirmacao('Deseja alterar a exibição do WallPaper?',
                                                     './db.jsp?id=<c:out value="${i.fil_codigo}"/>')"
                                                     class="btn btn-xs btn-danger">Alterar Exibição</a>
                                        </td>
                                    </tr>
                                </c:forEach>    
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${empty(where)}" >
                            <div class="alert alert-warning"><a>Não foi encontrado nenhum registro.</a><br /></div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-warning">
                             Sua pesquisa por <strong>${where}</strong> não encontrou nenhum registro.<br />
                             <strong>Dicas</strong><br />
                             - Tente palavras menos especificas.<br />
                             - Tente palavras chaves diferentes.<br />
                             - Confira a ortografia das palavras e se elas foram acentuadas corretamentes.<br />
                            </div>;
                        </c:otherwise>
                    </c:choose>    
                </c:otherwise>
            </c:choose> 
	</div>
                
	<div id="button" class="row">
		<ul class="pagination">
                    <c:if test="${pagina > 1}" >
                        <c:set var="pag" value="" />
                        <c:set var="pagina_correta" value="${(inicio/$exiba) + 1}" />
                            <c:choose>
                                <c:when test="${pagina_correta != 1}" >
                                    <li>
                                        <a class="btn btn-dark" href="index.jsp?s=<c:out value="${inicio - exiba}"/>&p=<c:out value="${pagina}"/>&ordem=<c:out value="${ordem}"/>">Anterior</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a class="btn btn-dark" disabled>Anterior</a>
                                    </li>;
                                </c:otherwise>
                            </c:choose>    

                            <c:forEach var="i" begin="${1}"  end="${pagina}" >
                                <c:choose>
                                    <c:when test="${i != $pagina_correta}" >
                                        <li>
                                            <a class="btn btn-dark" href="index.jsp?s=<c:out value="${exiba * (i-1)}"/>&p=<c:out value="${pagina}"/>&ordem=<c:out value="${ordem}"/>">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a class="btn btn-dark" disabled>"
                                                ${i}
                                            </a>
                                        </li>                                  
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
		
                            <c:choose>
                                <c:when test="${pagina_correta != $pagina}" >
                                    <li>
                                        <a class="btn btn-dark" href="index.jsp?s=<c:out value="${inicio + exiba}"/>&p=<c:out value="${pagina}"/>&ordem=<c:out value="${ordem}"/>">Próximo</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a class='btn btn-dark' disabled>Próximo</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>    
                    </c:if>
		</ul>
	</div>
         <script>
            function confirmacao(m,u)
            {
                if ( confirm(m)) {
                    window.location = u;
                }
            }
        </script>
</div>
</div>
</div>

<%@include file="../../../resources/includes/footer.jsp" %>