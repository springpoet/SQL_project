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

	<h1>티켓 main page</h1>

<form action="/MainPage" method="post">
	<select name="depart">
		<c:forEach var="item" items="${data}">
			<option value="${item}">
				<c:choose>
					<c:when test="${item eq 'GMP' }">
				김포
				</c:when>
					<c:when test="${item eq 'HND' }">
				일본(하네다)
				</c:when>
					<c:when test="${item eq 'PUS' }">
				부산
				</c:when>
					<c:when test="${item eq 'NRT' }">
				일본(나리타)
				</c:when>
					<c:when test="${item eq 'KIX' }">
				일본(간사이)
				</c:when>
					<c:when test="${item eq 'FUK' }">
				일본(후쿠오카)
				</c:when>
					<c:when test="${item eq 'CTS' }">
				일본(신치토세)
				</c:when>
					<c:when test="${item eq 'TAO' }">
				중국(칭다오)
				</c:when>
					<c:when test="${item eq 'HKG' }">
				홍콩
				</c:when>
					<c:when test="${item eq 'UBN' }">
				몽골(칭키즈 칸)
				</c:when>
					<c:when test="${item eq 'GUM' }">
				괌
				</c:when>
					<c:when test="${item eq 'SPN' }">
				사이판
				</c:when>
					<c:when test="${item eq 'BKK' }">
				태국(수완나품)
				</c:when>
					<c:when test="${item eq 'DAD' }">
				베트남(다낭)
				</c:when>
					<c:when test="${item eq 'CXR' }">
				베트남(깜라인)
				</c:when>
					<c:when test="${item eq 'CRK' }">
				필리핀(클락)
				</c:when>
					<c:when test="${item eq 'BKI' }">
				말레이시아(코타키나발루)
				</c:when>
					<c:when test="${item eq 'CEB' }">
				필리핀(막탄)
				</c:when>
					<c:when test="${item eq 'SIN' }">
				싱가포르
				</c:when>
					<c:when test="${item eq 'TPE' }">
				타이완
				</c:when>
					<c:when test="${item eq 'YNY' }">
				대한민국(양양)
				</c:when>
					<c:when test="${item eq 'SGN' }">
				베트남(떤선녓)
				</c:when>
					<c:when test="${item eq 'HAN' }">
				베트남(노이바이)
				</c:when>
					<c:when test="${item eq 'MWX' }">
				대한민국(무안)
				</c:when>
					<c:when test="${item eq 'CJU' }">
				제주
				</c:when>
					<c:when test="${item eq 'CNX' }">
				태국(치앙마이)
				</c:when>
					<c:when test="${item eq 'XIY' }">
				중국(시안)
				</c:when>
					<c:when test="${item eq 'MNL' }">
				필리핀(마날라)
				</c:when>
					<c:when test="${item eq 'YNJ' }">
				중국(옌지)
				</c:when>
					<c:when test="${item eq 'TAE' }">
				대구
				</c:when>
				</c:choose>
			</option>
		</c:forEach>
	</select>

	<select name="arrive">
		<c:forEach var="item" items="${data}">
			<option value="${item}">
				<c:choose>
					<c:when test="${item eq 'GMP' }">
				김포
				</c:when>
					<c:when test="${item eq 'HND' }">
				일본(하네다)
				</c:when>
					<c:when test="${item eq 'PUS' }">
				부산
				</c:when>
					<c:when test="${item eq 'NRT' }">
				일본(나리타)
				</c:when>
					<c:when test="${item eq 'KIX' }">
				일본(간사이)
				</c:when>
					<c:when test="${item eq 'FUK' }">
				일본(후쿠오카)
				</c:when>
					<c:when test="${item eq 'CTS' }">
				일본(신치토세)
				</c:when>
					<c:when test="${item eq 'TAO' }">
				중국(칭다오)
				</c:when>
					<c:when test="${item eq 'HKG' }">
				홍콩
				</c:when>
					<c:when test="${item eq 'UBN' }">
				몽골(칭키즈 칸)
				</c:when>
					<c:when test="${item eq 'GUM' }">
				괌
				</c:when>
					<c:when test="${item eq 'SPN' }">
				사이판
				</c:when>
					<c:when test="${item eq 'BKK' }">
				태국(수완나품)
				</c:when>
					<c:when test="${item eq 'DAD' }">
				베트남(다낭)
				</c:when>
					<c:when test="${item eq 'CXR' }">
				베트남(깜라인)
				</c:when>
					<c:when test="${item eq 'CRK' }">
				필리핀(클락)
				</c:when>
					<c:when test="${item eq 'BKI' }">
				말레이시아(코타키나발루)
				</c:when>
					<c:when test="${item eq 'CEB' }">
				필리핀(막탄)
				</c:when>
					<c:when test="${item eq 'SIN' }">
				싱가포르
				</c:when>
					<c:when test="${item eq 'TPE' }">
				타이완
				</c:when>
					<c:when test="${item eq 'YNY' }">
				대한민국(양양)
				</c:when>
					<c:when test="${item eq 'SGN' }">
				베트남(떤선녓)
				</c:when>
					<c:when test="${item eq 'HAN' }">
				베트남(노이바이)
				</c:when>
					<c:when test="${item eq 'MWX' }">
				대한민국(무안)
				</c:when>
					<c:when test="${item eq 'CJU' }">
				제주
				</c:when>
					<c:when test="${item eq 'CNX' }">
				태국(치앙마이)
				</c:when>
					<c:when test="${item eq 'XIY' }">
				중국(시안)
				</c:when>
					<c:when test="${item eq 'MNL' }">
				필리핀(마날라)
				</c:when>
					<c:when test="${item eq 'YNJ' }">
				중국(옌지)
				</c:when>
					<c:when test="${item eq 'TAE' }">
				대구
				</c:when>
				</c:choose>
			</option>
		</c:forEach>
	</select>
	<input type="submit" value="예매하기"/>
</form>


<form action="/Login" method="get">
	<input type="submit" value="로그인페이지로"/>
</form>

<form action="/SignUp" method="get">
	<input type="submit" value="회원가입"/>
</form>

</body>
</html>