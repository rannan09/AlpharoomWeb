<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="default_menu.css">
</head>
<body>

<% 
int id;
String password="",sql,sql1;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
id=Integer.parseInt(request.getParameter("id"));

try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	sql="select * from lostnfound_tbl where id="+id;
	rs=stmt.executeQuery(sql);
	}
	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}
	
	password=request.getParameter("password");
	while(rs.next())
	{
		if(!password.equals(rs.getString("password")))
		{
			%>
			<center><h2>비밀번호를 잘못 입력하셨습니다.</h2></center>
			
			<%
		}else{
			sql1="delete from lostnfound_tbl where id="+id;
			stmt.executeUpdate(sql1);%>
			
			<center><h2>게시글이 삭제되었습니다.</h2>
				<input type="button" class="mybutton" value="목록" onclick="location.href='lost&found.jsp'"/></center>
			<%break;
		}
	}
	
	
	%>
	
</body>
</html>