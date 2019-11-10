<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource
    var="conexao"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/vs012019web"
    user="root"
    password="" />