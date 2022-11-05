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
	

	<h1>내 예약 정보<button onclick="location.href='myticketCheck?id=${sessionId }'">확인하기</button></h1>
	
	<c:forEach var="item" items="${data}">
	<p>${item }</p>
<p>아이디 : ${sessionId }, 이름 : ${sessionName }, 도착공항 : ${item['도착공항']}, 출발공항 : ${item['출발공항']} ${item.ticketnum}</p><hr>


	</c:forEach>

	
	
	

</body>
</html>