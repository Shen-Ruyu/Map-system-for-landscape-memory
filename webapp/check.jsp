<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.sql.*" pageEncoding="utf-8"%>
<body>
<%
	String id=new String(request.getParameter("id"));
	request.getSession().setAttribute("id",id);
	String password=new String(request.getParameter("password"));
	
	try {
		Class.forName("com.mysql.jdbc.Driver");// 加载数据库驱动，注册到驱动管理器
		String url = "jdbc:mysql://localhost:3306/yangtzeriverscenery";	// 数据库连接字符串
		String usename = "root";		// 数据库用户名
		String psw = "268268";	  // 数据库密码
		Connection conn = DriverManager.getConnection(url,usename,psw);	// 创建Connection连接
		if(conn != null){			// 判断 数据库连接是否为空
			String sql="select * from yangtzeriverscenery.user where user_mail='"+id+"' and pwd='"+ password + "'";
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				response.sendRedirect("main.jsp");				
			}else{
				out.print("用户名或密码错误，请重新输入！");
				%>
				<a href="javascript:history.back()">返回</a>
				<% 
			}			
 
			// 关闭数据库连接
			conn.close();
		}else{
			// 输出连接信息
			out.println("数据库连接失败！");						
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
</body>
 