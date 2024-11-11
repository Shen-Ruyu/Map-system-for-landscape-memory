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
<form action="doupdate.jsp?user_mail=<%=rs.getString("user_mail")%>" method="post">
    <%--切换到doupdate,显示要更新的数据信息--%>
    用户名：<input type="text" value="<%=rs.getString("user_name")%>" name="user_name">
    密码： <input type="text" value="<%=rs.getString("pwd") %>" name="pwd">
    用户类型：<select name="type">
    <option value="1">管理员</option>
    <option value="0">普通用户</option>
</select>
    <input type="submit" value="修改">
    <input type="reset" value="取消">
</form>
<%
        }
    } catch (Exception e) {
        out.println(e);
    }
%>

</body>
</html>