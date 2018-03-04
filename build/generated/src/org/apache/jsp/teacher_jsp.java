package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class teacher_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Teacher page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        Welcome \n");
      out.write("        ");

            out.print(session.getAttribute("visitor"));
        
      out.write("\n");
      out.write("\n");
      out.write("        ");

            String user = session.getAttribute("visitor").toString();
        
      out.write("\n");
      out.write("\n");
      out.write("        <form name=\"list\" action=\"listing.jsp\">\n");
      out.write("            <br>\n");
      out.write("            Press to see available courses\n");
      out.write("            <input type=\"submit\" value=\"Go\" name=\"listbutt\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <form name=\"searchform\" action=\"search.jsp\" method=\"POST\">\n");
      out.write("            <br>\n");
      out.write("            Search students\n");
      out.write("            <br>\n");
      out.write("            Type student name\n");
      out.write("            <input type=\"text\" name=\"searchfield\" value=\"\" />\n");
      out.write("            <input type=\"submit\" value=\"search\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <form name=\"ccourse\" action=\"createcourse.jsp\" method=\"POST\">\n");
      out.write("            <br>\n");
      out.write("            Create new course\n");
      out.write("            <br>\n");
      out.write("            Term / Course name / Department\n");
      out.write("            <br>\n");
      out.write("            <input type=\"text\" name=\"term\" value=\"\" size=\"10\" />\n");
      out.write("            <input type=\"text\" name=\"name\" value=\"\" size=\"15\" />\n");
      out.write("            <input type=\"text\" name=\"dept\" value=\"\" size=\"10\" />\n");
      out.write("            <br>\n");
      out.write("            Teacher / Value / Limit\n");
      out.write("            <br>\n");
      out.write("            <input type=\"text\" name=\"teacher\" value=\"'");
      out.print(user);
      out.write("'\" size=\"10\" readonly=\"readonly\" />\n");
      out.write("            <input type=\"text\" name=\"value\" value=\"3\" size=\"5\" />\n");
      out.write("            <input type=\"text\" name=\"limit\" value=\"30\" size=\"5\" />\n");
      out.write("            <br>\n");
      out.write("            Day / Time\n");
      out.write("            <select name=\"day\">\n");
      out.write("                <option>Monday</option>\n");
      out.write("                <option>Tuesday</option>\n");
      out.write("                <option>Wednesday</option>\n");
      out.write("                <option>Thursday</option>\n");
      out.write("                <option>Friday</option>\n");
      out.write("            </select>\n");
      out.write("            <select name=\"time\">\n");
      out.write("                <option>08:00 - 10:00</option>\n");
      out.write("                <option>10:00 - 12:00</option>\n");
      out.write("                <option>14:00 - 16:00</option>\n");
      out.write("                <option>16:00 - 18:00</option>\n");
      out.write("            </select>\n");
      out.write("            <br>\n");
      out.write("            Exam Date (Format: \"yyyy-mm-dd\")\n");
      out.write("            <input type=\"text\" name=\"examdate\" value=\"yyyy-mm-dd\" />\n");
      out.write("            <select name=\"etime\">\n");
      out.write("                <option>08:00 - 10:00</option>\n");
      out.write("                <option>10:00 - 12:00</option>\n");
      out.write("                <option>14:00 - 16:00</option>\n");
      out.write("                <option>16:00 - 18:00</option>\n");
      out.write("            </select>\n");
      out.write("            <br>\n");
      out.write("            <input type=\"submit\" value=\"submit\" name=\"subbut\" />\n");
      out.write("        </form>\n");
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
