<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 피해조치 결과 조회</title>

<!-- 검색영역 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBox.css">
<!-- 목록 표 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body class="menu-action">

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_caseAction.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>피해조치 결과 조회</span>
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">피해조치 결과 조회</h1>

			<!-- ============= SEARCH ============= -->
			<!-- 조치 기준 목록: 한 줄 = 피해신청 1건의 조치, 조회 키는 피해신청번호 -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/caseActionList.jsp">

				<!-- 조치 결정일 기간 (조치 기준 조회) -->
				<div class="search-row">

					<label class="search-label" for="startDate">조치 방법 확정일</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-09-29" title="기간 종료일">

				</div>

				<!-- 피해신청번호 -->
				<div class="search-row">

					<label class="search-label" for="applyNo">피해신청번호</label> <input type="text" id="applyNo" name="applyNo" class="search-input normal" placeholder="REQ-2026-000136">

				</div>

				<!-- 조치 방법 (코드 값은 협의 전 예시) -->
				<div class="search-row">

					<label class="search-label" for="actionType">조치 방법</label>
					<select id="actionType" name="actionType" class="search-select">
						<option value="">전체</option>
						<option value="RECALL">회수</option>
						<option value="DISPOSAL">폐기</option>
						<option value="CHANGE_USE">용도변경</option>
					</select>

				</div>

				<!-- 구분 (피해신청은 생산자·유통자·판매자 모두 가능) -->
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

				<span class="result-count">검색 결과</span> <span>총<strong>6</strong>건</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<%-- 조치 기준: 누구(구분·단체/상호명·대표자)에게 어떤 조치를 언제까지 끝내도록 정했고 언제 결과 확인이 끝났나(조치 결과 확인일)
			     현장조사 단계이면 조치 항목은 '-', 대표자는 가림, 정렬: 최신 신청이 위 --%>
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">피해조치 목록</caption>

					<thead>
						<tr>
							<th scope="col">피해신청번호</th>
							<th scope="col">구분</th>
							<th scope="col">단체/상호명</th>
							<th scope="col">대표자</th>
							<th scope="col">품목명</th>
							<th scope="col">조치 방법</th>
							<th scope="col">조치 완료 요청기한</th>
							<th scope="col">실제 조치 수행 완료일</th>
						</tr>
					</thead>

					<!-- 샘플 데이터: 최신 신청이 위 (MVC2 전환 시 c:forEach 로 교체) -->
					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000138">REQ-2026-000138</a></td>
							<td>생산자</td>
							<td>-</td>
							<td>박*자</td>
							<td>복숭아</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000137">REQ-2026-000137</a></td>
							<td>생산자</td>
							<td>산마루농장</td>
							<td>서*호</td>
							<td>고추</td>
							<td>회수</td>
							<td>2026-10-03</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
							<td>생산자</td>
							<td>행복농장</td>
							<td>김*아</td>
							<td>사과</td>
							<td>폐기</td>
							<td>2026-09-27</td>
							<td>2026-09-28</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000133">REQ-2026-000133</a></td>
							<td>생산자</td>
							<td>솔밭농장</td>
							<td>배*우</td>
							<td>배</td>
							<td>회수</td>
							<td>2026-09-19</td>
							<td>2026-09-20</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
							<td>판매자</td>
							<td>새봄마트</td>
							<td>문*호</td>
							<td>토마토</td>
							<td>폐기</td>
							<td>2026-09-17</td>
							<td>2026-09-18</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000131">REQ-2026-000131</a></td>
							<td>생산자</td>
							<td>가원농장</td>
							<td>이*자</td>
							<td>복숭아</td>
							<td>회수</td>
							<td>2026-09-16</td>
							<td>2026-09-17</td>
						</tr>
					</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>
