<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 등록된 재해 정보와 현장조사 결과 조회</title>

<!-- 검색영역 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBox.css">
<!-- 목록 표 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_agricultureCase.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>등록된 재해 정보와 현장조사 결과 조회</span> <!--&gt; = > 이 표시 -->
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">등록된 재해 정보와 현장조사 결과 조회</h1>

			<!-- ============= SEARCH ============= -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/agricultureCaseList.jsp">

				<!-- 재해 등록일 기간 -->
				<div class="search-row">

					<label class="search-label" for="startDate">재해 등록일</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-10-01" title="기간 종료일">

				</div>

				<!-- 재해 조사 진행상태 -->
				<div class="search-row">

					<label class="search-label" for="status">재해 조사 진행상태</label>
					<select id="status" name="status" class="search-select">
						<option value="">전체</option>
						<option value="RECEIVED">접수</option>
						<option value="INVESTIGATING">조사중</option>
						<option value="PROCESSING">처리중</option>
						<option value="INVESTIGATED">현장조사 결과 등록 완료</option>
					</select>

				</div>

				<!-- 재해정보번호 -->
				<div class="search-row">

					<label class="search-label" for="caseNo">재해정보번호</label> <input type="text" id="caseNo" name="caseNo" class="search-input normal" placeholder="INC-2026-000128">

				</div>

				<!-- 재해유형 -->
				<div class="search-row">

					<label class="search-label" for="caseType">재해유형</label> <input type="text" id="caseType" name="caseType" class="search-input normal" placeholder="병해충">

				</div>

				<!-- 대표자명 -->
				<div class="search-row">

					<label class="search-label" for="ownerName">대표자명</label> <input type="text" id="ownerName" name="ownerName" class="search-input normal" placeholder="김현아">

				</div>

				<!-- 단체/상호명 -->
				<div class="search-row">

					<label class="search-label" for="bizName">단체/상호명</label> <input type="text" id="bizName" name="bizName" class="search-input normal" placeholder="행복농장">

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

					<label class="search-label" for="itemName">품목</label> <input type="text" id="itemName" name="itemName" class="search-input normal" placeholder="사과">

				</div>

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<span class="result-count">등록된 재해 정보와 현장조사 결과 목록</span> <span>총<strong>2</strong>건
				</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">등록된 재해 정보와 현장조사 결과 목록</caption>

					<thead>
						<tr>
							<th scope="col">재해정보번호</th>
							<th scope="col">피해신청 접수일</th>
							<th scope="col">구분</th>
							<th scope="col">대표자명</th>						
							<th scope="col">단체/상호명</th>
							<th scope="col">재해유형</th>
							<th scope="col">품목</th>
							<th scope="col">재해 조사 진행상태</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/agricultureCaseDetail.jsp?no=INC-2026-000128">INC-2026-000128</a></td>
							<td>2026-09-22</td>
							<td>생산자</td>
							<td>박연자</td>
							<td>동동농업협동조합</td>
							<td>가뭄</td>
							<td>복숭아</td>
							<td>조사중</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/agricultureCaseDetail.jsp?no=INC-2026-000127">INC-2026-000127</a></td>
							<td>2026-09-21</td>
							<td>생산자</td>
							<td>김현아</td>
							<td>행복농장</td>
							<td>병해충</td>
							<td>사과</td>
							<td>현장조사 결과 등록 완료</td>
						</tr>
					</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>
