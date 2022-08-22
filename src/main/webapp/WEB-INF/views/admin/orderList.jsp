<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style type="text/css">
/* 비디오 배경 */
#videobcg {
	position: absolute;
	top: 0px;
	left: 0px;
	min-width: 1920px;
	min-height: 1080px;
	width: 100%;
	height: 100%;
	z-index: -1000;
	overflow: hidden;
}
</style>


<link rel="stylesheet" href="../../../resources/css/orderList.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/make.css">
</head>

<body>
	<!--    헤더 -->
	<div class="header">
		<h1 class="Logo">
			<a href="/"> SPACE SHIP</a>
		</h1>
		<a href="/moveMakeWeb2" class="a1">역사</a> <a href="/moveMakeWeb3"
			class="a1">사업분야</a> <a href="/moveMakeWeb4" class="a1">ufo</a> <a
			href="/moveMakeWeb5" class="a1">우주인채용</a>

		<c:if test="${isAdmin == 1}">
			<a class="frame-btn" href="/adminMenu" id="logoutBtn"> <span
				class="frame-btn__outline frame-btn__outline--tall"> <span
					class="frame-btn__line frame-btn__line--tall"></span> <span
					class="frame-btn__line frame-btn__line--flat"></span>
			</span> <span class="frame-btn__outline frame-btn__outline--flat"> <span
					class="frame-btn__line frame-btn__line--tall"></span> <span
					class="frame-btn__line frame-btn__line--flat"></span>
			</span> <span class="frame-btn__solid"></span> <span class="frame-btn__text">admin</span>
			</a>

		</c:if>

		<c:if test="${not empty member.user_id}">
			<a class="frame-btn" href="/logout" id="logoutBtn"> <span
				class="frame-btn__outline frame-btn__outline--tall"></span> <span
				class="frame-btn__line frame-btn__line--tall"></span> <span
				class="frame-btn__line frame-btn__line--flat"></span> <span
				class="frame-btn__outline frame-btn__outline--flat"></span> <span
				class="frame-btn__line frame-btn__line--tall"></span> <span
				class="frame-btn__line frame-btn__line--flat"></span> <span
				class="frame-btn__solid"></span> <span class="frame-btn__text">로그아웃</span>
			</a>




			<a class="frame-btn" href="/orderList"> <span
				class="frame-btn__outline frame-btn__outline--tall"></span> <span
				class="frame-btn__line frame-btn__line--tall"></span> <span
				class="frame-btn__line frame-btn__line--flat"></span> <span
				class="frame-btn__outline frame-btn__outline--flat"></span> <span
				class="frame-btn__line frame-btn__line--tall"></span> <span
				class="frame-btn__line frame-btn__line--flat"></span> <span
				class="frame-btn__solid"></span> <span class="frame-btn__text">주문현황</span>
			</a>
		</c:if>

		<c:if test="${empty member.user_id}">
			<a class="frame-btn" href="moveLogin"> <span
				class="frame-btn__outline frame-btn__outline--tall"></span> <span
				class="frame-btn__line frame-btn__line--tall"></span> <span
				class="frame-btn__line frame-btn__line--flat"></span> <span
				class="frame-btn__outline frame-btn__outline--flat"></span> <span
				class="frame-btn__line frame-btn__line--tall"></span> <span
				class="frame-btn__line frame-btn__line--flat"></span> <span
				class="frame-btn__solid"></span> <span class="frame-btn__text">LOGIN</span>
			</a>
		</c:if>
	</div>



	<!-- <a href="/adminMenu/goodsManage/goodsDetail">상품조회</a> -->


	<video id="videobcg" preload="auto" autoplay="autoplay" loop="loop"
		muted="muted">

		<source src="/resources/css/adobeVideo/blackHoleSmall.mp4"
			type="video/mp4">

	</video>

	<!-- 상품 리스트 O -->
	<div class="admin_content_wrap">
		<div class="neon_effect">
			<div class="admin_content_subject">
				<span>주문 현황</span>
			</div>
		</div>
		<div class="author_table_wrap">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty' }">
				<table class="order_table">
					<colgroup>
						<col width="21%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="19%%">
					</colgroup>
					<thead>
						<tr class="headerText">
							<td >주문 번호</td>
							<td >주문 아이디</td>
							<td >주문 날짜</td>
							<td>주문 상태</td>
							<td >취소</td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tr class="midText">
							<td class="th_column_1"><c:out value="${list.orderId}"></c:out></td>
							<td class="th_column_2"><c:out value="${list.memberId}"></c:out></td>
							<td class="th_column_3"><fmt:formatDate value="${list.orderDate}"
									pattern="yyyy-MM-dd" /></td>
							<td class="th_column_4"><c:out value="${list.orderState}" /></td>
							<td class="th_column_5"></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>

			<!-- 게시물 x -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 작가가 없습니다.</div>
			</c:if>

		</div>

		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/orderList" method="get">
				<div class="search_input">
					<input type="text" class="searchInput" name="keyword"
						placeholder="주문아이디를 입력해주세요"
						value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
					<button class='btn search_btn'>검 색</button>
				</div>
			</form>
		</div>





	</div>

	<!-- 페이지 이동 인터페이스 영역 -->
	<div class="pageMaker_wrap">

		<ul class="pageMaker">

			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageMaker_btn prev"><a
					href="${pageMaker.pageStart - 1}">이전</a></li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}"
				var="num">
				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageMaker_btn next"><a
					href="${pageMaker.pageEnd + 1 }">다음</a></li>
			</c:if>

		</ul>

	</div>

	<form id="moveForm" action="/orderList" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>

	<script>
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		$("#searchForm button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			console.log($(this).attr("href"));

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
	</script>
</body>
</html>