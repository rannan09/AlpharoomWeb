<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="default_menu.css">
</head>
<body>
<br>
	<div id="top">
		<a href="alpha.html"> <img src="image/alpha.png" width="280"
			height="50" alt="컴퓨터공학과 알파실" title="컴퓨터공학과 알파실"></a>
	<iframe src="login_menu.jsp" style="width:250px; height:32.5px; border:0" scrolling = "no"></iframe>
			<img src="image/seat_no.png" width="260" height="50">
		<button type="button" class="button_other" onclick="location.href='join.jsp'">회원가입</button>
		<button type="button"  class="button_other" onclick="location.href='alpha.html'">HOME</button>
		<button type="button"  class="button_other" onclick="location.href='http://www.dongguk.edu/'">DGU</button>
	</div>



	<div class="menubar">
		<center>
			<ul>
				<li><a href="notice.jsp">공지사항</a></li>
				<li><a href="Q&A.jsp">커뮤니티</a>
					<ul>
						<li><a href="seat.jsp">좌석예약</a></li>
						<li><a href="caution.jsp">경고자목록</a></li>
						<li><a href="lost&found.jsp">분실물 센터</a></li>
						<li><a href="Q&A.jsp">Q&A</a></li>
					</ul></li>
				<li><a href="info.html">안내</a></li>
			</ul>
			</center></div>
<% 
int id;
String name,title,content,password;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String my_pw="";
if(request.getParameter("id")==null){
	id=0;
}else{
id=Integer.parseInt(request.getParameter("id"));
}

try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	String sql= "select * from qna_tbl where id="+id;
	rs= stmt.executeQuery(sql);
	}
	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}
	password=request.getParameter("password");
	
	while(rs.next()) {
		my_pw=rs.getString("password");
	if(my_pw.equals(password)){%><br>
		<div style="height:488px">
	<img src="image/seat_no.png" width="260" height="10">
	<font size="5">Q&A </font>
<font size="1">-궁금한 점이 있으면 글을 남겨주세요.</font><br>
	
	<table align="center" width="1000px"> 
    <tr align="center" bgcolor="#cccccc">
        <td>게시글 수정</td>
     </tr>
   </table>
	<form action="Q&A_modify_db.jsp" method="post">
	<table align="center" width="1000px"> 
    <tr>
     <td>&nbsp;</td>
     <td>제목&nbsp;</td>
     <td><input name="title" style="width:930px" maxlength="100"></td>
     <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#cccccc"><td colspan="4"></td></tr>
    <tr>
     <td>&nbsp;</td>
     <td>이름&nbsp;</td>
     <td><%=session.getAttribute("sessionName")%></td>
     <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#cccccc"><td colspan="4"></td></tr>
    <tr>
     <td>&nbsp;</td>
     <td>내용&nbsp;</td>
     <td><textarea name="content" cols="143" rows="13"></textarea></td>
     <td>&nbsp;</td>
    </tr>
        <tr>
     <td>&nbsp;</td>
     <td>비밀번호&nbsp;</td>
     <td><input type="password" name="password" size="10%" maxlength="50"></td>
     <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr height="3" bgcolor="#ffffff" ><td colspan="4"></td></tr>
 <tr align="center">
     <td>&nbsp;</td>
     <td colspan="2"><input type="image" src="image/write.png"  width="50" height="25" border="0">
      <a href="Q&A.jsp"><img src="image/cancel.png"  width="50" height="25" border="0"></a></td>
     <td>&nbsp;</td>
    </tr>
	
	</table><p>
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
	</form>
	
	<%}else{%><div style="height:488px">
	<center><br><br><br><h2>비밀번호가 잘못되었습니다.</h2></center></div>
	<%}} %>
</div>
<div id="underbar">
	<img id="logo_white" src="image/logo_white.png"><font color="white" size="2.5"><br><br>&nbsp;&nbsp;&nbsp;서울특별시 중구 필동로 1길 30(우 04620))<br>&nbsp;&nbsp;&nbsp;Copyright ⓒ 2018 BY DONGGUK UNIVERSITY ALL RIGHTS RESERVED.</font></div>

</body>
</html>