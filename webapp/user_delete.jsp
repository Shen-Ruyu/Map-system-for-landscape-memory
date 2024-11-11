<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.sql.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'delete.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%!
    public static final String DBDRIVER="com.mysql.cj.jdbc.Driver";
    public static final String DBURL="jdbc:mysql://localhost:3306/yangtzeriverscenery";
    public static final String DBUSER="root";
    public static final String DBPASS="268268";
%>
    <%
    Connection conn=null;
    PreparedStatement pst=null;
    int rs=0;
    String user_mail=request.getParameter("user_mail");
%>

    <%
   try{
	  Class.forName(DBDRIVER);
	  conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
	  String sql_delete="delete from yangtzeriverscenery.user where user_mail= '"+user_mail+"'";
	  //获取要删除的此id的数据库信息
	  pst=conn.prepareStatement(sql_delete);
	  rs=pst.executeUpdate();
	  if(rs!=0){
		  out.println("删除成功");
%>
<jsp:forward page="user.jsp">
    <jsp:param name="user_mail" value="user_mail"/>
</jsp:forward>
<%
        }
    }
    catch(Exception e){
        out.println(e);
    }

%>
  </body>
</html>
