<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물 품질 - 보상처리 상세</title>

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU ============= -->
		<aside class="side-menu">

			<div class="side-title">보상처리</div>

			<div class="side-section">

				<div class="side-section-title">보상처리</div>

				<ul class="side-menu-list">
					<li class="active"><a href="${pageContext.request.contextPath}/view/compensationList.jsp">보상처리</a></li>
					<li><a href="#">보상처리 내역</a></li>
				</ul>

			</div>

		</aside>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>보상처리</span> &gt; <span>상세</span>
			</nav>

			<!-- Page Title -->
			<h1 class="page-title">보상처리 상세</h1>

			<!-- ============= 보상 기본정보 (목록 2026-004582 행 기준) ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상 기본정보</h2>

				<table class="detail-table">
					<caption class="sr-only">보상 기본정보</caption>
					<tr>
						<th scope="row">접수번호</th>
						<td>2026-004582</td>
						<th scope="row">처리상태</th>
						<td>보상완료</td>
					</tr>
					<tr>
						<th scope="row">신청일</th>
						<td>2026-09-21</td>
						<th scope="row">처리완료일</th>
						<td>2026-09-26</td>
					</tr>
					<tr>
						<th scope="row">구분</th>
						<td>생산자</td>
						<th scope="row">사건유형</th>
						<td>병해충</td>
					</tr>
					<tr>
						<th scope="row">대표자명</th>
						<td>김현아</td>
						<th scope="row">단체/상호명</th>
						<td>행복농장</td>
					</tr>
					<tr>
						<th scope="row">품목명</th>
						<td>사과</td>
						<th scope="row">관련 사건번호</th>
						<td><a class="case-link" href="${pageContext.request.contextPath}/view/agricultureCaseDetail.jsp?no=INC-2026-000127">INC-2026-000127</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 보상금 정보 (목록에는 없고 상세에서만 표시) ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상금 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">보상금 정보</caption>
					<tr>
						<th scope="row">피해면적</th>
						<td>3,500㎡</td>
						<th scope="row">피해율</th>
						<td>70%</td>
					</tr>
					<tr>
						<th scope="row">보상금액</th>
						<td>12,600,000원</td>
						<th scope="row">지급일</th>
						<td>2026-09-26</td>
					</tr>
					<tr>
						<th scope="row">산정근거</th>
						<td colspan="3">피해면적 3,500㎡ × 단위면적당 보상단가 3,600원 = 12,600,000원</td>
					</tr>
				</table>

			</section>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="${pageContext.request.contextPath}/view/compensationList.jsp">목록</a>
			</div>

		</main>

	</div>

</body>
</html>
