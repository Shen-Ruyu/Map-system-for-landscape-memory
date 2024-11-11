<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>明清长江风景记忆系统</title>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <script type="text/javascript">
        window._AMapSecurityConfig = {
            securityJsCode:'4b4128186477d6a8c7be3c8d0d2fd974',
        }
    </script>    
    <script src="https://webapi.amap.com/maps?v=1.4.15&key=4b4128186477d6a8c7be3c8d0d2fd974"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>

    <link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="css/style_navi.css">

<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/lanren_sidebar.css">



    <style>

        #container{
            width: 800px;   
            height: 780px; 
            margin: 60px 250px;   
        }
        div.container2{
            width: 1300px;   
            height: 780px; 
            margin: 100px 100px;   
        }
        select{
        margin: 60px 250px;   
        }
        h4{
         font-size: 15px;
        color:#676662;
        }
aside{
margin: 60px 20px; 
	width:10%;
	float:left;
	font-family:"楷体", "宋体", "微软雅黑";
	font-color:#000;

}
aside.aside2{
margin: 113px -60px; 
	width:15%;
	float:left;
	font-family:"楷体", "宋体", "微软雅黑";
	font-color:#000;

}
aside.aside3{
width: 800px;   
            height: 780px; 
            margin: 60px 240px;  

}
div.div3{
margin: 60px 20px; 
	width:350px;
	height: 780px; 
	float:right;
	font-family:"楷体", "宋体", "微软雅黑";
	font-color:#000;

}
h3{
	margin:16px 12px 0 12px;
	padding:0 0 6px 0;
	color:white;
	border-bottom:solid 1px;
}
h5{
 font-size: 25px;
	color:white;
}
h6{
font-family:"宋体", "微软雅黑";
font-size: 13px;
}

a{
	text-decoration:none;
	color:#caffff;
}
a:hover{
	text-decoration:none;
	color:#C63;
}
a.a1{color: #fff;text-decoration: none;outline: none;}
a.a1:hover{
color:#D89C7A;
}
a.a1:focus{color:#74777b;}

        
    </style>
<style>

table.table1{
border:2px;font-family:"楷体","宋体", "微软雅黑";color:#fff;font-size:15px;
}
</style>

<style>
	body {
		margin: 0;
		padding: 0;
		font-family: '汉仪大隶书繁';
	}

	form {
		max-width: 640px;
		width: 100%;
		margin: 24px auto;
		font-size: 20px;
	}

	label {
		display: block;
		margin: 10px 10px 15px;
		font-size: 16px;
	}

	input {
		display: block;
		width: 100%;
		height: 40px;
		font-size: 15px;
		margin-top: 10px;
		padding: 6px 10px;
		color: #333;
		border: 1px solid #CCC;
		box-sizing: border-box;
	}

	meter, progress {
		display: block;
		width: 100%;
		margin-top: 10px;
	}

	.btn {
		margin-top: 30px;
	}

	.btn input {
		color: #FFF;
		background-color: green;
		border: 0 none;
		outline: none;
		cursor: pointer;
	}

</style>


</head>
<body>


<div class="htmleaf-container">
	<header class="header">
	<span class="btn-slide-bar"></span>
		<nav class="navigation">
			<div class="wrapper">
				<ul class="navigation-list ul-reset">
					<li class="navigation-item ib">
						<a href="main.jsp" class="navigation-link">
							首    页
						</a>
					</li>
					<li class="navigation-item ib">
						<a href="history.jsp" class="navigation-link">
							史料查询
						</a>
					</li>
					<li class="navigation-item ib">
						<a href="location.jsp" class="navigation-link">
							地点查询
						</a>
					</li>
					<li class="navigation-item ib">
						<a href="person.jsp" class="navigation-link">
							名人查询
						</a>
					</li>
					<li class="navigation-item ib">
						<a href="map.jsp" class="navigation-link">
							地图查询
						</a>
					</li>
					<li class="navigation-item ib">
						<a href="about.jsp" class="navigation-link">
							关于系统
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- /.header -->
</div>

<section class="slide-bar">
		<ul>
			<li><a class="a1" href="main.jsp">首页</a></li>
			<li><a class="a1" href="user.jsp">用户管理</a></li>
			<li><a class="a1" href="geography.jsp">地理信息管理</a></li>
			<li><a class="a1" href="poem.jsp">史料管理</a></li>
			<li><a class="a1" href="about.jsp">关于系统</a></li>
		</ul>
	</section>
	<script>
	document.addEventListener("DOMContentLoaded", function(){
		(function(){
			var _btn  = document.querySelector(".btn-slide-bar"),
				_body = document.querySelector("body");
				_btn.onclick = function(){
					_body.classList.toggle("active");
				}
		})(window)
	},false);
	</script>

<%!
     public static final String DBDRIVER="com.mysql.cj.jdbc.Driver";
    public static final String DBURL="jdbc:mysql://localhost:3306/yangtzeriverscenery";
    public static final String DBUSER="root";
    public static final String DBPASS="268268";
%>
<%
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String user_mail = null;
%>
<%
    try {
        Class.forName(DBDRIVER);
        conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        request.setCharacterEncoding("utf-8");
        user_mail = request.getParameter("user_mail");
        String sql_update = "select * from yangtzeriverscenery.user where user_mail='" +user_mail+ "'";
        //获取你要更新数据的id的数据库信息
        pst = conn.prepareStatement(sql_update);
        rs = pst.executeQuery();
        if (rs.next()) {
        %>
<div  class="container2">
<form action="user_doupdate.jsp?user_mail=<%=rs.getString("user_mail")%>" method="post">
	<fieldset>
		<legend>用户信息修改</legend>
		<label for="">
			用户名: <input type="text" value="<%=rs.getString("user_name")%>" name="user_name">
		</label>
		<label for="">
			密码: <input type="text" value="<%=rs.getString("pwd") %>" name="pwd">
		</label>
		<label for="">
			用户类型: <input type="text" list="course" name="type">
			<datalist id="course">
				<option value="管理员">管理员</option>
    			<option value="普通用户">普通用户</option>
			</datalist>
		</label>
	<label for="" class="btn">
			<input type="submit" value="保存">
		</label>
	</fieldset>
</form>


<%
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
</div>


</body>
</html>