<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>농산물 품질 - 품질통계</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 헤더 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<!-- 사이드 메뉴 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidemenu.css">

<!-- Search Box CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBox.css">

</head>
<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU ============= -->
		<aside class="side-menu">

			<div class="side-title">품질통계</div>

			<div class="side-section">

				<div class="side-section-title">보상금</div>

				<ul class="side-menu-list">
					<li class="active"><a href="#">재해종류별</a></li>
					<li><a href="#">지역별</a></li>
					<li><a href="#">기간별</a></li>
					<li><a href="#">품목별</a></li>
				</ul>

				<div class="side-section-title">신청/지급건수</div>

				<ul class="side-menu-list">
					<li class="active"><a href="#">재해종류별</a></li>
					<li><a href="#">지역별</a></li>
					<li><a href="#">기간별</a></li>
					<li><a href="#">품목별</a></li>
				</ul>
			</div>

		</aside>
		
		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<div class="breadcrumb">
				<span>홈</span> &gt; <span>품질통계</span> &gt; <span>재해종류별 통계</span>
			</div>


			<!-- Page Title -->
			<h1 class="page-title">재해종류별 통계</h1>

			<!-- ============= SEARCH ============= -->
			<section class="search-box">


				<!-- 기간 -->
				<div class="search-row">

					<label class="search-label">기간</label> <input type="date" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" class="search-input date" value="2026-09-23">

				</div>

				<!-- 신청인 구분 -->
				<div class="search-row">

					<label class="search-label">신청인 구분</label> 
					<select class="search-select">
						<option>전체</option>
						<option>생산자</option>
						<option>유통자</option>
						<option>판매자</option>
						<option>소비자</option>
					</select>

				</div>

				<!-- 처리상태 -->
				<div class="search-row">

					<label class="search-label">처리상태</label> 
					<select class="search-select">
						<option>전체</option>
						<option>보상검토중</option>
						<option>보상완료</option>
					</select>

				</div>

				<!-- 신청인명 -->
				<div class="search-row">

					<label class="search-label">신청인명(상호)</label> <input type="text" class="search-input normal" placeholder="신청인명을 입력하세요">

				</div>

				<!-- 품목명 + 조회 -->
				<div class="search-row">

					<label class="search-label">품목명</label> <input type="text" class="search-input normal" placeholder="품목명을 입력하세요">

					<button class="search-btn">조회</button>

				</div>

			</section>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

			</div>

		</main>
	</div>
</body>
</html>