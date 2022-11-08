<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>티켓 main page</h1>
	<c:if  test="${duple }">
	<h1>날짜를 입력하세요.</h1> <button onclick="location.href='MainPage'">home</button>
	</c:if>
	<c:choose>
	<c:when test="${sessionName eq null }">
		<h1>로그인해주세요 ㅎ_ㅎ</h1>
	</c:when>
	<c:otherwise>
		<h1>${sessionName }님 아릉하세요?</h1>
	</c:otherwise>
</c:choose>
	

<form action="/MainPage" method="post">
	<div>
	<input name="publeYear" autocomplete="off" readonly="readonly">
	</div>
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


<c:choose>
	<c:when test="${sessionName eq null }">
	<form action="/Login" method="get">
		<input type="submit" value="로그인페이지로"/>
	</form>
	</c:when>
	<c:otherwise>
	<form action="/Mypage" method="get">
		<input type="submit" value="마이페이지"/>
	</form>
	</c:otherwise>
</c:choose>


	<c:if test="${sessionName ne null }">
	<form action="/Logout" method="get">
		<input type="submit" value="로그아웃"/>
	</form>
	</c:if>
	

<form action="/SignUp" method="get">
	<input type="submit" value="회원가입"/>
</form>
<script>
/* 설정 */
  const config = {
			dateFormat: 'yy-mm-dd',
			showOn : "button",
			buttonText:"날짜 선택"
		}
 


/* 캘린더 */
$(function() {
  $( "input[name='publeYear']" ).datepicker(config);
});

</script>
</body>
</html>