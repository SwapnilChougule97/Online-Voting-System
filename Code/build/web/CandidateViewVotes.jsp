<!DOCTYPE html>
<html>
    <head>
        <title>Online Voting System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css" />
        <style>

            #abstract
            {
                width:80%;
                height:400px;

            }
        </style>
    </head>
    <body>
        <div id="title" class="active">Online Voting System</div>
        <div id="menu">
            <ul>
                <li><a href="CandidateHome.jsp">Home</a></li>


                <li><a href="CandidateViewVotes.jsp">View Votes</a></li>

                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>




        <div id="abstract">
            <%String username = (String) session.getAttribute("username");
                String pname = (String) session.getAttribute("pname");
            %>
            <img src="images/party.png" align="right" width="350px" height="300px" style="margin-top:50px;">
            <h2><center>Welcome  <%=username%> Party Name <%=pname%></center></h2>
            <center> <h2>View Votes Details</h2></center>
                <%@page import="java.sql.*" %>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from votes where pname='" + pname + "'");
                %>
            <table border="2px" align="center">
                <tr>
                    <th>Party Name</th>
                    <th>Candidate ID</th>
                    <th>Candidate Name</th>
                    <th>Constituency</th>

                </tr>
                <%while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>

                </tr>
                <%}
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </table>
        </div>
    </body>
</html>
