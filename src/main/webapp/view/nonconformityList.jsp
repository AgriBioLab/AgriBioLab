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
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/nonconformityList.jsp">

				<!-- 기간 -->
				<div class="search-row">

					<label class="search-label">기간</label> <input type="date" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" name="endDate" class="search-input date" value="2026-09-23">

				</div>

				<!-- 조치상태 -->
				<div class="search-row">

					<label class="search-label">조치상태</label>
					<select name="status" class="search-select">
						<option value="">전체</option>
						<option value="WAIT">조치대기</option>
						<option value="PROGRESS">조치진행</option>
						<option value="HOLD">조치보류</option>
						<option value="DONE">조치완료</option>
					</select>

				</div>

				<!-- 부적합조치번호 -->
				<div class="search-row">

					<label class="search-label">부적합조치번호</label> <input type="text" name="actionNo" class="search-input normal" placeholder="NCR-2026-00135">

				</div>

				<!-- 부적합유형 -->
				<div class="search-row">

					<label class="search-label">부적합유형</label> <input type="text" name="ncType" class="search-input normal" placeholder="병해충">

				</div>

				<!-- 대표자명 -->
				<div class="search-row">

					<label class="search-label">대표자명</label> <input type="text" name="ownerName" class="search-input normal" placeholder="김현아">

				</div>

				<!-- 단체/상호명 -->
				<div class="search-row">

					<label class="search-label">단체/상호명</label> <input type="text" name="bizName" class="search-input normal" placeholder="행복농장">

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

					<label class="search-label">품목명</label> <input type="text" name="itemName" class="search-input normal" placeholder="사과">

				</div>

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

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
						<th>대표자명</th>						
						<th>단체/상호명</th>
						<th>부적합유형</th>
						<th>품목명</th>
						<th>조치상태</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>NCR-2026-00136</td>
						<td>2026-09-01</td>
						<td>생산자</td>
						<td>이복자</td>
						<td>가원농장</td>
						<td>가뭄</td>
						<td>복숭아</td>
						<td>조치대기</td>
					</tr>
					
					<tr>
						<td>NCR-2026-00135</td>
						<td>2026-09-01</td>
						<td>생산자</td>
						<td>김현아</td>
						<td>행복농장</td>
						<td>병해충</td>
						<td>사과</td>
						<td>조치완료</td>
					</tr>
				</tbody>
			</table>

		</main>

	</div>

</body>
</html>