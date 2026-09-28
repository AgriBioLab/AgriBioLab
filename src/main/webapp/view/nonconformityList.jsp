<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>농산물 품질 - 부적합 조치</title>

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

			<div class="side-title">부적합 조치</div>

			<div class="side-section">

				<div class="side-section-title">부적합 조치</div>

				<ul class="side-menu-list">
					<li class="active"><a href="#">부적합 조치</a></li>
					 <li><a href="#">부적합 조치 내역</a></li>
				</ul>

			</div>

		</aside>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<div class="breadcrumb">
				<span>홈</span> &gt; <span>부적합 조치</span> &gt; <span>부적합 조치</span>
			</div>


			<!-- Page Title -->
			<h1 class="page-title">부적합 조치</h1>

			<!-- ============= SEARCH ============= -->
			<section class="search-box">


				<!-- 기간 -->
				<div class="search-row">

					<label class="search-label">기간</label> <input type="date" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" class="search-input date" value="2026-09-23">

				</div>

				<!-- 조치상태 -->
				<div class="search-row">

					<label class="search-label">조치상태</label> 
					<select class="search-select">
						<option>전체</option>
						<option>조치대기</option>
						<option>조치진행</option>
						<option>조치보류</option>
						<option>조치완료</option>						
					</select>

				</div>
				
				<!-- 부적합조치번호 -->
				<div class="search-row">

					<label class="search-label">부적합조치번호</label> <input type="text" class="search-input normal" placeholder="부적합조치번호를 입력하세요">

				</div>

				<!-- 구분 -->
				<div class="search-row">

					<label class="search-label">구분</label> 
					<select class="search-select">
						<option>전체</option>
						<option>생산자</option>
						<option>유통자</option>
						<option>판매자</option>
					</select>

				</div>
				
				<!-- 대상자(상호)명 -->
				<div class="search-row">

					<label class="search-label">대상자(상호)</label> <input type="text" class="search-input normal" placeholder="대상자(상호)명을 입력하세요">

				</div>

				<!-- 부적합유형 + 조회 -->
				<div class="search-row">

					<label class="search-label">부적합유형</label> <input type="text" class="search-input normal" placeholder="부적합유형을 입력하세요">

					<button class="search-btn">조회</button>

				</div>

			</section>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<span class="result-count">부적합 조치 목록</span> <span>총<strong>2</strong>건
				</span>

			</div>

			<!-- ============= TABLE ============= -->
			<table class="list-table">

				<thead>
					<tr>
						<th>부적합조치번호</th>
						<th>시작일</th>
						<th>구분</th>
						<th>대상자(상호)</th>
						<th>부적합유형</th>
						<th>조치상태</th>
						<th>상세보기</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>NCR-2026-00135</td>
						<td>2026-09-01</td>
						<td>생산자</td>
						<td>김현아(행복농장)</td>
						<td>병해충</td>
						<td>조치완료</td>
						<td>
							<button class="detail-btn">보기</button>
						</td>
					</tr>

					<tr>
						<td>NCR-2026-00136</td>
						<td>2026-09-01</td>
						<td>생산자</td>
						<td>최영수(슬픔농장)</td>
						<td>가뭄</td>
						<td>조치보류</td>
						<td>
							<button class="detail-btn">보기</button>
						</td>
					</tr>
				</tbody>
			</table>

		</main>

	</div>

</body>
</html>