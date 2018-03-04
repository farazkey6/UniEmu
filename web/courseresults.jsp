<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : courseresults
    Created on : Dec 24, 2015, 6:45:19 PM
    Author     : Farazoo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
    </head>
    <body>

        <%
            String coursename = request.getParameter("crs");

        %>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull"
                           user="root"
                           password="7611"/>

        <sql:query var="courseresult" dataSource="${db}">
            SELECT *  FROM courses WHERE coursename='<%=coursename%>'
        </sql:query>

        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${courseresult.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${courseresult.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
