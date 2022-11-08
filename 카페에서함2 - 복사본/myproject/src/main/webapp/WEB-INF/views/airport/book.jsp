<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<style>
	body{
	height:100%;
	color:blue;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
  
  
	<h3>선택한날짜는 ${publeYear }</h3>

	<c:forEach var="item" items="${data }">
		<div class="card mb-3" style="max-width: 1200px;">
		<!-- <a href="bookCheck?ticketnum=${item.get('ticketnum')}&id=${sessionId }&publeYear=${publeYear}"> -->
	  <div class="row g-0" style="border:1px solid black; border-bottom:none;" >
	    <div class="col-md-4">
	     <img src="/resources/img/japan.jpg" class="img-fluid rounded-start" alt="예?">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title"></h5>
	
	        
	        <p class="card-text"><h3>티켓번호 : ${item.get('ticketnum')}, 출발날짜 : ${item.get('출발날짜')}, 출발시간 : ${item.get('출발시간')}, 출발공항 : ${item.get('출발공항')}, 
	        도착시간 : ${item.get('도착시간')}, 도착공항 : ${item.get('도착공항')},  ${item.get('운항편명')},  ${item.get('항공사')}
	        
		</h3> </p>
	      </div>
	    </div>
	  </div><!-- </a> -->
	   <button onclick="location.href='bookCheck?ticketnum=${item.get('ticketnum')}&id=${sessionId }&publeYear=${publeYear}'">예매하기</button>
	  
	</div>
		
	</c:forEach>
	
	

	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>