<%-- 
    Document   : welcome
    Created on : Dec 22, 2015, 6:05:22 PM
    Author     : Farazoo
--%>


<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html>
    <title>Welcome</title>
    <body>
        <%! String connectionURL = "jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull";
        %>
        <%
            String userlogin = request.getParameter("user");
            session.putValue("userid", userlogin);
            String psw = request.getParameter("psw");
//            String user=session.getValue("username").toString(); 

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection connection = DriverManager.getConnection(connectionURL, "root", "7611");

            java.sql.Statement stm = connection.createStatement();
            java.sql.ResultSet rs = stm.executeQuery("SELECT * from users WHERE username='" + userlogin + "'");

            try {
                if (rs.next()) {
                    if (rs.getString("password").equals(psw)) {
                        out.println("Welcome " + rs.getString("identity"));

                        session.setAttribute("visitor", userlogin);

                        if (rs.getString("type").toString().equalsIgnoreCase("F")) {
                            session.setAttribute("type", "F");

        %>

        <form name="strd" action="student.jsp" method="GET">
            <input type="submit" value="Continue" name="cont1" />
        </form>
        <%    } else {
            session.setAttribute("type", "T");

        %>

        <form name="trd" action="teacher.jsp" method="GET">
            <input type="submit" value="Continue" name="cont2" />
        </form>
        <%        }
        } else {
        %>
        <jsp:text>
            Invalid password, try again
        </jsp:text>
        <%
            }
        } else {
        %>
        <jsp:text>
            Invalid username, try again
        </jsp:text>
        <%
                }
            } catch (SQLException e) {

            }
        %>
    </body>
</html>