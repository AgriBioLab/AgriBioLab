<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 보상처리 지급결과 조회</title>

<!-- 검색영역 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBox.css">
<!-- 목록 표 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body class="menu-comp">

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_compensationSupport.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>보상처리 지급결과 조회</span>
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">보상처리 지급결과 조회</h1>

			<!-- ============= SEARCH ============= -->
			<!-- 보상 기준 목록: 한 줄 = 조치완료된 피해신청 1건의 보상 (조회 키는 피해신청번호) -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/compensationSupportList.jsp">

				<!-- 보상금 지급일 기간 (지급결과 기준 조회) -->
				<div class="search-row">

					<label class="search-label" for="startDate">보상금 지급일</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-09-29" title="기간 종료일">

				</div>

				<!-- 피해신청번호 -->
				<div class="search-row">

					<label class="search-label" for="applyNo">피해신청번호</label> <input type="text" id="applyNo" name="applyNo" class="search-input normal" placeholder="REQ-2026-000136">

				</div>

				<!-- 단체/상호명 (신청 업체) -->
				<div class="search-row">

					<label class="search-label" for="bizName">단체/상호명</label> <input type="text" id="bizName" name="bizName" class="search-input normal" placeholder="행복농장">

				</div>

				<!-- 대표자명 (이름 전체로 검색, 목록에는 가려서 표시, 개인농가는 신청인 본인) -->
				<div class="search-row">

					<label class="search-label" for="ownerName">대표자명</label> <input type="text" id="ownerName" name="ownerName" class="search-input normal" placeholder="김현아">

				</div>

				<!-- 구분 (보상 대상은 생산자·유통자·판매자 모두 가능) -->
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

					<label class="search-label" for="itemName">품목명</label> <input type="text" id="itemName" name="itemName" class="search-input normal" placeholder="사과">

				</div>

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<span class="result-count">검색 결과</span> <span>총<strong>4</strong>건</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<%-- 보상 지급결과 기준: 누구의 어떤 품목에 최종 보상금이 얼마로 산정됐고, 지급일·지급기관이 무엇인지 확인
			     정렬: 최신 지급일이 위, 지급제외 건은 지급일·지급기관 '-' --%>
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">보상처리 목록</caption>

					<thead>
						<tr>
							<th scope="col">피해신청번호</th>
							<th scope="col">구분</th>
							<th scope="col">단체/상호명</th>
							<th scope="col">대표자</th>
							<th scope="col">품목명</th>
							<th scope="col">최종 보상금</th>
							<th scope="col">보상금 지급일</th>
							<th scope="col">보상금 지급 기관</th>
						</tr>
					</thead>

					<!-- 샘플 데이터: 보상금 지급일 최신순 (MVC2 전환 시 c:forEach 로 교체) -->
					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
							<td>생산자</td>
							<td>행복농장</td>
							<td>김*아</td>
							<td>사과</td>
							<td>6,720,000원</td>
							<td>2026-09-30</td>
							<td>○○도 보상지급기관</td>
							
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000133">REQ-2026-000133</a></td>
							<td>생산자</td>
							<td>솔밭농장</td>
							<td>배*우</td>
							<td>배</td>
							<td>2,520,000원</td>
							<td>2026-09-28</td>
							<td>○○도 보상지급기관</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
							<td>판매자</td>
							<td>새봄마트</td>
							<td>문*호</td>
							<td>토마토</td>
							<td>1,960,000원</td>
							<td>2026-09-26</td>
							<td>○○도 보상지급기관</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000131">REQ-2026-000131</a></td>
							<td>생산자</td>
							<td>가원농장</td>
							<td>이*자</td>
							<td>복숭아</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>
					</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>
