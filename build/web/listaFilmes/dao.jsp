<!-- Arquivo de CONEXÃO -->
<%@ include file="../conexao.jsp" %>

<!-- Seleciona dados do Filme -->
<sql:query dataSource="${conexao}" var="filmes">
    <c:choose>
        <c:when test="${not empty param.gen}">
            SELECT f.*,
            (SELECT g.Gen_Descricao FROM genero g WHERE g.Gen_Codigo = f.Fil_Genero) as 'Fil_GeneroDesc',
            (SELECT COUNT(c.Com_Codigo) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'qtd_com',
            (SELECT AVG(c.Com_Avaliacao) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'media'
            FROM filmes f WHERE f.Fil_Genero = (SELECT g.Gen_Codigo FROM genero g WHERE g.Gen_Descricao = ?);
            
            <sql:param value="${param.gen}" /> 
        </c:when>
        <c:when test="${not empty param.pesquisa}">
                SELECT f.*,
                (SELECT g.Gen_Descricao FROM genero g WHERE g.Gen_Codigo = f.Fil_Genero) as 'Fil_GeneroDesc',
                (SELECT COUNT(c.Com_Codigo) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'qtd_com',
                (SELECT AVG(c.Com_Avaliacao) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'media'
                FROM filmes f WHERE f.Fil_Titulo LIKE CONCAT('%', ?, '%');
            
            <sql:param value="${param.pesquisa}" /> 
        </c:when>
        <c:otherwise>
            SELECT f.*,
            (SELECT g.Gen_Descricao FROM genero g WHERE g.Gen_Codigo = f.Fil_Genero) as 'Fil_GeneroDesc',
            (SELECT COUNT(c.Com_Codigo) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'qtd_com',
            (SELECT AVG(c.Com_Avaliacao) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo) as 'media'
            FROM filmes f;
        </c:otherwise>
    </c:choose>
       
</sql:query>
    
<!-- Seleciona dados do Gênero -->
<sql:query dataSource="${conexao}" var="generos">
    SELECT g.*,
    (SELECT COUNT(f.Fil_Codigo) FROM filmes f WHERE f.Fil_Genero = g.Gen_Codigo) as 'qtd_fil'
    FROM genero g;
</sql:query>
    
    
    
    