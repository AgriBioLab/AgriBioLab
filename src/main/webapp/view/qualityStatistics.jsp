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
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/qualityStatistics.jsp">

				<!-- 기간 -->
				<div class="search-row">

					<label class="search-label">기간</label> <input type="date" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" name="endDate" class="search-input date" value="2026-09-23">

				</div>

				<!-- 처리상태 -->
				<div class="search-row">

					<label class="search-label">처리상태</label>
					<select name="status" class="search-select">
						<option value="">전체</option>
						<option value="REVIEW">보상검토중</option>
						<option value="DONE">보상완료</option>
					</select>

				</div>

				<!-- 구분 -->
				<div class="search-row">

					<span class="search-label">구분</span>
					<div class="radio-group">
						<label><input type="radio" name="targetType" value="" checked> 전체</label>
						<label><input type="radio" name="targetType" value="PRODUCER"> 생산자</label>
						<label><input type="radio" name="targetType" value="DISTRIBUTOR"> 유통자</label>
						<label><input type="radio" name="targetType" value="SELLER"> 판매자</label>
					</div>

				</div>

				<!-- 품목명 -->
				<div class="search-row">

					<label class="search-label">품목명</label> <input type="text" name="itemName" class="search-input normal" placeholder="품목명을 입력하세요">

				</div>

				<!-- 신청인명 -->
				<div class="search-row">

					<label class="search-label">신청인명(상호)</label> <input type="text" name="applicantName" class="search-input normal" placeholder="신청인명을 입력하세요">

				</div>

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

			</div>

		</main>
	</div>
</body>
</html>