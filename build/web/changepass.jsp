<%-- 
    Document   : changepass
    Created on : Dec 24, 2015, 7:46:39 PM
    Author     : Farazoo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editing page</title>
    </head>
    <body>

        <%
            String connectionURL = "jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull";
            String oldpass = request.getParameter("cpass");
            String newpass = request.getParameter("npass");
            String new2pass = request.getParameter("n2pass");

            String user = session.getAttribute("visitor").toString();

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection connection = DriverManager.getConnection(connectionURL, "root", "7611");

            java.sql.Statement stm = connection.createStatement();
            java.sql.ResultSet rs = stm.executeQuery("SELECT * from users WHERE username='" + user + "'");

            if (rs.next()) {
                if (rs.getString("password").equals(oldpass)) {

                    if (newpass.equals(new2pass)) {

                        stm.executeUpdate("UPDATE users SET password='" + newpass + "' WHERE username='" + user + "'");
                        out.println("Your password updated successfully!");
                    }else{
                        
                        out.println("Your new password did not match");
                    }
                }else{
                    
                    out.println("Incorrect password");
                }
            }
        %>
    </body>
</html>
