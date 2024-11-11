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
    <title>明清长江中下游风景记忆系统</title>
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


    <style>
        #container{
            width: 800px;   
            height: 780px; 
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
</head>
<body>

<div id="container"></div>

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


<script>
<%
 Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yangtzeriverscenery?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8","root","268268");
	Statement stat=conn.createStatement();
	String sql="SELECT * FROM yangtzeriverscenery.scenery";//查询sql语句
	ResultSet rs=stat.executeQuery(sql);//返回结果集
	List<String> list_name = new ArrayList<String>();
	List<String> list_x = new ArrayList<String>();
	List<String> list_y = new ArrayList<String>();
	List<String> list_id = new ArrayList<String>();	
	while(rs.next())
	{		
			list_name.add(rs.getString("name"));
			list_x.add(rs.getString("lng"));
			list_y.add(rs.getString("lat"));
			list_id.add(rs.getString("scene_id"));
	} 
	if(list_name != null)
	{
	String[]arr1=new String[list_name.size()];
	String[]arr2=new String[list_name.size()];
		String[][]arr = new String[list_x.size()][2];
		
		%>
		var lnglats = new Array();
		var name=new Array();
		var id=new Array();
		<%
		for (int i=0;i<list_x.size();i++)
		{
		arr1[i] = list_name.get(i);
		arr2[i] = list_id.get(i);
			arr[i][0] = list_x.get(i);
			arr[i][1] = list_y.get(i);
				
			%>
			name[<%=i%>]='<%=arr1[i]%>';
			id[<%=i%>]='<%=arr2[i]%>';
			lnglats[<%=i%>] =[];						
			lnglats[<%=i%>][0] = <%=arr[i][0]%>;
			lnglats[<%=i%>][1] = <%=arr[i][1]%>;
			
		<%	
		}
	}
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/yangtzeriverscenery","root","268268");
	Statement stat2=conn.createStatement();
	String sql2="SELECT * FROM yangtzeriverscenery.scenery";//查询sql语句
	ResultSet rs2=stat.executeQuery(sql);//返回结果集
	List<String> list_name2 = new ArrayList<String>();
	while(rs2.next())
	{		
			list_name2.add(rs2.getString("name"));
	} 
	if(list_name2 != null)
	{
	String[]arr12=new String[list_name2.size()];	
		%>
		var name2=new Array();
		<%
		for (int i=0;i<list_name2.size();i++)
		{
		arr12[i] = list_name2.get(i);
			%>
			name2[<%=i%>]='<%=arr12[i]%>';
			
		<%	
		}
	}


%>




    var map = new AMap.Map('container', {
        resizeEnable: true,
        zoom:4,
        center: [116.397428, 39.90923],
        //mapStyle:'amap://styles/2e7ed1eef2b5248952cc84724fb09a46'
        //前往创建自定义地图样式：https://lbs.amap.com/dev/mapstyle/index
        
    });
    
    // 创建一个 Marker 实例：（标记点）
        var marker1 = new AMap.Marker({
           position: new AMap.LngLat(118.751522, 32.0561), // 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
           title: "石头城"
        });
 
       // 将创建的点标记添加到已有的地图实例：
       map.add(marker1);
       
       var clickHandler = function(e){
	//放大地图
	//state.map是地图本身 第一个参数14是地图显示的缩放级别 第二个参数是高德的自带的函数getPosition,拿到当前标记点的经纬度
    map.setZoomAndCenter(18,e.target.getPosition());
	}
	
	marker1.on("click", clickHandler); 
	
for (var i = 0, marker; i < lnglats.length; i++) {
        var marker = new AMap.Marker({
            position: lnglats[i],
            title:name[i],
            name:name[i],
            map: map
        });
        marker.content = '<div><h4>名称：'+name2[i]+'</h4></div>';
        marker.content += '<div>经度：'+lnglats[i][0]+'</div>';
        marker.content += '<div>纬度：'+lnglats[i][1]+'</div>';
        
        marker.on('mouseover', infoOpen);
		//注释后打开地图时默认关闭信息窗体
		marker.on('mouseout', infoClose);
		marker.on('click', newMAp);
		marker.on("click", clickHandler);
		
    }
    map.setMapStyle("amap://styles/fresh");
 
function newMAp(e) {
		map.setZoomAndCenter(18, e.target.getPosition());
		
		var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});
		infoWindow.setContent(e.target.content);
		infoWindow.open(map, e.target.getPosition());	
	}
    function infoClose(e) {
		infoWindow.close(map, e.target.getPosition());
	}
    function infoOpen(e) {
        infoWindow.setContent(e.target.content);
        infoWindow.open(map, e.target.getPosition());
    }
    		map.setFitView();
 	function closeInfoWindow() {
        map.clearInfoWindow();
};

let divs=document.querySelectorAll('div');

function dingwei(i){
map.setZoomAndCenter(18,lnglats[i]);
var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});
infoWindow.setContent(lnglats[i]);
infoWindow.open(map, lnglats[i]);			



for(x =0; x < 37; x++){
if(x==i){
document.getElementById(i).style.display="block";
}
else
document.getElementById(x).style.display="none";
}



}



