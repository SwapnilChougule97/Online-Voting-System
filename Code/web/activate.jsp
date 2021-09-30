
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%
    String vid = request.getParameter("vid");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
        Statement st = con.createStatement();
        int i = st.executeUpdate("update voter set status='Activated' where vid='" + vid + "'");
        if (i > 0) {
%>
<script type="text/javascript">
    window.alert("Voter Activated Sucessfully");
    window.loaction = "ViewVoters.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.alert("Unable To Activate Voter");
    window.loaction = "ViewVoters.jsp";
</script>
<%
        }
    } catch (Exception e) {
        out.println(e);
    }
%>