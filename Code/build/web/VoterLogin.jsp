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
      ResultSet rs=st.executeQuery("select * from voter where username='"+username+"' and password='"+password+"' ");
      while(rs.next())
      {
          String status=rs.getString("status");
          if(status.equalsIgnoreCase("Activated"))
          {
             %>
       <script type="text/javascript">
           window.alert("Voter Login SuccessFully");
           window.location="VoterHome.jsp";
           
           </script>
        <% 
          }
       
      
else if(status.equalsIgnoreCase("waiting"))
{
%>
       <script type="text/javascript">
           window.alert("Admin Not Yet Activated your Account");
           window.location="Voter.jsp";
           
           </script>
        <%
}
else
{
%>
       <script type="text/javascript">
           window.alert("Username or password Incorrect");
           window.location="Voter.jsp";
           
           </script>
        <%
}
%>
       <script type="text/javascript">
           window.alert("Username or password Incorrect");
           window.location="Voter.jsp";
           
           </script>
        <%
}
%>
       <script type="text/javascript">
           window.alert("Username or password Incorrect");
           window.location="Voter.jsp";
           </script>
        <%
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>


