<%-- 
    Document   : enrol
    Created on : Dec 24, 2015, 8:30:20 PM
    Author     : Farazoo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enrollment</title>
    </head>
    <body>

        <%
            String connectionURL = "jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull";
            String cid = request.getParameter("courseid");

            int limit;

            String user = session.getAttribute("visitor").toString();

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection connection = DriverManager.getConnection(connectionURL, "root", "7611");

            java.sql.Statement stm = connection.createStatement();

            java.sql.ResultSet rs = stm.executeQuery("SELECT * from users WHERE username='" + user + "'");
            java.sql.ResultSet cr;
            java.sql.ResultSet sr;

            if (rs.next()) {

                cr = stm.executeQuery("SELECT * from courses WHERE idCourses='" + cid + "'");
                if (cr.next()) {

                    limit = Integer.parseInt(cr.getString("CourseLimit"));
                    if (limit > 0) {

                        limit--;
                        if (cr.getString("idCourses").equals(cid)) {

                            sr = stm.executeQuery("SELECT * from study WHERE idCourse='" + cid + "' AND Student='" + user + "' ");
                            if (sr.next()) {

                                out.println("You have already enrolled");
                            } else {

                                stm.executeUpdate("INSERT into study (idCourse, Student) VALUES ('" + cid + "', '" + user + "')");
                                stm.executeUpdate("UPDATE courses SET CourseLimit='" + limit + "' WHERE idCourses='" + cid + "'");
                                out.println("Enrolled!");
                            }
                        }
                    }else{
                        
                        out.println("The course is full!");
                    }
                } else {

                    out.println("Incorrect course ID");
                }
            }
        %>
    </body>
</html>
