<!-- Importanto Biblioteca CORE-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Importando Biblioteca SQL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!-- Conex�o Server XAMPP -->
<!--sql:setDataSource
    var="conexao"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/vs012019web"
    user="root"
    password="" / -->

<!-- Conex�o Server MySQL -->
<sql:setDataSource 
    var="conexao" 
    driver="com.mysql.jdbc.Driver" 
    url="jdbc:mysql://localhost/webIII" 
    user="root" 
    password="005870" 
/>
