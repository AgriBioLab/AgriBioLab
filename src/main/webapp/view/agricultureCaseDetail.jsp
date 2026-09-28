<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>농산물 품질 - 농산물 사건상세</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 헤더 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<!-- 사이드 메뉴 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidemenu.css">

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU ============= -->
		<aside class="side-menu">

			<div class="side-title">농산물 사건</div>

			<div class="side-section"></div>

		</aside>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<div class="breadcrumb">
				<span>홈</span> &gt; <span>농산물 사건</span> &gt; <span>상세</span>
			</div>

			<!-- Page Title -->
			<h1 class="detail-title">농산물 사건상세</h1>

			<!-- ============= 사건기본정보 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">사건기본정보</h2>

				<table class="detail-table">
					<tr>
						<th>사건번호</th>
						<td>INC-2026-000128</td>
						<th>사건상태</th>
						<td>조사중</td>
					</tr>
					<tr>
						<th>발생일</th>
						<td>2026-09-22</td>
						<th>사건 등록일</th>
						<td>2026-09-23</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>생산자</td>
						<th>사건유형</th>
						<td>가뭄</td>
					</tr>
					<tr>
						<th>대표자명</th>
						<td>박연자</td>
						<th>단체/상호명</th>
						<td>동동농업협동조합</td>
					</tr>
					<tr>
						<th>품목</th>
						<td>복숭아</td>
						<th>재배지역</th>
						<td>인천</td>
					</tr>
					<tr>
						<th>농산물 이력번호</th>
						<td colspan="3">TR-2026-004819</td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해 조사정보 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해 조사정보</h2>

				<table class="detail-table">
					<tr>
						<th>조사 담당자</th>
						<td>박민수</td>
						<th>조사일</th>
						<td>2026-09-24</td>
					</tr>
					<tr>
						<th>피해원인</th>
						<td>가뭄</td>
						<th>피해율</th>
						<td>산정 중</td>
					</tr>
					<tr>
						<th>재배면적</th>
						<td>5,000㎡</td>
						<th>피해면적</th>
						<td>조사 중</td>
					</tr>
					<tr>
						<th>피해내용</th>
						<td colspan="3">장기간 가뭄으로 과실 비대가 불량하고 낙과가 발생함</td>
					</tr>
					<tr>
						<th>현장조사결과</th>
						<td colspan="3">현장조사 진행 중 (조사 완료 후 입력)</td>
					</tr>
				</table>

			</section>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn"
					href="${pageContext.request.contextPath}/view/agricultureCaseList.jsp?offset=0&limit=10">목록</a>
			</div>

		</main>

	</div>

</body>
</html>
