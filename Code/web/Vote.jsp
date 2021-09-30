
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%
    String pname = request.getParameter("pname");
    String cid = request.getParameter("cid");
    String cname = request.getParameter("cname");
    String consis = request.getParameter("consis");
    String username = (String) session.getAttribute("username");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select count(*) from votes where vname='" + username + "'");
        while (rs.next()) {
            int count = rs.getInt(1);
            if (count == 0) {
                int i = st.executeUpdate("insert into votes values('" + pname + "','" + cid + "','" + cname + "','" + consis + "','" + username + "')");
                if (i > 0) {
%>
<script type="text/javascript">
    window.alert("Sucessfully Voted");
    window.location = "VoterHome.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    window.alert("Unable to Vote Now try After Some Time");
    window.location = "VoterHome.jsp";
</script>
<%
    }
%>
<script type="text/javascript">
    window.alert("Already Voted By You");
    window.location = "VoterHome.jsp";
</script>
<%
    }
%>
<script type="text/javascript">
    window.alert("Already Voted By You");
    window.location = "VoterHome.jsp";
</script>
<%
    }
%>
<script type="text/javascript">
    window.alert("Already Voted By You");
    window.location = "VoterHome.jsp";
</script>
<%
    } catch (Exception e) {
        out.println(e);
    }
%>
