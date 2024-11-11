<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.sql.*" pageEncoding="utf-8"%>

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

<link rel="stylesheet" type="text/css" href="css/normalize_location.css" />
<link rel="stylesheet" href="css/font-awesome.min_location.css">
<link rel="stylesheet" type="text/css" href="css/demo_location.css">
<link rel="stylesheet" href="css/style_location.css">
    <style>

        #container{
            width: 1300px;   
            height: 780px; 
            margin: 100px 100px;   
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
font-family:"楷体,"宋体", "微软雅黑";
font-size: 60px;
margin: 60px; 

color:#fff;
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



<div class="search d1">
<h6 align="center">用户信息管理</h6>
	  <form name="form" method="post" action="user_show.jsp">
	  <input type="text" name="user" placeholder="请输入用户名或邮箱...">
	  <button type="submit"></button>
	  </form>
	</div>



<div  class="container2">
			<% String user_name =new String(request.getParameter("user"));
user_name=new String(user_name.getBytes("iso-8859-1"),"utf-8");
%>
<table align="center" cellpadding="2px" cellspacing="2px" border="1">
   <tr>
		<th width="200px">用户名</th>
                <th width="200px">邮箱</th>
                <th width="200px">密码</th>
                <th width="200px">用户类型</th>
                <th width="200px">操作</th>
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
    	 String sql="select * from yangtzeriverscenery.user where user_name like '%"+user_name+"%'";
    	 ResultSet rs=stmt.executeQuery(sql);
    	 while(rs.next()){
   %>
   <tr>
      <td><%=rs.getString("user_name") %></td>
      <td><%=rs.getString("user_mail") %></td>
      <td><%=rs.getString("pwd") %></td>
      <td><%=rs.getString("type") %></td>
<td style="text-align: center;"><a class="btn btn-default btn-sm" href="user_update.jsp?user_mail=<%=rs.getString("user_mail")%>">修改</a>&nbsp;<a
                            class="btn btn-default btn-sm" href="user_delete.jsp?user_mail=<%=rs.getString("user_mail")%>">删除</a></td>
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
    	 String sql="select * from yangtzeriverscenery.user where user_mail like '%"+user_name+"%'";
    	 ResultSet rs=stmt.executeQuery(sql);
    	 while(rs.next()){
   %>
   <tr>
      <td><%=rs.getString("user_name") %></td>
      <td><%=rs.getString("user_mail") %></td>
      <td><%=rs.getString("pwd") %></td>
      <td><%=rs.getString("type") %></td>
<td style="text-align: center;"><a class="btn btn-default btn-sm" href="user_update.jsp?user_mail=<%=rs.getString("user_mail")%>">修改</a>&nbsp;<a
                           class="btn btn-default btn-sm" href="user_delete.jsp?user_mail=<%=rs.getString("user_mail")%>">删除</a></td>
   </tr>
   <%
    	 }
     }catch (Exception ex){
    	 ex.printStackTrace();
    	
     }
    
   %>
</table>	</div>





</body>
</html>