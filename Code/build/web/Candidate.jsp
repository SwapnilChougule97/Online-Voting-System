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
                <li><a href="index.html">Home</a></li>
                 <li><a href="Admin.jsp">Admin </a></li>
                  <li><a href="Voter.jsp">Voter</a></li>
<!--                   <li><a href="Register.jsp"> Voter Registration</a></li>-->
                   <li><a href="Party.jsp">PoliticalParty</a></li>
<!--                   <li><a href="PartyReg.jsp">Party Registration</a></li>-->
                   <li><a href="Candidate.jsp">Candidate</a></li>
<!--                   <li><a href="CandidateReg.jsp">Candidate Registration</a></li>-->
            </ul>
        </div>
        
        
        
        
        <div id="abstract">
            <img src="images/candidate.png" align="right" width="350px" height="250px" style="margin-top:50px;">
            <h2><center>Candidate Login</center></h2>
             <%String msg=request.getParameter("reg");%>
            <%if(msg!=null)
            {%>
            <center><h2><font color="blue" size="5"><%=msg%></font></h2></center>
                <%
            }%>
            <form name="login" action="CandidateLogin.jsp" method="post">
            <table width="300px" height="200px" style="margin-left:200px;">
                <tr><td>Username</td><td><input type="text" name="username" required=""></td></tr>
                <tr><td>Password</td><td><input type="password" name="password" required=""></td></tr>
                <tr><td><input type="submit" value="Login"></td><td><input type="Reset"></td></tr>
            </table>
            </form>
            <a href="CandidateReg.jsp"><center>Register new Candidate</center></a>
        </div>
    </body>
</html>
