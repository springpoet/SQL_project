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


	<h1>내 예약 정보</h1>
	<h2>티켓 넘버 : ${data.ticketnum}
		,&nbsp;이름 : ${data.name}
		,&nbsp;운항편명 : ${data['운항편명']}
		,&nbsp;출발공항 : ${data['출발공항']}
		,&nbsp;출발날짜 : ${data['출발날짜']}
		,&nbsp;출발시간 : ${data['출발시간']}
		,&nbsp;도착공항 : ${data['도착공항']}
		,&nbsp;도착시간 : ${data['도착시간']}
		,&nbsp;항공사: ${data['항공사']}	
	</h2>

</body>
</html>