<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 피해조치 목록</title>

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
				<span>홈</span> &gt; <span>피해조치</span> &gt; <span>피해조치 목록</span>
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">피해조치 목록</h1>

			<!-- ============= SEARCH ============= -->
			<!-- 조치 기준 목록: 한 줄 = 피해신청 1건의 조치 (조사중·조치 이행·조치완료), 조회 키는 피해신청번호 -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/caseActionList.jsp">

				<!-- 조치 결정일 기간 (조치 기준 조회) -->
				<div class="search-row">

					<label class="search-label" for="startDate">조치 결정일</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-09-29" title="기간 종료일">

				</div>

				<!-- 진행상태: 조사 이후 조치가 진행되는 건만 (접수·보완요청·반려·조치 대상 아님은 피해신청 메뉴에서) -->
				<div class="search-row">

					<label class="search-label" for="status">진행상태</label>
					<select id="status" name="status" class="search-select">
						<option value="">전체</option>
						<option value="INVESTIGATING">조사중</option>
						<option value="IN_ACTION">조치 이행</option>
						<option value="DONE">조치완료</option>
					</select>

				</div>

				<!-- 피해신청번호 -->
				<div class="search-row">

					<label class="search-label" for="applyNo">피해신청번호</label> <input type="text" id="applyNo" name="applyNo" class="search-input normal" placeholder="REQ-2026-000136">

				</div>

				<!-- 조치유형 (코드 값은 협의 전 예시) -->
				<div class="search-row">

					<label class="search-label" for="actionType">조치유형</label>
					<select id="actionType" name="actionType" class="search-select">
						<option value="">전체</option>
						<option value="RECALL">회수</option>
						<option value="DISPOSAL">폐기</option>
						<option value="CHANGE_USE">용도변경</option>
					</select>

				</div>

				<!-- 신청자 분류 (피해신청은 생산자·유통자·판매자 모두 가능) -->
				<div class="search-row">

					<span class="search-label">신청자 분류</span>
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

				<span class="result-count">피해조치 목록</span> <span>총<strong>6</strong>건</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<%-- 조치 기준: 누구(신청자 분류·신청자)에게 어떤 조치를, 언제(조치 기간)·어디서(조치기관) 했고 언제 끝났나(조치 종결일)
			     조사중이면 조치 항목은 '-', 신청자는 개인 이름 가림·업체명 그대로, 정렬: 최신 신청이 위 --%>
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">피해조치 목록</caption>

					<thead>
						<tr>
							<th scope="col">피해신청번호</th>
							<th scope="col">신청자 분류</th>
							<th scope="col">신청자</th>
							<th scope="col">품목명</th>
							<th scope="col">조치유형</th>
							<th scope="col">조치 기간</th>
							<th scope="col">조치기관</th>
							<th scope="col">진행상태</th>
							<th scope="col">조치 종결일</th>
						</tr>
					</thead>

					<!-- 샘플 데이터: 조사중·조치 이행 각 1건, 조치완료 4건, 최신 신청이 위 (MVC2 전환 시 c:forEach 로 교체) -->
					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000138">REQ-2026-000138</a></td>
							<td>생산자</td>
							<td>박*자</td>
							<td>복숭아</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>조사중</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000137">REQ-2026-000137</a></td>
							<td>생산자</td>
							<td>서*호</td>
							<td>고추</td>
							<td>회수</td>
							<td>2026-09-26 ~ 2026-10-03</td>
							<td>○○시 농업기술센터</td>
							<td>조치 이행</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
							<td>생산자</td>
							<td>김*아</td>
							<td>사과</td>
							<td>폐기</td>
							<td>2026-09-24 ~ 2026-09-27</td>
							<td>○○시 농업기술센터</td>
							<td>조치완료</td>
							<td>2026-09-28</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000133">REQ-2026-000133</a></td>
							<td>생산자</td>
							<td>배*우</td>
							<td>배</td>
							<td>회수</td>
							<td>2026-09-15 ~ 2026-09-19</td>
							<td>○○군 농업기술센터</td>
							<td>조치완료</td>
							<td>2026-09-20</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
							<td>판매자</td>
							<td>새봄마트</td>
							<td>토마토</td>
							<td>폐기</td>
							<td>2026-09-13 ~ 2026-09-17</td>
							<td>○○군 농업기술센터</td>
							<td>조치완료</td>
							<td>2026-09-18</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000131">REQ-2026-000131</a></td>
							<td>생산자</td>
							<td>이*자</td>
							<td>복숭아</td>
							<td>회수</td>
							<td>2026-09-12 ~ 2026-09-16</td>
							<td>○○시 농업기술센터</td>
							<td>조치완료</td>
							<td>2026-09-17</td>
						</tr>
					</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>