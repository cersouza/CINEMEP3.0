<!-- Reações aos Comentários -->
<%@ include file="../conexao.jsp" %>

<!-- Recuperando Data Atual -->
<%= new java.util.Date()%>

<fmt:formatDate var="data_agora" value="${now}" pattern="dd-MMMM-yyyy hh:mm" />
Data Atual: ${data_agora}<br />

<!-- //== Reações aos Comentários: CADASTRAR NOVO ==// -->
<c:if test="${not empty param.comentario}">
    <sql:query dataSource="${conexao}" var="cadastrado">

        SELECT c.* FROM comentario c WHERE c.Com_Filme = ? and c.Com_Usuario = ?;

        <sql:param value="${param.Fil_Codigo}" /> 
        <sql:param value="${sessionScope.Usu_Codigo}" />       

    </sql:query>
    
    <!-- Se Usuário JÁ TIVER Comentário Publicado -->
    <c:if test="${not empty cadastrado.rows}">
        Comentário já está Cadastrado
    </c:if>
    
    <!-- Se Usuário AINDA NÃO tiver Comentário Publicado -->
    <c:if test="${empty cadastrado.rows}">
        <sql:query dataSource="${conexao}" var="cadastrado">

        INSERT INTO comentario (Com_Usuario, Com_Comentario, Com_Gostou, Com_NaoGostou, Com_Avaliacao, Com_Filme, Com_Data, Com_Situacao) 
        Values (?, ?, 0, 0, ?, ?, ?, 'T')

        <sql:param value="${sessionScope.Usu_Codigo}" />
        <sql:param value="${param.comentario}" />                
        <sql:param value="${param.nota}" />
        <sql:param value="${param.Fil_Codigo}" /> 
        <sql:param value="${data_agora}" /> 

    </sql:query>
    </c:if>
</c:if>


<!-- //== Reações aos Comentários:  CURTIDAS ==// -->
<c:if test="${not empty param.curtirComentario}">
    
    <sql:query dataSource="${conexao}" var="curtir">

        SELECT r.* FROM reacaocomentario r WHERE r.Rc_Comentario = ? and r.Rc_Usuario = ?;

        <sql:param value="${param.curtirComentario}" /> 
        <sql:param value="${sessionScope.Usu_Codigo}" />       

    </sql:query>
    
    <!-- usuário Atual Já Comentou Este filme?-->
    <c:if test="${not empty curtir.rows}">
        <c:choose>
            <c:when test="${curtir.rows[0].Rc_like}">
                <!-- Usuário JÁ CURTIU o Comentário -->
                <!-- 1.1 - Não está mais CURTIR -->
                <sql:update dataSource="${conexao}" var="atualizaComentario">

                    UPDATE reacaocomentario r SET r.Rc_like = 'False', r.Rc_Dislike = 'False' Where r.Rc_Usuario = ? and r.Rc_Comentario = ?;

                    <sql:param value="${sessionScope.Usu_Codigo}" />
                    <sql:param value="${param.curtirComentario}" />   

                </sql:update>  
            </c:when>
            <c:when test="${curtir.rows[0].Rc_dislike}">
                <!-- Usuário havia DESCURTIDO o Comentário -->
                <!-- 1.2 - Não é Mais Dislike -->
                <sql:update dataSource="${conexao}" var="atualizaComentario">

                    UPDATE reacaocomentario r SET r.Rc_like = 'True', r.Rc_Dislike = 'False' Where r.Rc_Usuario = ? and r.Rc_Comentario = ?;

                    <sql:param value="${sessionScope.Usu_Codigo}" />
                    <sql:param value="${param.curtirComentario}" />   

                </sql:update>  
            </c:when>
            <c:when test="${not curtir.rows[0].Rc_like && not curtir.rows[0].Rc_dislike}">
                <!-- 1.3 - Estava tudo Falso agora, CURTIDO -->            
                <sql:update dataSource="${conexao}" var="atualizaComentario">

                    UPDATE reacaocomentario r SET r.Rc_like = 'True', r.Rc_Dislike = 'False' Where r.Rc_Usuario = ? and r.Rc_Comentario = ?;

                    <sql:param value="${sessionScope.Usu_Codigo}" />
                    <sql:param value="${param.curtirComentario}" />   

                </sql:update>  
            </c:when>
        </c:choose>
    </c:if>
    
    <!-- Usuário ainda não havia reagido ao Comentário -->
    <c:if test="${empty curtir.rows}">
        <!-- 1.4 - Cadastrado -->
        <sql:update dataSource="${conexao}" var="atualizaComentario">

            INSERT INTO reacaocomentario (Rc_Usuario, Rc_Comentario, Rc_like, Rc_Dislike) VALUES (?, ?, 'True', 'False');

            <sql:param value="${sessionScope.Usu_Codigo}" />
            <sql:param value="${param.curtirComentario}" />   

        </sql:update> 
    </c:if>
