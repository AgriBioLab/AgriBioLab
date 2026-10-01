<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 등록된 재해 정보와 현장조사 결과 조회</title>

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
				<span>홈</span> &gt; <span>등록된 재해 정보와 현장조사 결과 조회</span>
			</nav>

			<!-- Page Title -->
			<h1 class="page-title">등록된 재해 정보와 현장조사 결과 조회</h1>

			<!-- ============= 생산자가 피해신청에 선택할 재해 정보 ============= -->
			<!-- 등록된 재해 정보 (재해유형·품목·재배지역은 생산자가 피해신청할 때 여기서 가져옴) -->
			<section class="detail-section">

				<h2 class="detail-section-title">생산자가 피해신청에 선택할 재해 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">생산자가 피해신청에 선택할 재해 정보</caption>
					<tr>
						<th scope="row">재해정보번호</th>
						<td>INC-2026-000128</td>
						<th scope="row">재해 조사 진행상태</th>
						<td>조사중</td>
					</tr>
					<tr>
						<th scope="row">재해유형</th>
						<td>가뭄</td>
						<th scope="row">품목</th>
						<td>복숭아</td>
					</tr>
					<tr>
						<th scope="row">재해 발생 지역</th>
						<td>인천</td>
						<th scope="row">재해 등록일</th>
						<td>2026-09-23</td>
					</tr>
				</table>

			</section>

			<!-- ============= 이 재해에 연결된 피해신청 정보 ============= -->
			<!-- 신청자 정보 (1차: 생산자 / 추후 유통자·판매자). 단체/상호명·생산지는 생산자 정보 -->
			<section class="detail-section">

				<h2 class="detail-section-title">이 재해에 연결된 피해신청 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">이 재해에 연결된 피해신청 정보</caption>
					<tr>
						<th scope="row">피해신청 접수일</th>
						<td>2026-09-22</td>
						<th scope="row">구분</th>
						<td>생산자</td>
					</tr>
					<tr>
						<th scope="row">대표자명</th>
						<td>박연자</td>
						<th scope="row">단체/상호명</th>
						<td>동동농업협동조합</td>
					</tr>
					<tr>
						<th scope="row">생산지</th>
						<td>동동과수원</td>
						<th scope="row">농산물 이력번호</th>
						<td>TR-2026-004819</td>
					</tr>
				</table>

			</section>

			<!-- ============= 재해 피해 현장조사 결과 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">재해 피해 현장조사 결과</h2>

				<table class="detail-table">
					<caption class="sr-only">재해 피해 현장조사 결과</caption>
					<tr>
						<th scope="row">조사자</th>
						<td>박민수</td>
						<th scope="row">현장조사일</th>
						<td>2026-09-24</td>
					</tr>
					<tr>
						<th scope="row">현장에서 확인한 피해원인</th>
						<td>가뭄</td>
						<th scope="row">현장에서 확인한 피해율</th>
						<td>피해율 계산 중</td>
					</tr>
					<tr>
						<th scope="row">재배면적</th>
						<td>5,000㎡</td>
						<th scope="row">현장에서 확인한 피해면적</th>
						<td>조사 중</td>
					</tr>
					<tr>
						<th scope="row">현장에서 확인한 피해내용</th>
						<td colspan="3">장기간 가뭄으로 과실 비대가 불량하고 낙과가 발생함</td>
					</tr>
					<tr>
						<th scope="row">현장조사 종합의견</th>
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
