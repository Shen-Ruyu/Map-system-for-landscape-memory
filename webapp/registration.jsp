<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>用户注册</title>

<link rel="stylesheet" href="css/style_regis.css">
<link rel="stylesheet" href="css/fort_regis.css">
<script src="fort_regis.js"></script>
<style type="text/css">
body{
	 background-size: cover;

                min-width: 1000px;

	background-image:url(image/background.jpg);

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
h1{
	font-size:50px;
	font-family:"隶书";
	margin:150px;
}
</style>

</head>
<body>
<h1>用户注册</h1>
<script src="/demos/googlegg.js"></script>

<div class="form-wrapper">
	<div class="top"><div class="colors"></div></div>

	<form name="form" action="check_regis.jsp">
		<div class="form">
			<div class="form-item">
				<input type="text" name="email" required="required" placeholder="邮箱" autocomplete="off">
			</div>
			<div class="form-item">
				<input type="text" name="name" required="required" placeholder="用户名" autocomplete="off">
			</div>
			<div class="form-item">
				<input type="password" name="password" required="required" placeholder="密码" autocomplete="off">
			</div>
			<div class="button-panel">
				<input type="submit" class="button" title="Sign In" value="注册">
			</div>
		</div>
	</form>
</div>

<div class="footer-banner" style="width:728px; margin:200px auto 0"></div>
<script>
    solid();
    
</script>


</body>
</html>