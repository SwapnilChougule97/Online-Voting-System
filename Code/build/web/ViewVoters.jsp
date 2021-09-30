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
                <li><a href="AdminHome.jsp">Home</a></li>
                <li><a href="ViewVoters.jsp">View Voters</a></li>
                <li><a href="ViewParties.jsp">View Parties</a></li>
                 <li><a href="ViewCandidates.jsp">View Candidates</a></li>
                <li><a href="ViewVotes.jsp">View Vote's</a></li>
                   <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
        
        
        
        
        <div id="abstract">
            <%String username=(String)session.getAttribute("username");%>
            <h2><center>Welcome  <%=username%></center></h2>
            <center><h2>View Voter Details</h2></center>
            <%@page import="java.sql.*" %>
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting","root","root");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select *from voter");
                    %>
                    <table border="2px" align="center" style="margin-left:50px;">
                        <tr>
                              <th>Voter Id</th>
                            <th>First Name</th>
                              <th>Last Name</th>
                                <th>Email Id Name</th>
                                  <th>mobile Number</th>
                                    <th>gender</th>
                                      <th>Address</th>
                                        <th>Aadhar Number</th>
                                          <th>Username</th>
                                            <th>Constituency</th>
                                            <th>Image</th>
                                                 <th>Status</th>
                                                 <th>Accept</th>
                        </tr>
                        <%while(rs.next())
                        {
                            %>
                            <tr>
                                <td><%=rs.getString(3)%></td>
                                 <td><%=rs.getString(4)%></td>
                                  <td><%=rs.getString(5)%></td>
                                   <td><%=rs.getString(6)%></td>
                                    <td><%=rs.getString(7)%></td>
                                     <td><%=rs.getString(8)%></td>
                                      <td><%=rs.getString(9)%></td>
                                       <td><%=rs.getString(10)%></td>
                                        <td><%=rs.getString(11)%></td>
                                         <td><%=rs.getString(13)%></td>
                                          <td><image src="view.jsp?vid=<%=rs.getString(3)%>" width="100" height="100"></td>
                                          <td><%=rs.getString(15)%></td>
                                          <td><a href="activate.jsp?vid=<%=rs.getString(3)%>">Activate</a></td>
                                      
                            </tr>
                        <%}
}
catch(Exception e)
{
out.println(e);
}
%>
                    </table>
                
            
        </div>
    </body>
</html>
