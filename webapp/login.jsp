<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>明清长江中下游风景记忆系统</title>
    <link rel="stylesheet" href="css/style_regis.css">
<link rel="stylesheet" href="css/fort_regis.css">
    <style type="text/css">
body{
	 background-size: cover;

                min-width: 1000px;

	background-image:url(image/background.jpg);

}
h1{

	font-size: 60;
	
	font-family:"隶书";
	margin:150px;
}
.top-banner {
	background-color: #333;
}
.nav {
	margin-bottom: 30px;
}
.nav li.current a{
	background-color: #009DFF;
	color: #fff;
	padding: 10px;
}
.nav a {
	margin: 5px;	
	color: #333;
	text-decoration: none;
}
</style>
<script src="fort.js"></script>
</head>
<body>
<h1>明清长江中下游风景记忆系统</h1>

<body><script src="/demos/googlegg.js"></script>
<div class="form-wrapper">
	<div class="top"><div class="colors"></div></div>

	<form name="form" method="post" action="check.jsp">
		<div class="form">
			<div class="form-item">
				<input type="text" name="id" required="required" placeholder="邮箱" autocomplete="off">
			</div>
			<div class="form-item">
				<input type="password" name="password" required="required" placeholder="密码" autocomplete="off">
			</div>
			<div class="button-panel">
				<input type="submit" class="button" title="Submit" value="登录">
			</div>
			<div class="button-panel">
				<input type="submit" class="button" title="regis" value="注册" onclick="window.location.href='registration.jsp';">
			</div>
		</div>
	</form>
</div>
<div class="footer-banner" style="width:728px; margin:200px auto 0"></div>
 
</body>
</html>
 