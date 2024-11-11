<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.sql.*" pageEncoding="utf-8"%>
<html>
	<body>
		<%
 
			Class.forName("com.mysql.cj.jdbc.Driver");//加载MYSQL JDBC驱动程序   
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/shen","root","268268");
			//数据库连接，3306是端口号，javaweb是数据库名称，root是用户，123456是密码
			Statement stat = connect.createStatement();
			String sql_2 = "select * from yangtzeriverscenery.admin";
			ResultSet rs = stat.executeQuery(sql_2);
			
			out.println("账号"+"  "+"密码 "+"  "+"学号 "+"  "+"姓名 <br>");  
            while (rs.next()) {  
            	out.println(rs.getString("id")+"    "+rs.getString("password")+"    "+rs.getString("name")+" <br>");
            }
			stat.close();
			connect.close();
    	%>
    	<input type="button" value="登录" onClick="window.location.href='login.jsp'">
	</body>
</html>
