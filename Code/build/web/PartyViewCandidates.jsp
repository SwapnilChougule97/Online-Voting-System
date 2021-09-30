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
                <li><a href="PartyHome.jsp">Home</a></li>
                
                <li><a href="PartyViewCandidates.jsp">View Candidates</a></li>
                
              
                   <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
        
        
        
        
        <div id="abstract">
            <%String username=(String)session.getAttribute("username");
            String pname=(String)session.getAttribute("pname");%>
            <h2><center>Welcome  <%=username%></center></h2>
            <%@page import="java.sql.*" %>
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting","root","root");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select *from candidate where pname='"+pname+"'");
                    %>
                    <table border="2px" align="center">
                        <tr>
                              
                            <th>Party Name</th>
                              <th>Candidate  Id</th>
                              <th>First Name</th>
                              <th>Last Name</th>
                             
                                <th> Email Id </th>
                                  <th> mobile Number</th>
                                    
                                      <th>Address</th>
                                      <th>Gender</th>
                                      <th>Aadhar Number</th>
                                          <th>Username</th>
                                          <th>constituency</th>
                                            <th>Image</th>
                                                 <th>Status</th>
                                                 <th>Accept</th>
                        </tr>
                        <%while(rs.next())
                        {
                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                 <td><%=rs.getString(2)%></td>
                                  <td><%=rs.getString(3)%></td>
                                   <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                     <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                           <td><%=rs.getString(8)%></td>
                                              <td><%=rs.getString(9)%></td>
                                                 <td><%=rs.getString(11)%></td>
                                    
                                     <td><%=rs.getString(12)%></td>
                                          <td><image src="cview.jsp?cid=<%=rs.getString(2)%>" width="100" height="100"></td>
                                          <td><%=rs.getString(14)%></td>
                                          <td><a href="cactivate.jsp?cid=<%=rs.getString(2)%>">Activate</a></td>
                                      
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
