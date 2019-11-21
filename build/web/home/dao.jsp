<%@ include file="../conexao.jsp" %>
<!-- Buscando Wallpapers dos Filme -->
    <sql:query dataSource="${conexao}" var="filmes">
        SELECT f.* FROM filmes f;
    </sql:query>