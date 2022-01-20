<%@page import="customer.vo.Notice"%>
<%@page import="customer.dao.NoticeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeEdit.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css"/>
</head>
<body>
<!-- 링크를 타고 들어가면 나오는 detail 페이지 만들기 -->
<h5>noticeEdit.jsp</h5>
<%
/* String seq=request.getParameter("c");
NoticeDao dao=new NoticeDao();
Notice n=dao.getNotice(seq); */
%>

<form action="noticeEditProc.do" method="post">
<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Modify</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			 <td>${nt.seq }</td> <!-- rs.getString() - 가로 안에는 칼럼이름을 씀 -->
			 <th class="left">조회수</th>
			 <td>${nt.hit }</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			 <td>${nt.writer }</td>
			 <th class="left">작성시간</th>
			 <td>${nt.regdate }</td>
		</tr>
		<tr>
			<th class="left">제목</th>
			 <td colspan="3">
			 	<input type="text" class="inp" name="title" value="${nt.title }"/>
			 </td>
		</tr>
		<tr>
			<th class="left">내용</th>
			 <td colspan="3" id="content">
			 	<textarea name="content" class="txt">${nt.content }</textarea>
			 </td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			 <td colspan="3" id="addfile">첨부</td>
		</tr>
	</tbody>
</table>
<input type="hidden" name="c" value="${nt.seq }"/> <!-- 타입을 hidden으로 처리하면 seq이 나타나지 않음 (보이진 않지만 데이터는 존재하는 것) -->
<input type="submit" value="저장"/>

<a href="noticeDetail.do?c=${nt.seq }">취소</a>
</form>

</body>
</html>
