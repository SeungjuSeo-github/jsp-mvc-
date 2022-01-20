<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Loginform.jsp</title>
<script>
	function checkValue(){
		inputForm=eval("document.loginInfo"); // inputForm은 form 안에 있는 내용 전체를 받게 됨
		// alert(inputForm.id.value); // form 안에 입력된 id 값을 alert로 뿌려라
		// form에 있는 값 가져오기
		if (!inputForm.id.value) { // id를 쓰지 않았다면
			alert("아이디입력");
			inputForm.id.focus(); // id를 입력하라고 커서를 id쪽으로 줌(사용자 편리성)
			return false; // onsubmit으로 false가 들어가고 action처리가 안 됨, true가 들어가야 action처리가 됨
		}
		if (!inputForm.password.value) { // id를 쓰지 않았다면
			alert("비번입력");
			inputForm.password.focus(); // id로 커서를 주고
			return false; // onsubmit으로 false가 들어가고 action처리가 안 됨, true가 들어가야 action처리가 됨
		}
	}
	
	function goJoinForm(){
		location.href="../joinus/join.jsp";
	}
</script>

</head>
<body>
<div id="wrap"> <!-- onsubmit 버튼을 눌렀을 때 loginProc.jsp로 가기 전에 메소드로 가라 (아이디,비번을 안 적으면 submit되지 않게 하기 위함) -->
	<form action="loginProc.do" name="loginInfo" method="post" onsubmit="return checkValue()"> 
		<img src="../img/welcome.jpg" alt="wel_img" />
		<br /><br />
		<table>
			<tr>
				<td bgcolor="skyblue">아이디</td>
				<td><input type="text" name="id" maxlength="50"/></td>
			</tr>
			<tr>
				<td bgcolor="skyblue">비밀번호</td>
				<td><input type="text" name="password" maxlength="50"/></td>
			</tr>
		</table>
		<input type="submit" value="login"/>
		<input type="button" value="join" onclick="goJoinForm()"/>
	</form>
<%
	String msg=request.getParameter("msg");
	if(msg!=null && msg.equals("0")){
		out.println("<br>");
		out.println("<font color='red' size='5'>비밀번호 확인</font>");
			
	} else if(msg!=null && msg.equals("-1")){
		out.println("<br>");
		out.println("<font color='red' size='5'>아이디 확인</font>");
			
	}
%>
	
</div>

</body>
</html>