<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>농산물 품질 - 농산물 사건</title>

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

<!-- table CSS  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU ============= -->
		<aside class="side-menu">

			<div class="side-title">농산물 사건</div>

			<div class="side-section">
			
				</ul>

			</div>

		</aside>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<div class="breadcrumb">
				<span>홈</span> &gt; <span>농산물 사건</span> <!--&gt; = > 이 표시 -->
			</div>


			<!-- Page Title -->
			<h1 class="page-title">농산물 사건</h1>

			<!-- ============= SEARCH ============= -->
			<section class="search-box">


				<!-- 기간 -->
				<div class="search-row">

					<label class="search-label">기간</label> <input type="date" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" class="search-input date" value="2026-10-01">

				</div>

				<!-- 사건상태 구분 -->
				<div class="search-row">

					<label class="search-label">사건상태</label> 
					<select class="search-select">
						<option>전체</option>
						<option>접수</option>
						<option>조사중</option>
						<option>처리중</option>
						<option>조사완료</option>
					</select>		
				</div>	
				
				<!-- 사건번호 -->
				<div class="search-row">

					<label class="search-label">사건번호</label> <input type="text" class="search-input normal" placeholder="사건번호를 입력하세요">

				</div>
				
				<!-- 대상자(상호) -->
				<div class="search-row">

					<label class="search-label">대상자(상호)</label> <input type="text" class="search-input normal" placeholder="상호명을 입력하세요">

				</div>

				<!-- 사건유형 + 조회 -->
				<div class="search-row">

					<label class="search-label">사건유형</label> <input type="text" class="search-input normal" placeholder="사건유형을 입력하세요">

					<button class="search-btn">조회</button>

				</div>

			</section>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<span class="result-count">농산물 사건 목록</span> <span>총<strong>2</strong>건
				</span>

			</div>

			<!-- ============= TABLE ============= -->
			<table class="compensation-table">

				<thead>
					<tr>
						<th>사건번호</th>
						<th>신청일</th>
						<th>구분</th>
						<th>대상자(상호)</th>
						<th>사건유형</th>
						<th>품목명</th>
						<th>사건상태</th>
						<th>상세보기</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>INC-2026-000128</td>
						<td>2026-09-22</td>
						<td>생산자</td>
						<td>불행농장</td>
						<td>가뭄</td>
						<td>복숭아</td>
						<td>조사중</td>
						<td>
							<button class="detail-btn">보기</button>
						</td>
					</tr>

					<tr>
						<td>INC-2026-000127</td>
						<td>2026-09-21</td>
						<td>생산자</td>
						<td>김현아(행복농장)</td>
						<td>병해충</td>
						<td>사과</td>
						<td>조사완료</td>
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