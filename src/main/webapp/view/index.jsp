<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 메인</title>

<!-- 메인 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<!-- 목록 표 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body class="menu-home">

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout index-layout">

		<!-- ============= CONTENT ============= -->
		<main class="content index-content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span>
			</nav>

			<!-- Page Title -->
			<h1 class="page-title">메인</h1>

			<!-- ============= 주요 업무 ============= -->
			<section class="index-section">
				<h2 class="index-section-title">주요 업무</h2>

				<div class="work-menu-grid">
					<a class="work-menu-card primary" href="${pageContext.request.contextPath}/view/compensationSupportList.jsp">
						<strong>보상처리 지급결과 조회</strong>
						<span>보상 신청부터 산정, 지급까지의 전체 흐름과 지급결과를 조회합니다.</span>
					</a>
					<a class="work-menu-card" href="${pageContext.request.contextPath}/view/qualityStatistics.jsp">
						<strong>품질통계 조회</strong>
						<span>재해유형, 품목, 지역, 보상금 기준으로 품질관리 판단에 필요한 통계를 분석합니다.</span>
					</a>
					<a class="work-menu-card" href="${pageContext.request.contextPath}/view/caseActionList.jsp">
						<strong>피해조치 결과 조회</strong>
						<span>피해신청 이후 전체 흐름 안에서 조치 계획과 실제 수행 결과를 조회합니다.</span>
					</a>
					<a class="work-menu-card" href="${pageContext.request.contextPath}/view/damageApplyList.jsp">
						<strong>피해신청 처리상태 조회</strong>
						<span>피해신청 접수 건별로 재해유형, 품목, 신청 정보를 조회합니다.</span>
					</a>
				</div>
			</section>

			<!-- ============= 처리상태 요약 ============= -->
			<section class="index-section">
				<h2 class="index-section-title">오늘 기준 주요 처리상태 요약</h2>

				<dl class="status-summary">
					<div>
						<dt>피해신청 접수</dt>
						<dd>12건</dd>
					</div>
					<div>
						<dt>피해조치 진행</dt>
						<dd>7건</dd>
					</div>
					<div>
						<dt>보상금 산정</dt>
						<dd>4건</dd>
					</div>
					<div>
						<dt>보상금 지급완료</dt>
						<dd>18건</dd>
					</div>
				</dl>
			</section>

			<!-- ============= 최근 업무 ============= -->
			<section class="index-section">
				<div class="index-section-head">
					<h2 class="index-section-title">최근 보상처리 지급결과</h2>
					<a class="index-more-link" href="${pageContext.request.contextPath}/view/compensationSupportList.jsp">전체보기</a>
				</div>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">최근 보상처리</caption>
						<thead>
							<tr>
								<th scope="col">피해신청번호</th>
								<th scope="col">단체/상호명</th>
								<th scope="col">품목명</th>
								<th scope="col">최종 보상금</th>
								<th scope="col">보상금 지급일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
								<td>행복농장</td>
								<td>사과</td>
								<td>6,720,000원</td>
								<td>2026-09-30</td>
							</tr>
							<tr>
								<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000133">REQ-2026-000133</a></td>
								<td>솔밭농장</td>
								<td>배</td>
								<td>2,520,000원</td>
								<td>2026-09-28</td>
							</tr>
							<tr>
								<td><a class="case-link" href="${pageContext.request.contextPath}/view/compensationSupportDetail.jsp?no=REQ-2026-000132">REQ-2026-000132</a></td>
								<td>새봄마트</td>
								<td>토마토</td>
								<td>1,960,000원</td>
								<td>2026-09-26</td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>

		</main>

	</div>

</body>
</html>

