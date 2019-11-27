<!-- Importanto Biblioteca CORE-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty sessionScope.Usu_Codigo || sessionScope.Usu_Perfil != 3 }">
    <c:redirect url="../home/" />
</c:if>