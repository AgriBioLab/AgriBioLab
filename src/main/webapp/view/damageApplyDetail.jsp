<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 피해신청 처리상태 조회</title>

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<!-- 목록 표 CSS (제출서류처럼 여러 건인 정보) -->
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

			<!-- Page Title + 이 상세의 번호 (피해신청번호 = 신청·조치 화면 공통 조회 키) -->
			<div class="detail-head">
				<h1 class="page-title">피해신청 처리상태 조회</h1>
				<p class="detail-no">피해신청번호 <strong>REQ-2026-000136</strong></p>
			</div>

			<!-- ============= 요약 정보 ============= -->
			<!-- 신청 요약 (신청일 등 단계별 날짜는 바로 아래 처리 흐름에서) -->
			<dl class="detail-summary">
				<div>
					<dt>통합 진행상태</dt>
					<dd>지급결과 확인</dd>
				</div>
				<div>
					<dt>재해유형</dt>
					<dd>병해충</dd>
				</div>
				<div>
					<dt>품목</dt>
					<dd>사과</dd>
				</div>
			</dl>

			<!-- ============= 처리 흐름 (요약 바로 아래, 같은 피해신청번호의 단계별 날짜) ============= -->
			<div class="flow-here-apply">
				<%@ include file="flow_damage.jsp"%>
			</div>

			<%-- 샘플 데이터: 생산자 본인이 신청한 REQ-2026-000136 1건 (목록의 어느 번호를 눌러도 이 화면, MVC2 전환 시 번호로 조회) --%>

			<!-- ============= 피해신청 접수 정보 ============= -->
			<!-- 피해신청번호는 제목 오른쪽 위에 표시, 개인농가는 단체/상호명 '-'·대표자명 = 신청인 본인, 신청 주체 = 단체/상호명 + 대표자 (대표자·생산자 이름은 가림, 직원 이름은 실명) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해신청 접수 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">피해신청 접수 정보</caption>
					<tr>
						<th scope="row">통합 진행상태</th>
						<td>지급결과 확인</td>
						<th scope="row">피해신청 접수일</th>
						<td>2026-09-21</td>
					</tr>
					<tr>
						<th scope="row">단체/상호명</th>
						<td>행복농장</td>
						<th scope="row">구분</th>
						<td>생산자</td>
					</tr>
					<tr>
						<th scope="row">대표자명</th>
						<td colspan="3">김*아</td>
					</tr>
					<%-- 신청 또는 조사 단계에서 종결된 건일 때만 사유를 표시
					<tr>
						<th scope="row">사유</th>
						<td colspan="3">보완 기한 내 미보완 (R01) - 2026-09-30까지 농업경영체 등록확인서 미제출</td>
					</tr>
					<tr>
						<th scope="row">결정일</th>
						<td colspan="3">2026-10-01</td>
					</tr>
					--%>
				</table>

			</section>

			<!-- ============= 피해신청에 연결된 재해 정보 ============= -->
			<!-- 생산자가 신청할 때 등록된 재해를 우편번호 찾기처럼 골라 불러옴 → 신청에는 재해정보_일련번호만 저장
		     재해 1건 = 품목 1개 (여러 품목이면 품목별로 재해를 따로 등록), 재해유형·품목·발생지역은 코드 → 이름으로 표시
		     담당자 확인용: 발생 지역 ↔ 생산지 주소, 발생일 ↔ 신청일 (농산물 재해 메뉴를 다시 살리면 재해정보번호에 링크 연결) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해신청에 연결된 재해 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">피해신청에 연결된 재해 정보</caption>
					<tr>
						<th scope="row">재해정보번호</th>
						<td>DIS-2026-000127</td>
						<th scope="row">재해유형</th>
						<td>병해충</td>
					</tr>
					<tr>
						<th scope="row">품목</th>
						<td>사과</td>
						<th scope="row">재해 발생일</th>
						<td>2026-09-15</td>
					</tr>
					<tr>
						<th scope="row">재해 발생 지역</th>
						<td colspan="3">경상북도 영주시 풍기읍</td>
					</tr>
				</table>

			</section>

			<!-- ============= 생산자 및 생산지 정보 ============= -->
			<%-- 생산자정보_일련번호로 연결 (조회용 키라 화면에는 표시하지 않음) --%>
			<section class="detail-section">

				<h2 class="detail-section-title">생산자 및 생산지 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">생산자 및 생산지 정보</caption>
					<tr>
						<th scope="row">생산자명</th>
						<td>김*아</td>
						<th scope="row">생산지</th>
						<td>행복농장</td>
					</tr>
					<tr>
						<th scope="row">재배면적</th>
						<td>5,000㎡</td>
						<th scope="row">생산지 주소</th>
						<td>경상북도 영주시 풍기읍 ○○로 123</td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해신청 제출·확인 서류 (여러 건) ============= -->
			<!-- 첨부서류 중 서류구분 = 신청(APPLY), 생산자가 제출 → 담당자가 확인 (확인자·확인일을 짝으로 기록, 미확인이면 '-', 최신 제출이 위) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해신청 제출·확인 서류</h2>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">피해신청 제출·확인 서류</caption>
						<thead>
							<tr>
								<th scope="col">서류명</th>
								<th scope="col">제출처</th>
								<th scope="col">제출일</th>
								<th scope="col">서류 확인상태</th>
								<th scope="col">서류 확인일</th>
								<th scope="col">서류 확인자</th>
								<th scope="col">첨부파일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cell-text">농업경영체 등록확인서(생산자 자격 확인)</td>
								<td>신청인</td>
								<td>2026-09-23</td>
								<td>서류 확인 완료</td>
								<td>2026-09-23</td>
								<td>박민수</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
							<tr>
								<td class="cell-text">피해신청서(피해 접수 내용)</td>
								<td>신청인</td>
								<td>2026-09-21</td>
								<td>서류 확인 완료</td>
								<td>2026-09-22</td>
								<td>박민수</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
							<tr>
								<td class="cell-text">피해 현장 사진(피해 사실 증빙)</td>
								<td>신청인</td>
								<td>2026-09-21</td>
								<td>서류 확인 완료</td>
								<td>2026-09-22</td>
								<td>박민수</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
						</tbody>
					</table>
				</div>

			</section>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="${pageContext.request.contextPath}/view/damageApplyList.jsp">목록</a>
			</div>

		</main>

	</div>

</body>
</html>
