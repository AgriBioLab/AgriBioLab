<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 피해신청 처리상태 조회</title>

<!-- 검색영역 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBox.css">
<!-- 목록 표 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body class="menu-apply">

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_damageApply.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>피해신청 처리상태 조회</span>
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">피해신청 처리상태 조회</h1>

			<!-- ============= SEARCH ============= -->
			<!-- 목록 한 줄 = 피해신청 1건, 모든 진행상태 (조치 내용은 피해조치 메뉴에서), 신청 주체는 단체/상호명(업체)로 표시, 대표자는 가려서 표시·이름 전체로 검색, 개인농가는 단체/상호명 '-' (생산자 신청이면 단체/상호명와 생산지가 같음) -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/damageApplyList.jsp">

				<!-- 기간 (신청일) -->
				<div class="search-row">

					<label class="search-label" for="startDate">피해신청 접수일</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-09-29" title="기간 종료일">

				</div>

				<!-- 피해신청번호 -->
				<div class="search-row">

					<label class="search-label" for="applyNo">피해신청번호</label> <input type="text" id="applyNo" name="applyNo" class="search-input normal" placeholder="REQ-2026-000136">

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

				<!-- 단체/상호명 (신청 업체: 생산자 농가·유통 업체·판매 업체) -->
				<div class="search-row">

					<label class="search-label" for="bizName">단체/상호명</label> <input type="text" id="bizName" name="bizName" class="search-input normal" placeholder="행복농장">

				</div>

				<!-- 대표자명 (이름 전체로 검색, 목록에는 가려서 표시, 개인농가는 신청인 본인) -->
				<div class="search-row">

					<label class="search-label" for="ownerName">대표자명</label> <input type="text" id="ownerName" name="ownerName" class="search-input normal" placeholder="김현아">

				</div>

				<!-- 생산지 (신청자가 유통자·판매자여도 생산지는 항상 있음) -->
				<div class="search-row">

					<label class="search-label" for="farmName">생산지</label> <input type="text" id="farmName" name="farmName" class="search-input normal" placeholder="행복농장">

				</div>

				<!-- 품목명 -->
				<div class="search-row">

					<label class="search-label" for="itemName">품목명</label> <input type="text" id="itemName" name="itemName" class="search-input normal" placeholder="사과">

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

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<span class="result-count">검색 결과</span> <span>총<strong>10</strong>건</span>

			</div>

			<!-- ============= TABLE ============= -->
			<!-- 좁은 화면에서는 표 영역 안에서만 가로 스크롤 -->
			<div class="table-wrap">
				<table class="list-table">
					<caption class="sr-only">피해신청 목록</caption>

					<thead>
						<tr>
							<th scope="col">피해신청번호</th>
							<th scope="col">피해신청 접수일</th>
							<th scope="col">구분</th>
							<th scope="col">단체/상호명</th>
							<th scope="col">대표자</th>
							<th scope="col">생산지</th>
							<%-- 품목명: 재해유형과 함께 등록된 재해정보에서 불러온 값 (재해 1건 = 품목 1개) --%>
							<th scope="col">품목명</th>
							<%-- 재해유형: 생산자가 신청 전에 등록된 재해를 불러와 신청하므로 그 재해의 유형 (신청에는 재해정보_일련번호만 저장) --%>
							<th scope="col">재해유형</th>
						</tr>
					</thead>

					<!-- 샘플 데이터: 최신 신청이 위 (MVC2 전환 시 c:forEach 로 교체) -->
					<tbody>
						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000140">REQ-2026-000140</a></td>
							<td>2026-09-28</td>
							<td>생산자</td>
							<td>햇살딸기농원</td>
							<td>정*숙</td>
							<td>햇살딸기농원</td>
							<td>딸기</td>
							<td>병해충</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000139">REQ-2026-000139</a></td>
							<td>2026-09-26</td>
							<td>유통자</td>
							<td>청솔유통</td>
							<td>최*준</td>
							<td>청솔농장</td>
							<td>배</td>
							<td>우박</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000138">REQ-2026-000138</a></td>
							<td>2026-09-24</td>
							<td>생산자</td>
							<td>-</td>
							<td>박*자</td>
							<td>박*자 농가</td>
							<td>복숭아</td>
							<td>가뭄</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000137">REQ-2026-000137</a></td>
							<td>2026-09-22</td>
							<td>생산자</td>
							<td>산마루농장</td>
							<td>서*호</td>
							<td>산마루농장</td>
							<td>고추</td>
							<td>병해충</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
							<td>2026-09-21</td>
							<td>생산자</td>
							<td>행복농장</td>
							<td>김*아</td>
							<td>행복농장</td>
							<td>사과</td>
							<td>병해충</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000135">REQ-2026-000135</a></td>
							<td>2026-09-18</td>
							<td>생산자</td>
							<td>들꽃농장</td>
							<td>강*연</td>
							<td>들꽃농장</td>
							<td>참외</td>
							<td>가뭄</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000134">REQ-2026-000134</a></td>
							<td>2026-09-15</td>
							<td>생산자</td>
							<td>푸른들영농조합</td>
							<td>한*영</td>
							<td>푸른들영농조합</td>
							<td>벼</td>
							<td>침수</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000133">REQ-2026-000133</a></td>
							<td>2026-09-12</td>
							<td>생산자</td>
							<td>솔밭농장</td>
							<td>배*우</td>
							<td>솔밭농장</td>
							<td>배</td>
							<td>우박</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
							<td>2026-09-10</td>
							<td>판매자</td>
							<td>새봄마트</td>
							<td>문*호</td>
							<td>새봄농원</td>
							<td>토마토</td>
							<td>침수</td>
						</tr>

						<tr>
							<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000131">REQ-2026-000131</a></td>
							<td>2026-09-09</td>
							<td>생산자</td>
							<td>가원농장</td>
							<td>이*자</td>
							<td>가원농장</td>
							<td>복숭아</td>
							<td>병해충</td>
						</tr>
					</tbody>
				</table>
			</div>

		</main>

	</div>

</body>
</html>
