<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : home
    Created on : Dec 23, 2015, 1:44:12 PM
    Author     : Farazoo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>

        <form name="signin" action="welcome.jsp" method="POST">
            Username:
            <input type="text" name="user" value="" />
            <br>
            Password:
            <input type="password" name="psw" value="" />
            <br>
            <input type="submit" value="Login" name="ok" />
        </form>

        <form name="reg" action="reg.jsp">
            <input type="submit" value="Register" name="regbut" />
        </form>
    </body>
</html>
