<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물 품질 - 농산물 사건상세</title>

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_agricultureCase.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>농산물 사건</span> &gt; <span>상세</span>
			</nav>

			<!-- Page Title -->
			<h1 class="page-title">농산물 사건상세</h1>

			<!-- ============= 사건기본정보 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">사건기본정보</h2>

				<table class="detail-table">
					<caption class="sr-only">사건기본정보</caption>
					<tr>
						<th scope="row">사건번호</th>
						<td>INC-2026-000128</td>
						<th scope="row">사건상태</th>
						<td>조사중</td>
					</tr>
					<tr>
						<th scope="row">발생일</th>
						<td>2026-09-22</td>
						<th scope="row">사건 등록일</th>
						<td>2026-09-23</td>
					</tr>
					<tr>
						<th scope="row">구분</th>
						<td>생산자</td>
						<th scope="row">사건유형</th>
						<td>가뭄</td>
					</tr>
					<tr>
						<th scope="row">대표자명</th>
						<td>박연자</td>
						<th scope="row">단체/상호명</th>
						<td>동동농업협동조합</td>
					</tr>
					<tr>
						<th scope="row">품목명</th>
						<td>복숭아</td>
						<th scope="row">재배지역</th>
						<td>인천</td>
					</tr>
					<tr>
						<th scope="row">농산물 이력번호</th>
						<td colspan="3">TR-2026-004819</td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해 조사정보 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해 조사정보</h2>

				<table class="detail-table">
					<caption class="sr-only">피해 조사정보</caption>
					<tr>
						<th scope="row">조사 담당자</th>
						<td>박민수</td>
						<th scope="row">조사일</th>
						<td>2026-09-24</td>
					</tr>
					<tr>
						<th scope="row">피해원인</th>
						<td>가뭄</td>
						<th scope="row">피해율</th>
						<td>산정 중</td>
					</tr>
					<tr>
						<th scope="row">재배면적</th>
						<td>5,000㎡</td>
						<th scope="row">피해면적</th>
						<td>조사 중</td>
					</tr>
					<tr>
						<th scope="row">피해내용</th>
						<td colspan="3">장기간 가뭄으로 과실 비대가 불량하고 낙과가 발생함</td>
					</tr>
					<tr>
						<th scope="row">현장조사결과</th>
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
