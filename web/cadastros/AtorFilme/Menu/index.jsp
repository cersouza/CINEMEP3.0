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
        SELECT COUNT(Atfl_Codigo) as qtd FROM AtorFilme 
	inner join ator on (Atfl_Atr_Codigo = atr_codigo) 
	WHERE atfl_fil_codigo = ${param.fil} and Atr_Nome like '%${where}%';
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
            <c:set var="ordem" value="nom" />
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${ordem == 'cod'}">
            <c:set var="order_by" value="atfl_codigo" />
        </c:when>
        <c:when test="${ordem == 'nom'}">
            <c:set var="order_by" value="atr_nome" />
        </c:when>
        <c:when test="${ordem == 'pap'}">
            <c:set var="order_by" value="atfl_papel" />
        </c:when>        
        <c:otherwise>
            <c:set var="order_by" value="fil_titulo" />
        </c:otherwise>
    </c:choose>    
    <sql:query dataSource="${conexao}" var="r">
        SELECT atfl_codigo, atr_nome, atfl_papel FROM AtorFilme 
        INNER JOIN Ator on (atr_codigo = atfl_atr_codigo)
	WHERE (atr_nome like '%${where}%') and (atfl_fil_codigo = ${param.fil}) 
        ORDER BY ${order_by} LIMIT ${inicio}, ${exiba};
    </sql:query>
    
    <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
        <!-- Header Menu -->
        <div class="row">
            <div class="col-md-3 mt-3"><h2>Ator - Filme</h2></div>
            <div class="col-md-6 mt-3">	
            <!--
                        <div class="input-group h2">
                            <input class="form-control" id="busca"
                                    type="text" 
                                    placeholder="Pesquisa de Ator por Nome" />
                            <span class="input-group-btn">
                                <a href="#" onclick="window.location="index.jsp?tb=ator&op=menu&q=${document.getElementById('busca').value}" />" 
                                            class="btn btn-primary">
                                   <img class="d-inline-block align-center" src="img/find.png" width="25" height="25">
                                </a>
                            </span>
                    </div>
            -->
            </div>

            <div class="col-md-3 mt-3">
                    <a href="../Incluir/index.jsp?fil=${param.fil}" class="btn btn-primary pull-right h2">Inserir Ator</a>
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
                                        <a href='index.jsp?fil=${param.fil}&ordem=cod'>Código</a>
                                    </th>
                                    <th width='40%'>
                                        <a href='index.jsp?fil=${param.fil}&ordem=nom'>Nome</a>
                                    </th>
                                    <th width='30%'>
                                        <a href='index.jsp?fil=${param.fil}&ordem=pap'>Papel</a>
                                    </th>
                                    <th width='30%'>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="i" items="${r.rows}">   
                                    <tr>
                                        <td><c:out value="${i.atfl_codigo}"/></td> 
                                        <td><c:out value="${i.atr_nome}"/></td>
                                        <td><c:out value="${i.atfl_papel}"/></td> 
                                        <td class='actions'>
                                            <a href="../Alterar/index.jsp?fil=${param.fil}&id=<c:out value="${i.atfl_codigo}"/>" class="btn btn-xs btn-warning">Editar</a>
                                            <a href="javascript:confirmacao('Deseja apagar o ator desse filme?',
                                                     '../Excluir/index.jsp?fil=${param.fil}&id=<c:out value="${i.atfl_codigo}"/>')"
                                                     class="btn btn-xs btn-danger">Excluir</a>
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
                
        <c:set var="hpg" value="index.jsp?fil=${param.fil}&ordem=${ordem}&s=" />    
        <!-- Paginação -->
        <div id="button" class="row">
            <ul class="pagination">
                <c:if test="${pagina > 1}" >
                    <c:set var="pag" value="" />
                    <c:set var="pagina_correta" value="${Integer(inicio/$exiba) + 1}" />
                    
                        <c:choose>
                            <c:when test="${pagina_correta != 1}" >
                                <li>
                                    <a class="btn btn-dark" href="${hpg}<c:out value="${inicio - exiba}"/> ">Anterior</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a class="btn btn-dark" disabled>Anterior</a>
                                </li>
                            </c:otherwise>
                        </c:choose>    

                        <c:forEach var="i" begin="${1}"  end="${pagina}" >
                            <c:choose>
                                <c:when test="${i != $pagina_correta}" >
                                    <li>
                                        <a class="btn btn-dark" href="${hpg}<c:out value="${exiba * (i-1)}"/>">${i}</a>
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
                                    <a class="btn btn-dark" href="${hpg}<c:out value="${inicio + exiba}"/>">Próximo</a>
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