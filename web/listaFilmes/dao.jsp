<%@ include file="../conexao.jsp" %>

<!-- Seleciona dados do Filme -->
<sql:query dataSource="${conexao}" var="filmes">
    SELECT f.*,
    (SELECT COUNT(c.Com_Codigo) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'qtd_com',
    (SELECT AVG(c.Com_Avaliacao) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'media'
    FROM filmes f;
</sql:query>
    
<!-- Seleciona dados do Gênero -->
<sql:query dataSource="${conexao}" var="generos">
    SELECT g.*,
    (SELECT COUNT(f.Fil_Codigo) FROM filmes f WHERE f.Fil_Genero = g.Gen_Codigo) as 'qtd_fil'
    FROM genero g;
</sql:query>
    
    
    
    