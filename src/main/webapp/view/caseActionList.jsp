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

<body>

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
			<!-- 목록 한 줄 = 피해신청 1건의 조치 (조사중·조치 이행·조치완료, 조회 키는 피해신청번호) -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/caseActionList.jsp">

				<!-- 기간 (신청일) -->
				<div class="search-row">

					<label class="search-label" for="startDate">기간</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
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

				<!-- 농장명 -->
				<div class="search-row">

					<label class="search-label" for="farmName">농장명</label> <input type="text" id="farmName" name="farmName" class="search-input normal" placeholder="행복농장">

				</div>

				<!-- 품목명 -->
				<div class="search-row">

					<label class="search-label" for="itemName">품목명</label> <input type="text" id="itemName" name="itemName" class="search-input normal" placeholder="사과">

				</div>

				<!-- 처리 담당자 -->
				<div class="search-row">

					<label class="search-label" for="managerName">처리 담당자</label> <input type="text" id="managerName" name="managerName" class="search-input normal" placeholder="박민수">

				</div>

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<span class="result-count">피해조치 목록</span> <span>총<strong>12</strong>건</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<%-- 모니터링 기준: 처리 담당자(배정), 처리 일수(종결 건은 신청일~종결일, 진행 중은 오늘까지 '○일 경과'), 종결일(진행 중이면 '-')
			     정렬: 최신 신청이 위 (모든 목록 공통)
			     재해유형·품목명은 등록된 재해정보에서 불러온 값 --%>
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">피해조치 목록</caption>

					<thead>
						<tr>
							<th scope="col">피해신청번호</th>
							<th scope="col">농장명</th>
							<th scope="col">품목명</th>
							<th scope="col">재해유형</th>
							<th scope="col">조치유형</th>
							<th scope="col">진행상태</th>
							<th scope="col">처리 담당자</th>
							<th scope="col">처리 일수</th>
							<th scope="col">종결일</th>
						</tr>
					</thead>

					<!-- 샘플 데이터: 조사중 2·조치 이행 2·조치완료 8건, 최신 신청이 위 (MVC2 전환 시 c:forEach 로 교체) -->
					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000140">REQ-2026-000140</a></td>
							<td>해뜰과수원</td>
							<td>감귤</td>
							<td>태풍</td>
							<td>-</td>
							<td>조사중</td>
							<td>최지훈</td>
							<td>5일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000139">REQ-2026-000139</a></td>
							<td>동동과수원</td>
							<td>복숭아</td>
							<td>가뭄</td>
							<td>-</td>
							<td>조사중</td>
							<td>박민수</td>
							<td>6일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000138">REQ-2026-000138</a></td>
							<td>초록농원</td>
							<td>배추</td>
							<td>침수</td>
							<td>용도변경</td>
							<td>조치 이행</td>
							<td>김서연</td>
							<td>7일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000137">REQ-2026-000137</a></td>
							<td>산마루농장</td>
							<td>고추</td>
							<td>병해충</td>
							<td>회수</td>
							<td>조치 이행</td>
							<td>박민수</td>
							<td>8일 경과</td>
							<td>-</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
							<td>행복농장</td>
							<td>사과</td>
							<td>병해충</td>
							<td>폐기</td>
							<td>조치완료</td>
							<td>박민수</td>
							<td>7일</td>
							<td>2026-09-28</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
							<td>바람농장</td>
							<td>감자</td>
							<td>침수</td>
							<td>회수</td>
							<td>조치완료</td>
							<td>최지훈</td>
							<td>8일</td>
							<td>2026-09-24</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000130">REQ-2026-000130</a></td>
							<td>은하농원</td>
							<td>딸기</td>
							<td>병해충</td>
							<td>폐기</td>
							<td>조치완료</td>
							<td>박민수</td>
							<td>8일</td>
							<td>2026-09-22</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000129">REQ-2026-000129</a></td>
							<td>솔밭농장</td>
							<td>배</td>
							<td>우박</td>
							<td>회수</td>
							<td>조치완료</td>
							<td>김서연</td>
							<td>8일</td>
							<td>2026-09-20</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000128">REQ-2026-000128</a></td>
							<td>들녘농장</td>
							<td>양파</td>
							<td>가뭄</td>
							<td>용도변경</td>
							<td>조치완료</td>
							<td>최지훈</td>
							<td>8일</td>
							<td>2026-09-19</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000127">REQ-2026-000127</a></td>
							<td>새봄농원</td>
							<td>토마토</td>
							<td>침수</td>
							<td>폐기</td>
							<td>조치완료</td>
							<td>김서연</td>
							<td>8일</td>
							<td>2026-09-18</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000126">REQ-2026-000126</a></td>
							<td>가원농장</td>
							<td>복숭아</td>
							<td>병해충</td>
							<td>회수</td>
							<td>조치완료</td>
							<td>박민수</td>
							<td>8일</td>
							<td>2026-09-17</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/caseActionDetail.jsp?no=REQ-2026-000125">REQ-2026-000125</a></td>
							<td>한울농장</td>
							<td>오이</td>
							<td>냉해</td>
							<td>용도변경</td>
							<td>조치완료</td>
							<td>최지훈</td>
							<td>8일</td>
							<td>2026-09-16</td>
						</tr>
					</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>