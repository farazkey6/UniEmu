<%-- 
    Document   : createcourse
    Created on : Dec 25, 2015, 1:31:57 AM
    Author     : Farazoo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Course</title>
    </head>
    <body>

        <%!            
            String connectionURL = "jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull";
        %>

        <%
            String term = request.getParameter("term");
            String name = request.getParameter("name");
            String dept = request.getParameter("dept");
            String teacher = request.getParameter("teacher");
            String value = request.getParameter("value");
            String limit = request.getParameter("limit");
            String day = request.getParameter("day");
            String time = request.getParameter("time");
            String exam = request.getParameter("examdate");
            String etime = request.getParameter("etime");
            
            String tempday = "", temptime = "", newtime, etemptime = "";
            SimpleDateFormat newformat = new SimpleDateFormat("yyyy-MM-dd");
            Date date;
            
            if (etime.equals("08:00 - 10:00")) {
                etemptime = "8";
            } else if (etime.equals("10:00 - 12:00")) {
                etemptime = "10";
            } else if (etime.equals("14:00 - 16:00")) {
                etemptime = "14";
            } else if (etime.equals("16:00 - 18:00")) {
                etemptime = "16";
            }
            
            String type = session.getAttribute("type").toString();
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection connection = DriverManager.getConnection(connectionURL, "root", "7611");
            
            java.sql.Statement stm = connection.createStatement();
            java.sql.ResultSet rs = stm.executeQuery("SELECT * from courses WHERE CourseTeacher=" + teacher + "");
            
            if (type.equals("F")) {
                
                out.println("Access Denied!");
            } else if (term == "" || name == "" || dept == "" || teacher == "" || value == "" || limit == "" || day == "" || time == "" || exam == "") {
                out.println("Please fill all required information");
                
            } else if (rs.next() && rs.getString("CourseName").equals(name) && rs.getString("idTerm").equals(term) && rs.getString("CourseTeacher").equals(teacher)) {
                
                out.println("Course already exists");
            } else {
                
                rs = stm.executeQuery("SELECT * from courses WHERE ExamDate = STR_TO_DATE('" + exam + "', '%Y-%m-%d')");
                if (rs.next() && rs.getString("ExamTime").equals(etemptime)) {
                    out.println("Exam date taken");
                } else {
                    
                    if (day.equals("Monday")) {
                        tempday = "2";
                    } else if (day.equals("Tuesday")) {
                        tempday = "3";
                    } else if (day.equals("Wednesday")) {
                        tempday = "4";
                    } else if (day.equals("Thursday")) {
                        tempday = "5";
                    } else if (day.equals("Friday")) {
                        tempday = "6";
                    }
                    
                    if (time.equals("08:00 - 10:00")) {
                        temptime = "8";
                    } else if (time.equals("10:00 - 12:00")) {
                        temptime = "10";
                    } else if (time.equals("14:00 - 16:00")) {
                        temptime = "14";
                    } else if (time.equals("16:00 - 18:00")) {
                        temptime = "16";
                    }
                    
                    newtime = day + "At" + temptime;
                    date = newformat.parse(exam);
                    
                    rs = stm.executeQuery("SELECT * from courses WHERE DayAndTime ='" + newtime + "'");
                    if (rs.next() && rs.getString("DayAndTime").equals(newtime)) {
                        
                        out.println("sorry, class is full at requested time");
                    } else {
                        
                        stm.executeUpdate("INSERT into courses (idTerm, CourseName, CourseGroup, CourseTeacher, CourseValue, CourseLimit, DayAndTime, ExamDate, ExamTime) VALUES ('" + term + "', '" + name + "', '" + dept + "', " + teacher + ", '" + value + "', '" + limit + "', '" + newtime + "', STR_TO_DATE('" + exam + "', '%Y-%m-%d'), '" + etemptime + "')");
                        out.println("Course created.");
                    }
                }
            }
        %>
    </body>
</html>
