<%-- 
    Document   : search
    Created on : Dec 25, 2015, 12:14:34 AM
    Author     : Farazoo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>

        <%
            String name = request.getParameter("searchfield");
        %>

        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull"
                           user="root"
                           password="7611"/>

        <sql:query var="studentresult" dataSource="${db}">
            SELECT idusers, username, identity  FROM users WHERE username='<%=name%>'
        </sql:query>
            
        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${studentresult.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${studentresult.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
