<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logoutproc.jsp</title>
</head>
<body>
<h3>logoutProc.jsp</h3>
<%
// 세션 제거
session.invalidate(); // 모든 세션 삭제
response.sendRedirect("loginForm.jsp");
%>
</body>
</html>