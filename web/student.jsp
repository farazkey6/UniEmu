<%-- 
    Document   : student
    Created on : Dec 24, 2015, 2:56:56 PM
    Author     : Farazoo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student page</title>        
    </head>
    <body>
        Welcome 
        <%
            out.print(session.getAttribute("visitor"));
            String user = session.getAttribute("visitor").toString();
        %>

        <form name="list" action="listing.jsp">
            <br>
            Press to see all courses
            <input type="submit" value="Go" name="listbutt" />
        </form>

        <form name="tlist" action="termlisting.jsp" method="POST">
            <br>
            Enter term ID to see available courses:
            <input type="text" name="terminput" value="" />
            <input type="submit" value="Enlist" />
        </form>

        <form name="result" action="courseresults.jsp" method="POST">
            <br>
            Search for a specific course:
            <input type="text" name="crs" value="" />
            <input type="submit" value="search" name="csearch" />
        </form>

        <form name="enroll" action="enroll.jsp" method="POST">
            <br>
            Enroll for a course
            <br>
            Course ID:
            <input type="text" name="courseid" value="" />
            <input type="submit" value="Enroll" name="enrollbutt" />
        </form>

        <form name="changepassword" action="changepass.jsp" method="POST">
            <br>
            To change your password type in your current password    
            <br>
            <input type="password" name="cpass" value="" />
            <br>
            type your new password       
            <br>
            <input type="password" name="npass" value="" />
            <br>
            retype your new password    
            <br>
            <input type="password" name="n2pass" value="" />
            <br>
            <input type="submit" value="Submit" name="cpassbutt" />
        </form>

        <br>
        Units taken:
        <%
            int count = 0;
            int units = 0;

            String connectionURL = "jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection connection = DriverManager.getConnection(connectionURL, "root", "7611");

            java.sql.Statement stm = connection.createStatement();
            java.sql.ResultSet rs = stm.executeQuery("SELECT * from study WHERE Student ='" + user + "'");

            while (rs.next()) {

                count++;
            }

            rs.first();
            String[] tempstring = new String[count];

            for (int i = 0; i < count; i++) {
                tempstring[i] = rs.getString("idCourse");
            }

            for (int i = 0; i < count; i++) {
                rs = stm.executeQuery("SELECT CourseValue from courses WHERE idCourses='" + tempstring[i] + "'");
                if (rs.next()) {

                    units += rs.getInt("CourseValue");
                }
            }

            out.println(units);
        %>
    </body>
</html>
