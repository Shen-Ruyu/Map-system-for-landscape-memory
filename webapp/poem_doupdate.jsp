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
    String title=null;
    String charac_name=null;
    String dynasty=null;
    String content=null;
    String poetry_type=null;

%>
<%
    try{

        Class.forName(DBDRIVER);
        conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
        request.setCharacterEncoding("utf-8");
        
        title=request.getParameter("title");
        charac_name=request.getParameter("charac_type");
        dynasty=request.getParameter("dynasty");
        content=request.getParameter("content");
        poetry_type=request.getParameter("poetry_type");
      
        String sql_update="update yangtzeriverscenery.poetry set title='"+title+"',charac_name='"+charac_name+"',dynasty='"+dynasty+"',content='"+content+"',poetry_type='"+poetry_type+"' where title='"+title+"'";
        pst=conn.prepareStatement(sql_update);
        rs=pst.executeUpdate();
        if(rs!=0){
            out.println("更新成功");
%>
<jsp:forward page="poem.jsp"></jsp:forward>
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
