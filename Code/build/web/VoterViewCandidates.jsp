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
                <li><a href="VoterHome.jsp">Home</a></li>

                <li><a href="VoterViewParties.jsp">View Parties</a></li>
                <li><a href="VoterViewCandidates.jsp">View Candidates</a></li>

                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>




        <div id="abstract">
            <%String username = (String) session.getAttribute("username");%>
            <h2><center>Welcome  <%=username%></center></h2>
            <center> <h2>View Candidates  Details</h2></center>
                <%@page import="java.sql.*" %>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select *from candidate");
                %>
            <table border="2px" align="center">
                <tr>

                    <th>Party Name</th>
                    <th>Candidate  Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>

                    <th> Email Id </th>
                    <th> mobile Number</th>



                    <th>Username</th>
                    <th>constituency</th>
                    <th>Image</th>
                    <th>Status</th>
                    <th>Vote</th>

                </tr>
                <%while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>


                    <td><%=rs.getString(11)%></td>

                    <td><%=rs.getString(12)%></td>
                    <td><image src="cview.jsp?cid=<%=rs.getString(2)%>" width="100" height="100"></td>
                    <td><%=rs.getString(14)%></td>
                    <td><a href="Vote.jsp?pname=<%=rs.getString(1)%>&cid=<%=rs.getString("cid")%>&cname=<%=rs.getString(10)%>&consis=<%=rs.getString(12)%>"><font color="blue" size="4">Vote</a></td>

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
