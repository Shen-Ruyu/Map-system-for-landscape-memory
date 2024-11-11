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
    String name=null;
    String address=null;
    String lat=null;
    String lng=null;
     String city=null;
    String province=null;
    String introduction=null;
%>
<%
    try{

        Class.forName(DBDRIVER);
        conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
        request.setCharacterEncoding("utf-8");
        
        name=request.getParameter("name");
        address=request.getParameter("address");
        lat=request.getParameter("lat");
        lng=request.getParameter("lng");
        city=request.getParameter("city");
        province=request.getParameter("province");
        introduction=request.getParameter("introduction");
        String sql_update="update yangtzeriverscenery.scenery set name='"+name+"',address='"+address+"',lat='"+lat+"',lng='"+lng+"',city='"+city+"',province='"+province+"',introduction='"+introduction+"' where name='"+name+"'";
        pst=conn.prepareStatement(sql_update);
        rs=pst.executeUpdate();
        if(rs!=0){
            out.println("更新成功");
%>
<jsp:forward page="geography.jsp"></jsp:forward>
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
