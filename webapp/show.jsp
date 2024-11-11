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


<link rel="stylesheet" type="text/css" href="css/zzsc-demo.css">
<link rel="stylesheet" type="text/css" href="css/style_button.css">


<link rel="stylesheet" type="text/css" href="css/zcity.css">

    <style>
        #container{
            width: 800px;   
            height: 780px; 
            margin: 60px 250px;   
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
border:2px;font-family:"楷体","宋体", "微软雅黑";color:#fff;font-size:16px;
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
	
	
	
<% String city=new String(request.getParameter("city"));
city=new String(city.getBytes("iso-8859-1"),"utf-8");

try {
		Class.forName("com.mysql.jdbc.Driver");// 加载数据库驱动，注册到驱动管理器
		String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery";	// 数据库连接字符串
		String usename = "root";		// 数据库用户名
		String psw = "268268";	  // 数据库密码
		Connection conn = DriverManager.getConnection(url,usename,psw);	// 创建Connection连接
		if(conn != null){			// 判断 数据库连接是否为空
		Statement stmt = conn.createStatement();
			String sql="select * from yangtzeriverscenery.scenery where city like '"+city+"'";
			
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){%>
			<tr>
      <th height="32px">名称</th>
      <th>地址</th>
      <th>经度</th>
      <th>纬度</th>
      <th>城市</th>
      <th>省份</th>
      <th width="500px">介绍</th>
   </tr>
	<tr>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getString("address") %></td>
      <td><%=rs.getString("lng") %></td>
      <td><%=rs.getString("lat") %></td>
      <td><%=rs.getString("city") %></td>
      <td><%=rs.getString("province") %></td>
      <td><%=rs.getString("introduction") %></td>
   </tr>		
			<%}				
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

<table class="table1" border="1" align="center">
   <tr>
      <th height="32px">名称</th>
      <th>地址</th>
      <th>经度</th>
      <th>纬度</th>
      <th>城市</th>
      <th>省份</th>
      <th width="500px">介绍</th>
   </tr>
   <%
     String driverClass="com.mysql.jdbc.Driver";
     String url="jdbc:mysql://localhost:3306/yangtzeriverscenery";
     String user="root";
     String password="268268";
     Connection conn;
     try{
    	 Class.forName(driverClass);
    	 conn=DriverManager.getConnection(url, user, password);
    	 Statement stmt=conn.createStatement();
    	 String sql="select * from yangtzeriverscenery.scenery where city like '"+city+"'";
    	 ResultSet rs=stmt.executeQuery(sql);
    	 while(rs.next()){
   %>
   <tr>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getString("address") %></td>
      <td><%=rs.getString("lng") %></td>
      <td><%=rs.getString("lat") %></td>
      <td><%=rs.getString("city") %></td>
      <td><%=rs.getString("province") %></td>
      <td><%=rs.getString("introduction") %></td>
   </tr>
   <%
    	 }
     }catch (Exception ex){
    	 ex.printStackTrace();
    	
     }
 
     try{
    	 Class.forName(driverClass);
    	 conn=DriverManager.getConnection(url, user, password);
    	 Statement stmt=conn.createStatement();
    	 String sql="select * from yangtzeriverscenery.scenery where province like '"+city+"'";
    	 ResultSet rs=stmt.executeQuery(sql);
    	 while(rs.next()){
   %>
   <tr>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getString("address") %></td>
      <td><%=rs.getString("lng") %></td>
      <td><%=rs.getString("lat") %></td>
      <td><%=rs.getString("city") %></td>
      <td><%=rs.getString("province") %></td>
      <td><%=rs.getString("introduction") %></td>
   </tr>
   <%
    	 }
     }catch (Exception ex){
    	 ex.printStackTrace();
    	
     }
     try{
    	 Class.forName(driverClass);
    	 conn=DriverManager.getConnection(url, user, password);
    	 Statement stmt=conn.createStatement();
    	 String sql="select * from yangtzeriverscenery.scenery where name like '"+city+"'";
    	 ResultSet rs=stmt.executeQuery(sql);
    	 while(rs.next()){
   %>
   <tr>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getString("address") %></td>
      <td><%=rs.getString("lng") %></td>
      <td><%=rs.getString("lat") %></td>
      <td><%=rs.getString("city") %></td>
      <td><%=rs.getString("province") %></td>
      <td><%=rs.getString("introduction") %></td>
   </tr>
   <%
    	 }
     }catch (Exception ex){
    	 ex.printStackTrace();
    	
     }
     try{
    	 Class.forName(driverClass);
    	 conn=DriverManager.getConnection(url, user, password);
    	 Statement stmt=conn.createStatement();
    	 String sql="select * from yangtzeriverscenery.scenery where address like '%"+city+"%'";
    	 ResultSet rs2=stmt.executeQuery(sql);
    	 while(rs2.next()){
   %>
   <tr>
      <td><%=rs2.getString("name") %></td>
      <td><%=rs2.getString("address") %></td>
      <td><%=rs2.getString("lng") %></td>
      <td><%=rs2.getString("lat") %></td>
      <td><%=rs2.getString("city") %></td>
      <td><%=rs2.getString("province") %></td>
      <td><%=rs2.getString("introduction") %></td>
   </tr>
   <%
    	 }
     }catch (Exception ex){
    	 ex.printStackTrace();
    	
     }
   %>
</table>

</body>
</html>