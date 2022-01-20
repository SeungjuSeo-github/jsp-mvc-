<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Loginproc.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("password");

// DB연결
Class.forName("oracle.jdbc.driver.OracleDriver");

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Connection con=DriverManager.getConnection(url, user, pw);

// 실행
String sql="SELECT pwd FROM member WHERE id=?"; // ?는 앞 창에서 입력받은 id, pwd는 이 조건에 맞는 DB의 pwd
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id); // form에서 입력받은 id

ResultSet rs=pstmt.executeQuery(); // resultset이니까 resultset으로 받아야 됨

String ypass="";
int x=-1;
String msg="";
if(rs.next()){
	ypass=rs.getString("pwd"); // DB에 있는 pwd
	if(ypass.equals(pass))
		x=1; // 로그인 성공
	else
		x=0; // pass불일치
			
} else{ // rs.next()가 없는 경우
	x=-1; // id없음
}
	System.out.println("xxxxxxxx : "+x);
	
	// 위 상황에 따라 화면전환 장소를 다르게 설정
	if(x==1){
		session.setAttribute("sessionID", id);
		msg="../mainForm.jsp";
	} else if(x==0){
		msg="loginForm.jsp?msg=0";
	} else{
		msg="loginForm.jsp?msg=-1";
	}
	response.sendRedirect(msg);
%>

</body>
</html>