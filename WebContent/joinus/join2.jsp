<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p style="color: red;">
<%
// list에 담는 것 중요!!!!
if(request.getAttribute("errors")!=null){
List<String> errors=(List)request.getAttribute("errors");
for(int i=0;i<errors.size();i++){
%>	

	<%=errors.get(i) %> <br />

<%
	}
}
%>
</p>
<h3>join.jsp</h3>
<form action="joinProc2.jsp">
	<label for="id">아이디</label>
	<input type="text" name="id"/>
	<input type="button" value="중복확인"/>
	<br />
	<label for="id">비밀번호</label>
	<input type="text" name="pwd"/> <br />
	<label for="id">비번확인</label>
	<input type="text" name="pwd2"/> <br />
	<label for="id">이름</label>
	<input type="text" name="name"/> <br />
	<label for="id">성별</label>
	<select name="gender">
		<option value="남성">남성</option> <!-- option은 1개만 선택가능한데 checkbox는 중복 선택가능하니까 따로 조건식 필요(아예 선택하지 않거나 중복 선택할 경우 대비해야 됨 joinProc에 있음) -->
		<option value="여성">여성</option>
	
	</select> <br />
	<label for="">생년월일</label>
	<input type="text" name="year" size="5"/>년
	<input type="text" name="month" size="5"/>월
	<input type="text" name="day" size="5"/>일
	
	<input type="radio" name="IsLunar" value="Solar" checked/>양력
	<input type="radio" name="IsLunar" value="IsLunar" />음력 <br />
	
	<label for="">핸드폰번호</label>
	<input type="tel" name="cphone"/> 예)010-1111-5555 <br />
	<label for="">이메일</label>
	<input type="email" name="email"/> <br />
	<label for="">취미</label>
	<input type="checkbox" name="habit" value="music"/>음악
	<input type="checkbox" name="habit" value="movie"/>영화
	<input type="checkbox" name="habit" value="trip"/>여행
	<input type="submit" value="확인"/>
	
</form>
</body>
</html>