<%-- 
    Document   : register
    Created on : Dec 24, 2015, 3:23:36 PM
    Author     : Farazoo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>

        <%!
            String connectionURL = "jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull";
        %>

        <%
            String regusr = request.getParameter("reguser");
            String regpsw = request.getParameter("regpass");
            String regidt = request.getParameter("regid");
            String check = request.getParameter("tcheck");

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection connection = DriverManager.getConnection(connectionURL, "root", "7611");

            java.sql.Statement stm = connection.createStatement();
            java.sql.ResultSet rs = stm.executeQuery("SELECT * from users WHERE username='" + regusr + "'");

            if (rs.next()) {
                out.println("User already exists");
            } else if (regusr == "" || regpsw == "" || regidt == "") {
                out.println("Invalid credentials");
            } else if (check != null) {
                stm.executeUpdate("INSERT INTO users (username, password, type, identity) VALUES ('" + regusr + "', '" + regpsw + "', 'T', '" + regidt + "')");
        %>
        <jsp:text>
            Registration successful!
        </jsp:text>
        <%
        } else {
            stm.executeUpdate("INSERT INTO users (username, password, identity) VALUES ('" + regusr + "', '" + regpsw + "', '" + regidt + "')");

        %>

        <jsp:text>
            Registration successful!
        </jsp:text>
        <%            }
        %>
        <form name="redirect" action="index.jsp">
            <input type="submit" value="Return" name="return" />
        </form>
    </body>
</html>
