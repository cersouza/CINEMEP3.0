<%@ include file="../conexao.jsp" %>

<c:if test="${not empty param.id}">
    <!-- Buscando dados dos Filme -->
    <sql:query dataSource="${conexao}" var="filme">

        SELECT f.*,
        (SELECT g.Gen_Descricao FROM genero g WHERE g.Gen_Codigo = f.Fil_Genero) as 'Fil_GeneroDesc',
        (SELECT COUNT(c.Com_Codigo) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo and c.Com_Situacao = 'A') as 'qtd_com',
        (SELECT AVG(c.Com_Avaliacao) FROM comentario c WHERE c.Com_Filme = f.Fil_Codigo and c.Com_Situacao = 'A') as 'media'
        FROM filmes f WHERE f.Fil_Codigo = ?;

        <sql:param value="${param.id}" /> 
        
    </sql:query>

    <!-- Criando Variável FILME -->
    <c:set var="filme" value="${filme.rows[0]}" /> 
    
    <!-- Buscando Elenco do Filme -->
    <sql:query dataSource="${conexao}" var="elenco">

        SELECT f.Atfl_Papel,
        (SELECT a.Atr_Nome FROM ator a WHERE a.Atr_Codigo = f.Atfl_Atr_Codigo) as 'Atr_Nome'
        FROM atorfilme f
        WHERE f.Atfl_Fil_Codigo = ?
        ORDER BY f.Atfl_Importancia;

        <sql:param value="${param.id}" /> 

    </sql:query>
    
    <!-- Buscando Comentários do Filme -->
    <sql:query dataSource="${conexao}" var="comentarios">

        SELECT c.*,
        (SELECT u.Usu_Nome FROM usuario u WHERE u.Usu_Codigo = c.Com_Usuario) as 'Usu_Nome',
        (SELECT COUNT(b.Com_Codigo) FROM comentario b WHERE b.Com_Parent = c.Com_Codigo and b.Com_Situacao = 'A') as 'qtd_addCom',
        (SELECT COUNT(r.RC_Usuario) FROM reacaocomentario r WHERE r.Rc_Comentario = c.Com_Codigo and r.Rc_like = 'True') as 'qtd_like',
        (SELECT COUNT(r.RC_Usuario) FROM reacaocomentario r WHERE r.Rc_Comentario = c.Com_Codigo and r.Rc_Dislike = 'True') as 'qtd_dislike'
        FROM comentario c WHERE c.Com_Filme = ? and c.Com_Situacao = 'A';

        <sql:param value="${param.id}" /> 

    </sql:query>
    
    <c:if test="${not empty sessionScope.Usu_Codigo}">
        <!-- Verifica se usuário já Comentou o Filme -->
        <sql:query dataSource="${conexao}" var="usuarioComentario">

            SELECT c.*
            FROM comentario c WHERE c.Com_Filme = ? and c.Com_Usuario = ? and c.Com_Situacao = 'A';

            <sql:param value="${param.id}" />
            <sql:param value="${sessionScope.Usu_Codigo}" />

        </sql:query> 
        
        <c:set var="jaComentou" value="${not empty usuarioComentario.rows}" />
            
    </c:if> 
        
</c:if>
        
