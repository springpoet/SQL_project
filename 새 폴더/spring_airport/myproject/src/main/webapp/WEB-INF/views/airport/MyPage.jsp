<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보</h1>
	<h2>이름 : ${sessionName }</h2>
	<h2>나이 : ${sessionAge }</h2>
	<h2>아이디 : ${sessionId }</h2>
	<h2>성별 : ${sessionGender }</h2>
	
	<h1>예약확인버튼</h1>
	<!-- 버튼 누르면 예약내역 테이블에 회원정보가 있는지 select -->
<c:choose>
	<c:when test="${sessionTicket eq null }">
		<h2>예약한 티켓이 없습니다</h2>
	</c:when>
	<c:otherwise>
		<h2>예약한 티켓 불러오기...</h2>
	</c:otherwise>
</c:choose>
</body>
</html>