<%@page import="java.sql.*"%>

<%

String cid=request.getParameter("cid");
try{
    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting","root","root");
           
    Statement st=con.createStatement();
    int i=st.executeUpdate("update candidate set status='Activated' where cid='"+cid+"'");
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("Candidate Activated successfully");
            window.location="PartyHome.jsp";
            </script>
        <%
    }else{
 %>
        <script type="text/javascript">
            window.alert(" Cndidate Activation Failed");
            window.location="PartyHome.jsp";
            </script>
        <%
}
    
}catch(Exception e){
    out.println(e);
}


%>