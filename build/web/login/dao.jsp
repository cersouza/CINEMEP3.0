<%@ include file="../conexao.jsp" %>

<!-- Se já HOUVER Sessão Ativa -->
<c:if test="${not empty sessionScope.Usu_Codigo}">
    
    <!-- Remove Variáveis da Sessão (Deslogar)  -->
    <c:if test="${not empty param.sair}">        
        <c:remove var="Usu_Codigo" scope="session" />
        <c:remove var="Usu_Usuario" scope="session" />
        <c:remove var="Usu_Nome" scope="session" />
        <c:remove var="Usu_Email" scope="session" />
        <c:remove var="Usu_Perfil" scope="session" />
        
        <c:redirect url="index.jsp?deslogado=true" />
    </c:if>
    
    <c:redirect url="../home" />
</c:if>

<!-- Se NÃO HOUVER Sessão Ativa -->
<c:if test="${empty sessionScope.Usu_Codigo}">
    <!-- Verfica se há Usuário e Senha enviados [POST]-->
    <c:if test="${not empty param.usuario && not empty param.senha}">

        <!-- Autentica Usuario/Senha no Banco -->
        <sql:query dataSource="${conexao}" var="usuario">
            SELECT * FROM usuario u WHERE u.Usu_Usuario = ? and u.Usu_Senha = ?;

            <sql:param value="${param.usuario}" />
            <sql:param value="${param.senha}" />

        </sql:query>

        <!-- Login Correto -->
        <c:if test="${not empty usuario.rows}">

            <!-- Inicia Variáveis da Sessão  -->
            <c:set var="Usu_Codigo" scope="session" value="${usuario.rows[0].Usu_Codigo}" />
            <c:set var="Usu_Usuario" scope="session" value="${usuario.rows[0].Usu_Usuario}" />
            <c:set var="Usu_Nome" scope="session" value="${usuario.rows[0].Usu_Nome}" />
            <c:set var="Usu_Email" scope="session" value="${usuario.rows[0].Usu_Email}" />
            <c:set var="Usu_Perfil" scope="session" value="${usuario.rows[0].Usu_Perfil}" />

            <c:redirect url="../home">

            </c:redirect>
        </c:if>

        <!-- Login ou Senha Incorreto(s) -->
        <c:if test="${empty usuario.rows}">
            <c:redirect url="index.jsp?error=true" />
        </c:if>
    </c:if>
</c:if>