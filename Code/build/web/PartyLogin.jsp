<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
    String username = request.getParameter("username");
    session.setAttribute("username", username);
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from party where username='" + username + "' and password='" + password + "' ");
        while (rs.next()) {
            String status = rs.getString("status");
            String pname = rs.getString("pname");
            session.setAttribute("pname", pname);
            if (status.equalsIgnoreCase("Activated")) {
%>
<script type="text/javascript">
    window.alert("Party Login SuccessFully");
    window.location = "PartyHome.jsp";

</script>
<%
} else if (status.equalsIgnoreCase("waiting")) {
%>
<script type="text/javascript">
    window.alert("Admin Not Yet Activated your Account");
    window.location = "Party.jsp";

</script>
<%
} else {
%>
<script type="text/javascript">
    window.alert("Username or password Incorrect");
    window.location = "Party.jsp";

</script>
<%
    }
%>
<script type="text/javascript">
    window.alert("Username or password Incorrect");
    window.location = "Voter.jsp";

</script>
<%
    }
%>
<script type="text/javascript">
    window.alert("Username or password Incorrect");
    window.location = "Voter.jsp";
</script>
<%
    } catch (Exception e) {
        out.println(e);
    }
%>


