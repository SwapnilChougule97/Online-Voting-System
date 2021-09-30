<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
    String username=request.getParameter("username");
    session.setAttribute("username",username);
    String password=request.getParameter("password");
   
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
         Connection    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
      Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select * from admin where username='"+username+"' and password='"+password+"' ");
      if(rs.next())
      {
       %>
       <script type="text/javascript">
           window.alert("Admin Login SuccessFully");
           window.location="AdminHome.jsp";
           
           </script>
        <%
      }
else
{
%>
       <script type="text/javascript">
           window.alert("Admin Login Fail");
           window.location="Admin.jsp";
           
           </script>
        <%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>


