<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>농산물 품질 - 보상처리</title>

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

<!-- table CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">


</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU ============= -->
		<aside class="side-menu">

			<div class="side-title">보상처리</div>

			<div class="side-section">

				<div class="side-section-title">보상처리</div>

				<ul class="side-menu-list">
					<li class="active"><a href="#">보상처리</a></li>
					<li><a href="#">보상처리 내역</a></li>
				</ul>

			</div>

		</aside>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<div class="breadcrumb">
				<span>홈</span> &gt; <span>보상처리</span> &gt; <span>보상처리</span>
			</div>


			<!-- Page Title -->
			<h1 class="page-title">보상처리</h1>

			<!-- ============= SEARCH ============= -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/compensationList.jsp">

				<!-- 기간 -->
				<div class="search-row">

					<label class="search-label">기간</label> <input type="date" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" class="search-input date" value="2026-09-23">

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

				<!-- 접수번호 -->
				<div class="search-row">

					<label class="search-label">접수번호</label> <input type="text" class="search-input normal" placeholder="2026-004582">

				</div>

				<!-- 사건유형 -->
				<div class="search-row">

					<label class="search-label">사건유형</label> <input type="text" class="search-input normal" placeholder="병해충">

				</div>

				<!-- 대표자명 -->
				<div class="search-row">

					<label class="search-label">대표자명</label> <input type="text" class="search-input normal" placeholder="김현아">

				</div>

				<!-- 단체/상호명 -->
				<div class="search-row">

					<label class="search-label">단체/상호명</label> <input type="text" class="search-input normal" placeholder="행복농장">

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

					<label class="search-label">품목명</label> <input type="text" class="search-input normal" placeholder="사과">

				</div>

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<span class="result-count">보상처리 목록</span> <span>총<strong>2</strong>건
				</span>

			</div>

			<!-- ============= TABLE ============= -->
			<table class="list-table">

				<thead>
					<tr>
						<th>접수번호</th>
						<th>신청일</th>
						<th>구분</th>
						<th>대표자명</th>
						<th>단체/상호명</th>
						<th>사건유형</th>
						<th>품목명</th>
						<th>처리상태</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>2026-004571</td>
						<td>2026-09-10</td>
						<td>생산자</td>
						<td>최길동</td>						
						<td>가나배영농조합법인</td>
						<td>가뭄</td>
						<td>배</td>
						<td>보상검토중</td>
					</tr>
					<tr>
						<td>2026-004582</td>
						<td>2026-09-21</td>
						<td>생산자</td>
						<td>김현아</td>
						<td>행복농장</td>
						<td>병해충</td>
						<td>사과</td>
						<td>보상완료</td>
					</tr>

				</tbody>
			</table>

		</main>

	</div>

</body>
</html>