</script>



 <aside>
        <h3>长江三十六景</h3>
      
   				<button class="button" onclick="dingwei(0)">石城霁雪</button>
   				<button class="button" onclick="dingwei(1)">狮岭雄观</button>
   				<button class="button" onclick="dingwei(2)">秦淮渔唱</button>
   				<button class="button" onclick="dingwei(3)">凤凰三山</button>
   				<button class="button" onclick="dingwei(4)">鹭洲二水</button>
   				<button class="button" onclick="dingwei(5)">来燕名堂</button>
   				<button class="button" onclick="dingwei(6)">朝天香火</button>
   				<button class="button" onclick="dingwei(7)">燕矶夕照</button>
   				<button class="button" onclick="dingwei(8)">栖霞胜景</button>
   				<button class="button" onclick="dingwei(9)">雨花说法</button>
   				<button class="button" onclick="dingwei(10)">钟阜晴云</button>
   				<button class="button" onclick="dingwei(11)">鸡笼云树</button>
   				<button class="button" onclick="dingwei(12)">灵谷深松</button>
   				<button class="button" onclick="dingwei(13)">北湖烟柳</button>
   				<button class="button" onclick="dingwei(14)">牛首烟岚</button>
   				<button class="button" onclick="dingwei(15)">瓜洲古渡</button>
   				<button class="button" onclick="dingwei(16)">荷浦熏风</button>
   				<button class="button" onclick="dingwei(17)">鲈乡烟雨</button>
   				
			

      
</aside>
<aside class="aside2">
				<button class="button" onclick="dingwei(18)">归田园居</button>
   				<button class="button" onclick="dingwei(19)">甘露佳亭</button>
   				<button class="button" onclick="dingwei(21)">金焦风涛</button>
   				<button class="button" onclick="dingwei(22)">太湖春波</button>
   				<button class="button" onclick="dingwei(23)">名园画楼</button>
   				<button class="button" onclick="dingwei(24)">醉酒骑鲸</button>
   				<button class="button" onclick="dingwei(25)">孤山观涛</button>
   				<button class="button" onclick="dingwei(26)">塔影横江</button>
   				<button class="button" onclick="dingwei(27)">谢楼怀古</button>
   				<button class="button" onclick="dingwei(28)">九峰莲华</button>
   				<button class="button" onclick="dingwei(29)">鹤楼搁笔</button>
   				<button class="button" onclick="dingwei(30)">云梦月影</button>
   				<button class="button" onclick="dingwei(31)">风月无边</button>
   				<button class="button" onclick="dingwei(32)">匡庐奇秀</button>
   				<button class="button" onclick="dingwei(33)">鄱湖浪涌</button>
   				<button class="button" onclick="dingwei(34)">帝阁江流</button>
   				<button class="button" onclick="dingwei(35)">赤壁沧浪</button>
   				<button class="button" onclick="dingwei(36)">泽畔行吟</button>

</aside>	






<div id="0" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='石头城';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><a href = "https://baike.baidu.com/item/%E7%9F%B3%E5%A4%B4%E5%9F%8E/2780452"><%=rs3.getString("name")%></a></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="1" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='阅江楼';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="2" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='秦淮河';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="3" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='凤凰台';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="4" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='白鹭洲';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="5" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='乌衣巷';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="6" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='朝天宫';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="7" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='燕子矶';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="8" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态

			%>
			<%
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='栖霞山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
			
				
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>

		
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
			</div>
<div id="9" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='雨花台';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="10" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='钟山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="11" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='鸡笼山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="12" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='灵谷寺';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="13" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='玄武湖';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="14" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='牛首山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="15" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='瓜洲古渡';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="16" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='瘦西湖';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="17" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='同里古镇';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="18" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='拙政园';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="19" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='北固山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="20" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='焦山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="21" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='金山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="22" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='太湖';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="23" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='豫园';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="24" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='采石矶';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="25" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='小孤山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="26" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='迎江寺';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="27" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='谢朓楼';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="28" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='九华山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="29" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='黄鹤楼';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="30" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='洞庭湖';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="31" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='岳阳楼';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="32" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='庐山';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="33" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='鄱阳湖';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="34" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='滕王阁';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="35" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='赤壁';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="36" class="div3">
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery"; //数据库名
				String username = "root"; //数据库用户名
				String password = "268268"; //数据库用户密码
				Connection conn3 = DriverManager.getConnection(url, username, password); //连接状态
				Statement stmt3 = null;
					ResultSet rs3 = null;
					String sql3 = "SELECT * FROM yangtzeriverscenery.scenery where name='东湖';"; //查询语句
					stmt3 = conn3.createStatement();
					rs3 = stmt3.executeQuery(sql3);
					out.print("<br/>");
					while (rs3.next()) {
			%>
				<h5><%=rs3.getString("name")%></h5>
				<img width="300" src="image/<%=rs3.getString("picture")%>"/>
				<p><%=rs3.getString("address")%></p>
				<p><%=rs3.getString("city")%>·<%=rs3.getString("province")%></p>
				<p><%=rs3.getString("introduction")%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("数据库连接失败");
				}
			%>
</div>
<div id="37" class="div3">
<h5>明清长江中下游风景记忆系统</h5>
	</div>
<script type="text/javascript">
for(x = 0; x <37; x++){
document.getElementById(x).style.display="none";
}
			
</script>
</body>
</html>