<%@page import="java.sql.*"%>

<%

String pid=request.getParameter("pid");
try{
    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting","root","root");
           
    Statement st=con.createStatement();
    int i=st.executeUpdate("update party set status='Activated' where pid='"+pid+"'");
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("Party Activated successfully");
            window.location="ViewParties.jsp";
            </script>
        <%
    }else{
 %>
        <script type="text/javascript">
            window.alert("Activation Failed");
            window.location="ViewParties.jsp";
            </script>
        <%
}
    
}catch(Exception e){
    out.println(e);
}


%>