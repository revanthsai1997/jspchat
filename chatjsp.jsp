<%@ page import="java.util.*" %>
<html>
<head>
	<link href='https://fonts.googleapis.com/css?family=Miltonian' rel='stylesheet'>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
		body{
			background-image:url("images/map.jpg");
		}
		.header{
			background-color:#f1f1f1;
			font-family: 'Miltonian';
			padding:20px;
			text-align:center;
			color:red;
			animation: example infinite;
   			animation-duration: 15s;
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
		input[type=text]{
			margin-left:150px;
			margin-top:75px;
			padding:12px 80px;
			border-radius:5px;
		}
		input[type=submit]{
			height:47px;
			width:100px;
			border-radius:5px;
			background-color:SpringGreen;
		}
		table{
			margin-top:10px;
		}
		textarea{
			margin-left:10px;
			width:95%;
			height:300px;
			background-image:url("images/fly.jpg");
			background-position:1390px 320px;
			opacity:0.9;
			border-radius:5px;
		}
		.col-md-8{
			background-color:#f1f1f1;
			
			background-image: url("images/xyz.gif");
			height:200px;
			margin-top:20px;
			width:800px;
			margin-left:30px;
			border-radius:5px;
			
		}
		.col-md-4{
			background-color:#f1f1f1;
			background-image: url("images/fight.gif");
			margin-top:20px;
			margin-left:20px;
			width:470px;
			height:200px;
			overflow:scroll;
			border-radius:5px;
			background-repeat:no-repeat;
			
		}
	</style>
</head>
<body>
	<form action="chatjsp.jsp" method="post">
	<%
		String chatowner=(String)session.getAttribute("chatownername");
		Hashtable<String,ArrayList<String>> ht=(Hashtable<String,ArrayList<String>>)application.getAttribute("hashtable");
		Enumeration<String> e=ht.keys(); 
	%>
	<div class="header">
	<h1 style="font-size:50px;">Welcome <%=chatowner%></h1>
	</div>
	<div class="row">
	<div class="col-md-8">
	<input type="text" id="msgtf" name="msgtf" >
	<input type="submit" name="action" value="SEND">
	</div>
	<div class="col-md-4">
	<table class="table table-bordered table-hover table-condensed">
	<tr>
		<th style="background-color:Gray;">IDIOTS Online</th>
	</tr>
	<%
	while(e.hasMoreElements())
	{
		String username=e.nextElement();
		if(username!=chatowner)
		{
		%>
			<tr>
				<td><input type="radio" name="users" value="<%=username%>"><%=username%></td>
			</tr>
		<%
		}
	}
	%>
	</table>
	</div>
	</div>
	</form>
	<textarea name="textreceived">
	<%
	ArrayList<String> ownerarray=ht.get(chatowner);
	Iterator<String> itr=ownerarray.iterator();
	while(itr.hasNext())
	{
		out.println(itr.next());
	}
	if(request.getParameter("users")!=null && request.getParameter("action").equals("SEND"))
	{
		ArrayList<String> userarray=ht.get(request.getParameter("users"));
		userarray.add(request.getParameter("msgtf")+" :from "+chatowner);
	}
	%>
	</textarea>
</body>
</html>