<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : studentlist
    Created on : Dec 25, 2015, 1:59:54 PM
    Author     : Farazoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student list</title>
    </head>
    <body>

        <%
            String id = request.getParameter("scid");
        %>

        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull"
                           user="root"
                           password="7611"/>

        <sql:query var="resultsc" dataSource="${db}">
            SELECT Student FROM study WHERE idCourse='<%=id%>'
        </sql:query>

        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${resultsc.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${resultsc.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
