<!DOCTYPE html>
<html>
    <head>
        <title>Online Voting System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css" />
        <style>
            #image
            {
                width:40%;
                height:400px;
                margin: 10px;
                top: 40px ;

            }

            #abstract
            {
                width:80%;
                height:400px;
                text-align: center;

            }

            #abstract1
            {
                width:40%;
                height:400px;
                float:right;
                margin:10px;
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


        <div id="abstract1">
            <%String username = (String) session.getAttribute("username");%>
            <!--            <img src="images/voter.png" align="right" width="350px" height="300px" style="margin-top:50px;">-->
            <h2><center>Welcome  <%=username%></center></h2>

            <p align="justify"><h2 class="active">How to vote particular candidate. Follow below steps,</h2>

            <li>First go to view candidates.</li>
            <li>Check your constituency, party name and candidate name.</li>
            <li>Click on Vote Button.</li>
            <li>Once Voter can voted a candidate then he/she will not be vote for other candidate.</li>
        </p>
    </div>
    <div id="image">
        <img src="images/voter.jpg" width="600" height="400">
    </div>
</body>
</html>
