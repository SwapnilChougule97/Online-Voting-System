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
            <%String username = (String) session.getAttribute("username");
                String pname = (String) session.getAttribute("pname");
            %>
            <img src="images/party.jpg" align="right" width="350px" height="300px" style="margin-top:50px;">
            <h2><center>Welcome  <%=username%></center></h2>

        </div>
    </body>
</html>
