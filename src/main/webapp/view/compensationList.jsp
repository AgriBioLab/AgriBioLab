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

<style>
/* ============= CONTENT ============= */
.content {
	flex: 1;
	padding: 50px 0 80px 55px;
}

.breadcrumb {
	font-size: 12px;
	color: #777;
	margin-bottom: 25px;
}

.breadcrumb span {
	margin: 0 8px;
}

.page-title {
	font-size: 32px;
	font-weight: 700;
	margin-bottom: 45px;
}

/* ============= SEARCH BOX ============= */
.search-box {
	background: #f3f6f9;
	border-radius: 8px;
	padding: 28px 30px;
	margin-bottom: 40px;
}

.search-row {
	display: flex;
	align-items: center;
	margin-bottom: 14px;
}

.search-row:last-child {
	margin-bottom: 0;
}

.search-label {
	width: 100px;
	flex-shrink: 0;
	font-weight: 600;
	font-size: 13px;
}

.search-input {
	height: 36px;
	border: 1px solid #bbb;
	border-radius: 3px;
	padding: 0 10px;
	background: white;
}

.search-input.date {
	width: 150px;
}

.search-input.normal {
	width: 220px;
}

.date-separator {
	margin: 0 10px;
}

.search-select {
	width: 160px;
	height: 36px;
	border: 1px solid #bbb;
	border-radius: 3px;
	padding: 0 8px;
	background: white;
}

.search-btn {
	height: 36px;
	margin-left: 10px;
	padding: 0 22px;
	border: 1px solid #333;
	border-radius: 3px;
	background: #333;
	color: white;
	font-size: 13px;
}

/* ============= TABLE ============= */
.result-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	font-size: 13px;
}

.result-count {
	font-weight: 600;
}

.compensation-table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	font-size: 13px;
}

.compensation-table thead {
	border-top: 2px solid #333;
	border-bottom: 1px solid #999;
}

.compensation-table th {
	height: 48px;
	font-weight: 600;
	background: #fafafa;
}

.compensation-table td {
	height: 48px;
	border-bottom: 1px solid #ddd;
}

.detail-btn {
	border: 1px solid #aaa;
	background: white;
	border-radius: 20px;
	padding: 4px 15px;
	font-size: 12px;
}

.detail-btn:hover {
	background: #f2f4f6;
}
</style>
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

				<span class="result-count">보상처리 목록</span> <span>총<strong>2</strong>건
				</span>

			</div>

			<!-- ============= TABLE ============= -->
			<table class="compensation-table">

				<thead>
					<tr>
						<th>접수번호</th>
						<th>신청일</th>
						<th>신청인 구분</th>
						<th>신청인명(상호)</th>
						<th>품목명</th>
						<th>처리상태</th>
						<th>상세보기</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>2026-004582</td>
						<td>2026-09-21</td>
						<td>생산자</td>
						<td>김현아(행복농장)</td>
						<td>사과</td>
						<td>보상완료</td>
						<td>
							<button class="detail-btn">보기</button>
						</td>
					</tr>

					<tr>
						<td>2026-004571</td>
						<td>2026-09-10</td>
						<td>생산자</td>
						<td>최길동</td>
						<td>배</td>
						<td>보상검토중</td>
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