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
	<h1>선택한날짜는 ${publeYear }</h1>

	<c:forEach var="item" items="${data }">
		
		<h1>${item.get('ticketnum')}, ${item.get('도착공항')}, ${item.get('도착시간')}, ${item.get('시작일자')}, ${item.get('운항요일')}, ${item.get('운항편명')}, ${item.get('종료일자')}, ${item.get('출발공항')}, ${item.get('출발시간')}, ${item.get('항공사')}
		</h1>
		 <button onclick="location.href='bookCheck?ticketnum=${item.get('ticketnum')}&id=${sessionId }&publeYear=${publeYear}'">예매하기</button>

	</c:forEach>
		
	
	

</body>
</html>