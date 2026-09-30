<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 보상처리 목록</title>

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
		<%@ include file="side_compensationSupport.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>보상처리</span> &gt; <span>보상처리 목록</span>
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">보상처리 목록</h1>

			<!-- ============= SEARCH ============= -->
			<!-- 목록 한 줄 = 조치완료된 피해신청 1건의 보상 (조회 키는 피해신청번호) -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/compensationSupportList.jsp">

				<!-- 기간 (신청일) -->
				<div class="search-row">

					<label class="search-label" for="startDate">기간</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-09-29" title="기간 종료일">

				</div>

				<!-- 보상상태 (코드 값은 협의 전 예시, 통계 화면 보상상태와 맞출 것) -->
				<div class="search-row">

					<label class="search-label" for="status">보상상태</label>
					<select id="status" name="status" class="search-select">
						<option value="">전체</option>
						<option value="REVIEWING">심사중</option>
						<option value="APPROVED">지급결정</option>
						<option value="PAID">지급완료</option>
						<option value="NOT_PAID">부지급</option>
					</select>

				</div>

				<!-- 피해신청번호 -->
				<div class="search-row">

					<label class="search-label" for="applyNo">피해신청번호</label> <input type="text" id="applyNo" name="applyNo" class="search-input normal" placeholder="REQ-2026-000136">

				</div>

				<!-- 처리 담당자 -->
				<div class="search-row">

					<label class="search-label" for="managerName">처리 담당자</label> <input type="text" id="managerName" name="managerName" class="search-input normal" placeholder="박민수">

				</div>

				<!-- 농장명 -->
				<div class="search-row">

					<label class="search-label" for="farmName">농장명</label> <input type="text" id="farmName" name="farmName" class="search-input normal" placeholder="행복농장">

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

				<span class="result-count">보상처리 목록</span> <span>총<strong>8</strong>건</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<%-- 핵심 화면(모니터링 첫 화면): 조치완료된 건만 보상처리로 넘어옴
			     처리 일수 = 신청일 ~ 지급일(부지급은 결정일), 진행 중(심사중·지급결정)은 오늘까지 '○일 경과'
			     정렬: 최신 신청이 위 (모든 목록 공통), 재해유형·품목명은 등록된 재해정보에서 불러온 값 --%>
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">보상처리 목록</caption>

					<thead>
						<tr>
							<th scope="col">피해신청번호</th>
							<th scope="col">농장명</th>
							<th scope="col">품목명</th>
							<th scope="col">재해유형</th>
							<th scope="col">보상금액</th>
							<th scope="col">보상상태</th>
							<th scope="col">처리 담당자</th>
							<th scope="col">처리 일수</th>
							<th scope="col">지급일</th>
						</tr>
					</thead>

					<!-- 샘플 데이터: 보상상태 4가지 각 2건, 최신 신청이 위 (MVC2 전환 시 c:forEach 로 교체) -->
					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
							<td>행복농장</td>
							<td>사과</td>
							<td>병해충</td>
							<td>8,400,000원</td>
							<td>지급완료</td>
							<td>박민수</td>
							<td>9일</td>
							<td>2026-09-30</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
							<td>바람농장</td>
							<td>감자</td>
							<td>침수</td>
							<td>2,100,000원</td>
							<td>심사중</td>
							<td>최지훈</td>
							<td>14일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000130">REQ-2026-000130</a></td>
							<td>은하농원</td>
							<td>딸기</td>
							<td>병해충</td>
							<td>5,600,000원</td>
							<td>지급결정</td>
							<td>박민수</td>
							<td>16일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000129">REQ-2026-000129</a></td>
							<td>솔밭농장</td>
							<td>배</td>
							<td>우박</td>
							<td>3,150,000원</td>
							<td>심사중</td>
							<td>김서연</td>
							<td>18일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000128">REQ-2026-000128</a></td>
							<td>들녘농장</td>
							<td>양파</td>
							<td>가뭄</td>
							<td>-</td>
							<td>부지급</td>
							<td>최지훈</td>
							<td>11일</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000127">REQ-2026-000127</a></td>
							<td>새봄농원</td>
							<td>토마토</td>
							<td>침수</td>
							<td>2,450,000원</td>
							<td>지급결정</td>
							<td>김서연</td>
							<td>20일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000126">REQ-2026-000126</a></td>
							<td>가원농장</td>
							<td>복숭아</td>
							<td>병해충</td>
							<td>-</td>
							<td>부지급</td>
							<td>박민수</td>
							<td>11일</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000125">REQ-2026-000125</a></td>
							<td>한울농장</td>
							<td>오이</td>
							<td>냉해</td>
							<td>1,800,000원</td>
							<td>지급완료</td>
							<td>최지훈</td>
							<td>14일</td>
							<td>2026-09-22</td>
						</tr>
</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>