</c:if>

<!-- //== Reações aos Comentários:  CURTIDAS ==// -->
<c:if test="${not empty param.descurtirComentario}">
    
    <sql:query dataSource="${conexao}" var="descurtir">

        SELECT r.* FROM reacaocomentario r WHERE r.Rc_Comentario = ? and r.Rc_Usuario = ?;

        <sql:param value="${param.descurtirComentario}" /> 
        <sql:param value="${sessionScope.Usu_Codigo}" />       

    </sql:query>
    
    <!-- usuário Atual Já Comentou Este filme?-->
    <c:if test="${not empty descurtir.rows}">
        <c:choose>
            <c:when test="${descurtir.rows[0].Rc_like}">
                
                <!-- Usuário JÁ CURTIU o Comentário -->
                <!-- 2.1 - Não está mais CURTIR, foi DESCURTIDO -->
                <sql:update dataSource="${conexao}" var="atualizaComentario">

                    UPDATE reacaocomentario r SET r.Rc_like = 'False', r.Rc_Dislike = 'True' Where r.Rc_Usuario = ? and r.Rc_Comentario = ?;

                    <sql:param value="${sessionScope.Usu_Codigo}" />
                    <sql:param value="${param.descurtirComentario}" />   

                </sql:update>  
            </c:when>
            <c:when test="${descurtir.rows[0].Rc_dislike}">
                <!-- Usuário havia DESCURTIDO o Comentário -->
                <!-- 2.2 - Não é Mais Dislike, está tudo FALSO -->
                <sql:update dataSource="${conexao}" var="atualizaComentario">

                    UPDATE reacaocomentario r SET r.Rc_like = 'False', r.Rc_Dislike = 'False' Where r.Rc_Usuario = ? and r.Rc_Comentario = ?;

                    <sql:param value="${sessionScope.Usu_Codigo}" />
                    <sql:param value="${param.descurtirComentario}" />   

                </sql:update>  
            </c:when>
            <c:when test="${not descurtir.rows[0].Rc_like && not descurtir.rows[0].Rc_dislike}">
                <!-- 2.3 - Estava tudo Falso agora, DESCURTIDO -->              
                <sql:update dataSource="${conexao}" var="atualizaComentario">

                    UPDATE reacaocomentario r SET r.Rc_like = 'False', r.Rc_Dislike = 'True' Where r.Rc_Usuario = ? and r.Rc_Comentario = ?;

                    <sql:param value="${sessionScope.Usu_Codigo}" />
                    <sql:param value="${param.descurtirComentario}" />   

                </sql:update>  
            </c:when>
        </c:choose>
    </c:if>
    
    <!-- Usuário ainda não havia reagido ao Comentário -->
    <c:if test="${empty descurtir.rows}">
        <!-- 2.4 - Cadastrado DESCURTI -->
        <sql:update dataSource="${conexao}" var="atualizaComentario">

            INSERT INTO reacaocomentario (Rc_Usuario, Rc_Comentario, Rc_like, Rc_Dislike) VALUES (?, ?, 'False', 'True');

            <sql:param value="${sessionScope.Usu_Codigo}" />
            <sql:param value="${param.descurtirComentario}" />   

        </sql:update> 
    </c:if>
</c:if>
            
<!-- c:redirect url="../filme/index.jsp?id=${param.id}" / -->