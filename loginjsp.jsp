<%@ page import="java.util.*" %>
<html>
<head>
	<link href='https://fonts.googleapis.com/css?family=Miltonian' rel='stylesheet'>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
		body{
			margin:0;
			background-image:url("images/pic.png");
		}
		.header{
			background-color:#f1f1f1;
			padding: 20px;
			text-align:center;
			font-family: 'Miltonian';
			-webkit-animation: example infinite; 
    			-webkit-animation-duration: 15s; 
   			 animation: example infinite;
   			 animation-duration: 15s;
			
		}
		@-webkit-keyframes example 
		{
   			0%   {background-color: #f1f1f1;}
    			20%  {background-color: LightSalmon;}
    			40%  {background-color: SeaGreen;}
    			60%  {background-color: SandyBrown;}
			80%  {background-color: Chocolate;}
			100% {background-color: CadetBlue;}
		}
		@keyframes example 
		{
    			0%   {background-color: #f1f1f1;}
    			20%  {background-color: LightSalmon;}
    			40%  {background-color: SeaGreen;}
    			60%  {background-color: SandyBrown;}
			80%  {background-color: Chocolate;}
			100% {background-color: CadetBlue;}
		}
		.loginbox{
			padding:20px;
			background-color:#f1f1f1;
			background-image:url('images/birds.gif');
			margin:20px 500px;
			border-radius:20px;
			text-align:center;
		}
		input[type=text]{
			border-radius:5px;
			background-image:url('images/logo.png');
			background-repeat: no-repeat;
			background-position: 600px 176px;
			background-attachment: fixed;
			background-size: 50px 46px;
			padding:10px 20px;
			margin-top:10px;
			
			padding-left:40px;
			
		}
		input[type=text]:focus{
			background-image:none;
		}
		input[type=submit]{
			background-color:SeaGreen;
			border-radius:5px;
			width=100%;
			padding:10px 40px;
			margin:20px;
			margin-bottom:10px;
			pointer:cursor;
		}
	</style>
</head>

<body>
	<form method="post">
		<div class="header">
			<h1 style="font-size:50px;">HelloBuddy.me</h1>
		</div>
		<div class="loginbox">
			
			<label>UserName: </label>
			<input type="text" name="t1" id="t1" placeholder="Your Name...">
			
			<br>
			<input type="submit" name="action" value="LOGIN">
		</div>

		<% 
			if(request.getParameter("action")!=null && request.getParameter("action").equals("LOGIN"))
			{
				
				Hashtable<String,ArrayList<String>> ht=(Hashtable<String,ArrayList<String>>)application.getAttribute("hashtable");
				if(ht==null)
				{
					ht=new Hashtable<String,ArrayList<String>>();
					ArrayList<String> al=new ArrayList<String>();
					ht.put(request.getParameter("t1"),al);
					application.setAttribute("hashtable",ht);
				}
				else
				{
					ArrayList<String> al=new ArrayList<String>();
					ht.put(request.getParameter("t1"),al);
					application.setAttribute("hashtable",ht);
				}
				
				String chatowner=(String)session.getAttribute("chatownername");
				if(chatowner==null)
				{
					chatowner=request.getParameter("t1");
					session.setAttribute("chatownername",chatowner);
				}
				else
				{
					chatowner=request.getParameter("t1");
					session.setAttribute("chatownername",chatowner);
				}
				RequestDispatcher rd=request.getRequestDispatcher("chatjsp.jsp");
				rd.forward(request,response);
			}
		%>
	</form>
</body>
</html>