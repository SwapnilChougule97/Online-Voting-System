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
            <center> <h2>View Party  Details</h2></center>
                <%@page import="java.sql.*" %>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select *from party");
                %>
            <table border="2px" align="center">
                <tr>
                    <th>Voter Id</th>
                    <th>Party Name</th>

                    <th>Party Email Id </th>
                    <th>Party mobile Number</th>

                    <th>Party Address</th>

                    <th>Username</th>

                    <th>Image</th>
                    <th>Status</th>

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


                    <td><image src="pview.jsp?pid=<%=rs.getString(1)%>" width="100" height="100"></td>
                    <td><%=rs.getString(9)%></td>

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
