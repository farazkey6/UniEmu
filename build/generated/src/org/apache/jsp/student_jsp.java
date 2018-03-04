package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;

public final class student_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student page</title>        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        Welcome \n");
      out.write("        ");

            out.print(session.getAttribute("visitor"));
            String user = session.getAttribute("visitor").toString();
        
      out.write("\n");
      out.write("\n");
      out.write("        <form name=\"list\" action=\"listing.jsp\">\n");
      out.write("            <br>\n");
      out.write("            Press to see all courses\n");
      out.write("            <input type=\"submit\" value=\"Go\" name=\"listbutt\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <form name=\"tlist\" action=\"termlisting.jsp\" method=\"POST\">\n");
      out.write("            <br>\n");
      out.write("            Enter term ID to see available courses:\n");
      out.write("            <input type=\"text\" name=\"terminput\" value=\"\" />\n");
      out.write("            <input type=\"submit\" value=\"Enlist\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <form name=\"result\" action=\"courseresults.jsp\" method=\"POST\">\n");
      out.write("            <br>\n");
      out.write("            Search for a specific course:\n");
      out.write("            <input type=\"text\" name=\"crs\" value=\"\" />\n");
      out.write("            <input type=\"submit\" value=\"search\" name=\"csearch\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <form name=\"enroll\" action=\"enroll.jsp\" method=\"POST\">\n");
      out.write("            <br>\n");
      out.write("            Enroll for a course\n");
      out.write("            <br>\n");
      out.write("            Course ID:\n");
      out.write("            <input type=\"text\" name=\"courseid\" value=\"\" />\n");
      out.write("            <input type=\"submit\" value=\"Enroll\" name=\"enrollbutt\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <form name=\"changepassword\" action=\"changepass.jsp\" method=\"POST\">\n");
      out.write("            <br>\n");
      out.write("            To change your password type in your current password    \n");
      out.write("            <br>\n");
      out.write("            <input type=\"password\" name=\"cpass\" value=\"\" />\n");
      out.write("            <br>\n");
      out.write("            type your new password       \n");
      out.write("            <br>\n");
      out.write("            <input type=\"password\" name=\"npass\" value=\"\" />\n");
      out.write("            <br>\n");
      out.write("            retype your new password    \n");
      out.write("            <br>\n");
      out.write("            <input type=\"password\" name=\"n2pass\" value=\"\" />\n");
      out.write("            <br>\n");
      out.write("            <input type=\"submit\" value=\"Submit\" name=\"cpassbutt\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <br>\n");
      out.write("        Units passed:\n");
      out.write("        ");

            int count = 0;
            int units = 0;

            String connectionURL = "jdbc:mysql://localhost:3306/university?zeroDateTimeBehavior=convertToNull";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection connection = DriverManager.getConnection(connectionURL, "root", "7611");

            java.sql.Statement stm = connection.createStatement();
            java.sql.ResultSet rs = stm.executeQuery("SELECT * from study WHERE Student=" + user + "");

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
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
