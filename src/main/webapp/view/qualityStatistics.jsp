<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 품질통계 조회</title>

<!-- 검색영역 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBox.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.4/dist/chart.umd.min.js"></script>

<!-- 통계 결과 영역 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/statistics.css">

</head>
<body class="menu-stats">

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_qualityStatistics.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>품질통계 조회</span> &gt; <span>재해유형별 보상금 비교</span>
			</nav>


			<!-- Page Title -->
			<h1 class="page-title">재해유형별 보상금 비교</h1>

			<!-- ============= SEARCH ============= -->
			<!-- 통계 검색조건: 아래 그래프의 재해유형·보상상태 값과 같은 기준 -->
			<form class="search-box" method="get" action="${pageContext.request.contextPath}/view/qualityStatistics.jsp">

				<!-- 기간 -->
				<div class="search-row">

					<label class="search-label" for="startDate">통계 분석 기간</label> <input type="date" id="startDate" name="startDate" class="search-input date" value="2026-09-01"> <span class="date-separator">
						~ </span> <input type="date" id="endDate" name="endDate" class="search-input date" value="2026-09-29" title="기간 종료일">

				</div>

				<!-- 재해유형 -->
				<div class="search-row">

					<label class="search-label" for="disasterType">재해유형</label>
					<select id="disasterType" name="disasterType" class="search-select">
						<option value="">전체</option>
						<option value="DROUGHT">가뭄</option>
						<option value="FLOOD">침수</option>
						<option value="TYPHOON">태풍</option>
						<option value="HAIL">우박</option>
						<option value="COLD">냉해</option>
						<option value="SNOW">대설</option>
					</select>

				</div>

				<!-- 품목명 -->
				<div class="search-row">

					<label class="search-label" for="itemName">품목명</label> <input type="text" id="itemName" name="itemName" class="search-input normal" placeholder="품목명을 입력하세요">

				</div>

				<!-- 보상상태 -->
				<div class="search-row">

					<label class="search-label" for="status">통합 진행상태</label>
					<select id="status" name="status" class="search-select">
						<option value="">전체</option>
						<option value="APPLY">피해신청</option>
						<option value="SURVEY">현장조사</option>
						<option value="ACTION">피해조치</option>
						<option value="COMPENSATION">보상처리</option>
						<option value="PAYMENT">지급결과 확인</option>
					</select>

				</div>

				<!-- 검색 / 초기화 -->
				<div class="search-row full search-actions">

					<button type="submit" class="search-btn">검색</button>
					<button type="reset" class="reset-btn">초기화</button>

				</div>

			</form>

			<!-- ============= RESULT ============= -->
			<div class="result-info">

				<!-- ============= STATISTICS ============= -->
				<section class="statistics-result">

					<h2 class="statistics-result-title">재해유형별 신청 금액과 지급 금액 비교</h2>

					<p class="statistics-result-desc">
						검색 조건에 해당하는 피해조치와 보상처리 데이터를 재해유형별로 묶어 신청 금액, 지급 금액, 지급률을 비교합니다.
					</p>

					<!-- 요약 수치 -->
					<div class="statistics-summary">

						<div class="statistics-summary-item">
							<span class="statistics-summary-label">총 신청금액</span>
							<span class="statistics-summary-value">12,840백만원</span>
						</div>

						<div class="statistics-summary-item">
							<span class="statistics-summary-label">총 지급금액</span>
							<span class="statistics-summary-value">9,420백만원</span>
						</div>

						<div class="statistics-summary-item">
							<span class="statistics-summary-label">지급률</span>
							<span class="statistics-summary-value">73.4%</span>
						</div>

					</div>

					<!-- 재해유형별 그래프 -->
					<div class="statistics-chart-wrap">
						<canvas id="disasterStatisticsChart"></canvas>
					</div>

				</section>

			</div>

			<script>
				// 현재는 JSP 화면 확인을 위한 예시 데이터입니다.
				// 추후 Controller에서 DB 집계 결과를 전달받아 이 값만 교체하면 됩니다.
				const disasterLabels = [
					"가뭄",
					"침수",
					"태풍",
					"우박",
					"냉해",
					"대설"
				];

				const requestedAmounts = [
					2150, 2850, 2350, 1420, 1780, 2290
				];

				const paidAmounts = [
					1540, 2100, 1760, 980, 1320, 1720
				];

				new Chart(document.getElementById("disasterStatisticsChart"), {
					type: "bar",

					data: {
						labels: disasterLabels,

						datasets: [
							{
								label: "신청금액(백만원)",
								data: requestedAmounts,
								backgroundColor: "#4285F4",
								barThickness: 18
							},
							{
								label: "지원·보상금액(백만원)",
								data: paidAmounts,
								backgroundColor: "#F04438",
								barThickness: 18
							}
						]
					},

					options: {
						responsive: true,
						maintainAspectRatio: false,

						plugins: {
							legend: {
								position: "bottom",
								labels: {
									boxWidth: 12,
									padding: 18,
									font: { size: 12 }
								}
							},

							tooltip: {
								callbacks: {
									label: function(context) {
										return context.dataset.label + ": "
											+ context.raw.toLocaleString() + "백만원";
									}
								}
							}
						},

						scales: {
							y: {
								beginAtZero: true,
								title: {
									display: true,
									text: "금액(백만원)"
								},
								grid: {
									color: "#e5e5e5"
								}
							},

							x: {
								grid: {
									display: false
								}
							}
						}
					}
				});
			</script>

		</main>
	</div>
</body>
</html>
