<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 마이페이지</title>

<!-- 상세 CSS (정보표) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_myPage.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>마이페이지</span> &gt; <span>내 정보</span>
			</nav>

			<!-- Page Title -->
			<h1 class="page-title">내 정보</h1>

			<!-- ============= 기본 정보 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">기본 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">기본 정보</caption>
					<tr>
						<th scope="row">성명</th>
						<td>이*규</td>
						<th scope="row">아이디</th>
						<td>qm_lee***</td>
					</tr>
					<tr>
						<th scope="row">소속</th>
						<td>○○기관 농산물품질과</td>
						<th scope="row">직급</th>
						<td>주무관</td>
					</tr>
					<tr>
						<th scope="row">담당 업무</th>
						<td colspan="3">피해신청 조사·조치 관리</td>
					</tr>
					<tr>
						<th scope="row">사무실 전화</th>
						<td>044-***-1234</td>
						<th scope="row">이메일</th>
						<td>l***@example.com</td>
					</tr>
				</table>

			</section>

			<!-- ============= 권한 정보 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">권한 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">권한 정보</caption>
					<tr>
						<th scope="row">권한</th>
						<td>피해조치담당자</td>
						<th scope="row">권한 부여일</th>
						<td>2026-03-02</td>
					</tr>
					<tr>
						<th scope="row">사용 메뉴</th>
						<td colspan="3">통계, 피해신청</td>
					</tr>
					<tr>
						<th scope="row">담당 지역</th>
						<td colspan="3">○○도</td>
					</tr>
				</table>

			</section>

			<!-- ============= 계정·보안 ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">계정·보안</h2>

				<table class="detail-table">
					<caption class="sr-only">계정·보안</caption>
					<tr>
						<th scope="row">최근 로그인</th>
						<td>2026-09-29 09:12</td>
						<th scope="row">접속 IP</th>
						<td>10.***.***.23</td>
					</tr>
					<tr>
						<th scope="row">비밀번호 변경일</th>
						<td>2026-07-01</td>
						<th scope="row">다음 변경 예정일</th>
						<td>2026-09-29</td>
					</tr>
					<tr>
						<th scope="row">계정 상태</th>
						<td colspan="3">정상</td>
					</tr>
				</table>

			</section>

			<!-- ============= 안내 (섹션 간격을 상세 화면과 같게 하려고 맨 아래에 모음) ============= -->
			<ul class="detail-notes">
				<li>개인정보 보호를 위해 이름·연락처·이메일·IP 일부를 가려서 표시합니다.</li>
				<li>소속·직급 등 인사 정보는 인사 시스템과 연계되어 있어 이 화면에서 수정할 수 없습니다.</li>
			</ul>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="#">비밀번호 변경</a>
			</div>

		</main>

	</div>

</body>
</html>
