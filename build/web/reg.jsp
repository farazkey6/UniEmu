<%-- 
    Document   : reg
    Created on : Dec 22, 2015, 6:04:27 PM
    Author     : Farazoo
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<form name="registration" action="register.jsp" method="POST">
    <jsp:text>
        Full Name:
    </jsp:text>
    <input type="text" name="regid" value="" />
    <br>
    <jsp:text>
        Username:
    </jsp:text>
    <input type="text" name="reguser" value="" />
    <br>
    <jsp:text>
        Password:
    </jsp:text>
    <input type="password" name="regpass" value="" />
    <br>
    <jsp:text>
        Teacher account
    </jsp:text>
    <input type="checkbox" name="tcheck" value="ON" />
    <br>
    <input type="submit" value="Submit" name="regbutt" />
</form>