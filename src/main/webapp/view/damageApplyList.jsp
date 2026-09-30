<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 피해신청 목록</title>

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
		<%@ include file="side_damageApply.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>피해신청</span> &gt; <span>피해신청 목록</span>
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">피해신청 목록</h1>

			<!-- ============= SEARCH ============= -->
			<!-- 목록 한 줄 = 피해신청 1건, 모든 진행상태 (조치 내용은 피해조치 메뉴에서) -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/damageApplyList.jsp">

				<!-- 기간 (신청일) -->
				<div class="search-row">

					<label class="search-label" for="startDate">기간</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-09-29" title="기간 종료일">

				</div>

				<!-- 진행상태 (코드 값은 협의 전 예시)
				     반려 = 조사 전 자격 불일치로 종결, 조치 대상 아님 = 조사 후 피해 미인정으로 종결 -->
				<div class="search-row">

					<label class="search-label" for="status">진행상태</label>
					<select id="status" name="status" class="search-select">
						<option value="">전체</option>
						<option value="RECEIVED">접수</option>
						<option value="SUPPLEMENT">보완요청</option>
						<option value="INVESTIGATING">조사중</option>
						<option value="IN_ACTION">조치 이행</option>
						<option value="DONE">조치완료</option>
						<option value="NOT_TARGET">조치 대상 아님</option>
						<option value="REJECTED">반려</option>
					</select>

				</div>

				<!-- 피해신청번호 -->
				<div class="search-row">

					<label class="search-label" for="applyNo">피해신청번호</label> <input type="text" id="applyNo" name="applyNo" class="search-input normal" placeholder="REQ-2026-000127">

				</div>

				<!-- 재해유형 (등록된 재해에서 불러온 값) -->
				<div class="search-row">

					<label class="search-label" for="disasterType">재해유형</label>
					<select id="disasterType" name="disasterType" class="search-select">
						<option value="">전체</option>
						<option value="DROUGHT">가뭄</option>
						<option value="FLOOD">침수</option>
						<option value="TYPHOON">태풍</option>
						<option value="HAIL">우박</option>
						<option value="COLD">냉해</option>
						<option value="PEST">병해충</option>
					</select>

				</div>

				<!-- 신청자명 -->
				<div class="search-row">

					<label class="search-label" for="applicantName">신청자명</label> <input type="text" id="applicantName" name="applicantName" class="search-input normal" placeholder="김현아">

				</div>

				<!-- 농장명 -->
				<div class="search-row">

					<label class="search-label" for="farmName">농장명</label> <input type="text" id="farmName" name="farmName" class="search-input normal" placeholder="행복농장">

				</div>

				<!-- 신청자 분류 -->
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

				<span class="result-count">피해신청 목록</span> <span>총<strong>12</strong>건</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">피해신청 목록</caption>

					<thead>
						<tr>
							<th scope="col">피해신청번호</th>
							<th scope="col">신청일</th>
							<th scope="col">신청자 분류</th>
							<th scope="col">신청자명</th>
							<th scope="col">농장명</th>
							<%-- 품목명: 재해유형과 함께 등록된 재해정보에서 불러온 값 (재해 1건 = 품목 1개) --%>
							<th scope="col">품목명</th>
							<th scope="col">진행상태</th>
							<%-- 재해유형: 생산자가 신청 전에 등록된 재해를 불러와 신청하므로 그 재해의 유형 (신청에는 재해정보_일련번호만 저장) --%>
							<th scope="col">재해유형</th>
						</tr>
					</thead>

					<!-- 샘플 데이터: 1차 스프린트 가정에 따라 신청자는 모두 생산자 (MVC2 전환 시 c:forEach 로 교체) -->
					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
							<td>2026-09-28</td>
							<td>생산자</td>
							<td>정미숙</td>
							<td>햇살딸기농원</td>
							<td>딸기</td>
							<td>접수</td>
							<td>병해충</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000135">REQ-2026-000135</a></td>
							<td>2026-09-27</td>
							<td>생산자</td>
							<td>최용준</td>
							<td>청솔농장</td>
							<td>배</td>
							<td>보완요청</td>
							<td>우박</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000134">REQ-2026-000134</a></td>
							<td>2026-09-26</td>
							<td>생산자</td>
							<td>한지영</td>
							<td>푸른들영농조합</td>
							<td>벼</td>
							<td>조치 대상 아님</td>
							<td>침수</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000133">REQ-2026-000133</a></td>
							<td>2026-09-25</td>
							<td>생산자</td>
							<td>윤태식</td>
							<td>해뜰과수원</td>
							<td>감귤</td>
							<td>조사중</td>
							<td>태풍</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
							<td>2026-09-24</td>
							<td>생산자</td>
							<td>서민호</td>
							<td>산마루농장</td>
							<td>고추</td>
							<td>조치 이행</td>
							<td>병해충</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000131">REQ-2026-000131</a></td>
							<td>2026-09-24</td>
							<td>생산자</td>
							<td>장은비</td>
							<td>초록농원</td>
							<td>배추</td>
							<td>조치 이행</td>
							<td>침수</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000130">REQ-2026-000130</a></td>
							<td>2026-09-23</td>
							<td>생산자</td>
							<td>임동건</td>
							<td>가람농장</td>
							<td>포도</td>
							<td>조치 이행</td>
							<td>우박</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000129">REQ-2026-000129</a></td>
							<td>2026-09-23</td>
							<td>생산자</td>
							<td>강수연</td>
							<td>들꽃농장</td>
							<td>참외</td>
							<td>반려</td>
							<td>가뭄</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000128">REQ-2026-000128</a></td>
							<td>2026-09-22</td>
							<td>생산자</td>
							<td>박연자</td>
							<td>동동과수원</td>
							<td>복숭아</td>
							<td>조사중</td>
							<td>가뭄</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000127">REQ-2026-000127</a></td>
							<td>2026-09-21</td>
							<td>생산자</td>
							<td>김현아</td>
							<td>행복농장</td>
							<td>사과</td>
							<td>조치완료</td>
							<td>병해충</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000126">REQ-2026-000126</a></td>
							<td>2026-09-18</td>
							<td>생산자</td>
							<td>이복자</td>
							<td>가원농장</td>
							<td>복숭아</td>
							<td>조치완료</td>
							<td>병해충</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000125">REQ-2026-000125</a></td>
							<td>2026-09-15</td>
							<td>생산자</td>
							<td>송재원</td>
							<td>한울농장</td>
							<td>오이</td>
							<td>조치완료</td>
							<td>냉해</td>
						</tr>
					</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>