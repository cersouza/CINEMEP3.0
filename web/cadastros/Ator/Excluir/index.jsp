<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@include file="../../conexao.jsp" %>
        <sql:update dataSource="${conexao}" var="resultado">
            DELETE FROM ator
                WHERE atr_codigo=?;
                <sql:param value="${param.id}" />
        </sql:update>
        <c:if test="${resultado>0}">
            <c:redirect url="../Menu/index.jsp">
            </c:redirect>
        </c:if>
    </body>
</html>
