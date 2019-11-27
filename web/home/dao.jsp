<%@ include file="../conexao.jsp" %>
<!-- Buscando Wallpapers dos Filme -->
    <sql:query dataSource="${conexao}" var="filmes">
        SELECT f.* FROM filmes f WHERE f.Fil_exibiWallpaper = 'Sim';
    </sql:query>