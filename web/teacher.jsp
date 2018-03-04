<%-- 
    Document   : teacher
    Created on : Dec 24, 2015, 2:57:08 PM
    Author     : Farazoo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher page</title>
    </head>
    <body>
        Welcome 
        <%
            out.print(session.getAttribute("visitor"));
        %>

        <%
            String user = session.getAttribute("visitor").toString();
        %>

        <form name="list" action="listing.jsp">
            <br>
            Press to see all courses
            <input type="submit" value="Go" name="listbutt" />
        </form>

        <form name="student list" action="studentlist.jsp" method="POST">
            <br>
            Type course ID to see enrolled students:
            <input type="text" name="scid" value="" />
            <input type="submit" value="Enlist" name="ebutlist" />
        </form>
        
        <form name="searchform" action="search.jsp" method="POST">
            <br>
            Search students
            <br>
            Type student name
            <input type="text" name="searchfield" value="" />
            <input type="submit" value="search" />
        </form>

        <form name="ccourse" action="createcourse.jsp" method="POST">
            <br>
            Create new course
            <br>
            Term / Course name / Department
            <br>
            <input type="text" name="term" value="" size="10" />
            <input type="text" name="name" value="" size="15" />
            <input type="text" name="dept" value="" size="10" />
            <br>
            Teacher / Value / Limit
            <br>
            <input type="text" name="teacher" value="'<%=user%>'" size="10" readonly="readonly" />
            <input type="text" name="value" value="3" size="5" />
            <input type="text" name="limit" value="30" size="5" />
            <br>
            Day / Time
            <select name="day">
                <option>Monday</option>
                <option>Tuesday</option>
                <option>Wednesday</option>
                <option>Thursday</option>
                <option>Friday</option>
            </select>
            <select name="time">
                <option>08:00 - 10:00</option>
                <option>10:00 - 12:00</option>
                <option>14:00 - 16:00</option>
                <option>16:00 - 18:00</option>
            </select>
            <br>
            Exam Date (Format: "yyyy-mm-dd")
            <input type="text" name="examdate" value="yyyy-mm-dd" />
            <select name="etime">
                <option>08:00 - 10:00</option>
                <option>10:00 - 12:00</option>
                <option>14:00 - 16:00</option>
                <option>16:00 - 18:00</option>
            </select>
            <br>
            <input type="submit" value="submit" name="subbut" />
        </form>
    </body>
</html>
