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
            <center> <h2>View Votes Details</h2></center>
            <%@page import="java.sql.*" %>
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting","root","root");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from votes");
                    %>
                    <table border="2px" align="center">
                        <tr>
                              <th>Party Name</th>
                            <th>Candidate ID</th>
                              <th>Candidate Name</th>
                                <th>Constituency</th>
                                  
                        </tr>
                        <%while(rs.next())
                        {
                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                 <td><%=rs.getString(4)%></td>
                                  
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
