<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 퍼스펙티브라고 부른다     -->
<!-- tag라이브러리 - taglib, c = core 의 약자 변수인데 core인걸 나타내기 위해 보통 c쓴다. -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- prefix의 c는 임의적으로 지정가능, core의 c로 관습적으로 사용함 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jstl1_token.jsp</h2>

<%-- 
<c:forTokens items="이름1,이름1,이름1,이름1,이름1" delims=","> <!-- items 안에 들어있는 토큰들의 갯수만큼 반복됨 구분자는 ,로 표현 -->
반복 <br />
</c:forTokens> <!-- 위에 taglib를 써줘서 사용가능 해진 것  --> --%>


<%-- 
<c:forTokens var="name" items="이름1,이름2,이름3,이름4,이름5" delims=","> 
${name } <br />
</c:forTokens> --%>


<%-- 
<c:forTokens var="name" items="이름1,이름2,이름3,이름4,이름5" delims="," varStatus="st"> 
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens>  --%>


<%-- 
<c:forTokens var="name" items="이름1,이름2,이름3,이름4,이름5" delims="," 
begin="1" end="3" step="2" varStatus="st"> 
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens> --%>


<%-- << delims 복수개 지정 >>
<c:forTokens var="name" items="이름1/20,이름2/21,이름3/22,이름4/23,이름5/24" delims=",/" delims /까지 하나의 토근으로 봐줌(토큰10개 됨)
varStatus="st"> 
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens> --%>

<c:forTokens var="name" items="이름1/20,이름2/21,이름3/22,이름4/23,이름5/24" delims=",/" 
step="2" varStatus="st"> <!-- step을 2로 주니까 이름만 출력됨 -->
index:${st.index } <br />
current:${st.current } <br />
count:${st.count } <br />
first:${st.first } <br />
last:${st.last } <br />
begin:${st.begin } <br />
end:${st.end } <br />
step:${st.step } <br />
<hr />
</c:forTokens>

</body>
</html>