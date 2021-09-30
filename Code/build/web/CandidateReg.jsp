<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Voting System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script language="Javascript" src="jquery.js"></script>
        <script type="text/JavaScript" src='state.js'></script>
        <link rel="stylesheet" type="text/css" href="style1.css">
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
                <li><a href="index.html">Home</a></li>
                <li><a href="Admin.jsp">Admin </a></li>
                <li><a href="Voter.jsp">Voter</a></li>
                <!--                   <li><a href="Register.jsp"> Voter Registration</a></li>-->
                <li><a href="Party.jsp">PliticalParty</a></li>
                <!--                   <li><a href="PartyReg.jsp">Party Registration</a></li>-->
                <li><a href="Candidate.jsp">Candidate</a></li>
                <!--                   <li><a href="CandidateReg.jsp">Candidate Registration</a></li>-->
            </ul>
        </div>




        <div id="abstract">
            <img src="images/reg.jpg" align="right" width="300px" height="350px" style="margin-top:50px;">
            <h2><center>Candidate  Registration Form</center></h2>
                    <%String msg = request.getParameter("reg");%>
                    <%if (msg != null) {%>
            <h2><font color="blue" size="5"><%=msg%></font></h2>
                <%}%>
                <%

                    Random rand = new Random();

                    String useridds = "CID_" + String.valueOf(rand.nextInt(10)) + String.valueOf(rand.nextInt(10)) + String.valueOf(rand.nextInt(10)
                            + String.valueOf(rand.nextInt(10)) + String.valueOf(rand.nextInt(10)) + String.valueOf(rand.nextInt(10)) + String.valueOf(rand.nextInt(10)));


                %>
            <form name="login" action="CandidateRegister" method="post" enctype="multipart/form-data">
                <table width="350px" height="550px" style="margin-left:200px;">
                    <%@page import="java.sql.*"%>
                    <%  try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "root");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from party ");
                    %>
                    <tr><td>Select party</td><td><select name="pname">
                                <%while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("pname")%>"><%=rs.getString("pname")%></option>
                                <% }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                            </select></td></tr>

                    <tr><td>candidate  Id</td><td><input type="text" name="cid"  value="<%=useridds%>"></td></tr>
                    <tr><td>First Name</td><td><input type="text" name="fname" required=""></td></tr>
                    <tr><td>Last name</td><td><input type="text" name="lname" required=""></td></tr>
                    <tr><td>Email</td><td><input type="email" name="email" required=""></td></tr>
                    <tr><td>Mobile</td><td><input type="text" name="mobile" required=""></td></tr>
                    <tr><td>Gender</td><td><select name="gender">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Others">Others</option>
                            </select></td></tr>
                    <tr><td>Address</td><td><input type="text" name="address" required=""></td></tr>
                    <tr><td>Aadhar Number</td><td><input type="text" name="aadhar" required=""></td></tr>
                    <tr><td>Username</td><td><input type="text" name="username" required=""></td></tr>
                    <tr><td>Password</td><td><input type="password" name="password" required=""></td></tr>
                    <tr><td>constituency</td><td><input type="text" name="constituency" required=""></td></tr>
                    <tr><td>Select Image</td><td><input type="file" name="image" required=""></td></tr>
                    <tr><td><input type="submit" value="Register"></td><td><input type="Reset"></td></tr>
                </table>
            </form>
        </div>
    </body>
</html>
