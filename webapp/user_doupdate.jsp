<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>数据更新</title>
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
    String user_name=null;
    String user_mail=null;
    String pwd=null;
    String type=null;
%>
<%
    try{

        Class.forName(DBDRIVER);
        conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
        request.setCharacterEncoding("utf-8");
        
        user_name=request.getParameter("user_name");
        user_mail=request.getParameter("user_mail");
        pwd=request.getParameter("pwd");
        type=request.getParameter("type");
        String sql_update="update yangtzeriverscenery.user set user_name='"+user_name+"',pwd='"+pwd+"',type='"+type+"'where user_mail='"+user_mail+"'";
        pst=conn.prepareStatement(sql_update);
        rs=pst.executeUpdate();
        if(rs!=0){
            out.println("更新成功");
%>
<jsp:forward page="user.jsp"></jsp:forward>
<%--修改之后转到展示页面--%>
<%
        }
    }
    catch(Exception e){
        out.println(e);
    }

%>
</body>
</html>
