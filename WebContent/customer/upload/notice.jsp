<%@page import="customer.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice.jsp</title>

<!-- 사용자 편의를 위해 검색창을 눌렀을 때 입력값이 지워지게 function처리 -->
<script>
	function clearVal(){ 
		var inputVal=document.getElementById("q");
		inputVal.value='';
	}
</script>
</head>
<body>
<h3>Notice.jsp</h3>


</br>
<c:if test="${empty sessionScope.uid}">
	<a href="../login/login.do">login </a>
</c:if>
| 
<c:if test="${not empty sessionScope.uid}">
	<a href="../login/logoutProc.do">logout </a>
</c:if>
<br/>
<c:if test="${not empty uid}">
	${uid }님 반갑습니다.
</c:if>
<br/>


<br/>


<hr/>

<!-- 서치라인 폼 -->
<form action="notice.do" method="get">
	<select name="f" >
	<!-- 제목,내용 선택 후 검색해도 option에 선택된 값 그대로 남게 삼항연산자를 이용해서 selected로 설정 -->
		<option ${param.f=="title"?"selected":"" } value="title">제목</option>
		<option ${param.f=="content"?"selected":"" } value="content">내용</option>
	</select>
	<input type="text" name="q" value="${query }" id="q" onclick="clearVal()"/>
	<!-- clearVal()하면 지워짐 위에  평션 참고 -->
	<input type="submit" value="검색"/>
</form>

<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	
<%-- <%
// 자바코드를 사용할 수도 있음
List<Notice> list=(List<Notice>)request.getAttribute("list");
for(Notice n:list){
	pageContext.setAttribute("n", n);

%> --%>

<!-- 서치라인 -->
<c:forEach items="${list }" var="n">
	<tr>
		<td>${n.seq }</td>
		<td><a href="noticeDetail.do?c=${n.seq }&h=${n.hit }">${n.title }</a></td>
		<td>${n.writer }</td>
		<td>${n.regdate }</td>
		<td>${n.hit }</td>
	</tr>
</c:forEach>
<%-- <%
}
%> --%>
</table>
<c:if test="${not empty sessionScope.uid}"> <!-- 로그인이 되었을 때만 나온다면 -->
	<a href="noticeReg.do">write</a>
</c:if>
</body>
</html>