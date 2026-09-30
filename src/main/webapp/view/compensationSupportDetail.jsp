<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 보상처리 상세</title>

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_compensationSupport.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>보상처리</span> &gt; <span>상세</span>
			</nav>

			<!-- Page Title (보상에는 별도 번호가 없음, 피해신청번호는 아래 신청 요약에서 링크로) -->
			<h1 class="page-title">보상처리 상세</h1>

			<!-- ============= 처리 흐름 (신청 → 조사 → 조치 → 보상, 같은 피해신청번호) ============= -->
			<div class="flow-here-comp">
				<%@ include file="flow_damage.jsp"%>
			</div>

			<!-- ============= 요약 정보 ============= -->
			<!-- 핵심 화면 모니터링용: 보상이 어디까지 왔고 얼마가 언제 지급됐나, 처리 일수 = 신청일 ~ 지급일(부지급은 결정일, 진행 중이면 오늘까지 경과일) -->
			<dl class="detail-summary">
				<div>
					<dt>보상상태</dt>
					<dd>지급완료</dd>
				</div>
				<div>
					<dt>보상금액</dt>
					<dd>8,400,000원</dd>
				</div>
				<div>
					<dt>지급일</dt>
					<dd>2026-09-30</dd>
				</div>
				<div>
					<dt>처리 담당자</dt>
					<dd>박민수</dd>
				</div>
				<div>
					<dt>처리 일수</dt>
					<dd>9일</dd>
				</div>
			</dl>

			<%-- 샘플 데이터: REQ-2026-000136 (김*아 · 행복농장) 조치완료 → 보상 지급완료 --%>

			<!-- ============= 대상 정보 ============= -->
			<!-- 누구의 무엇인지 식별 (신청일·신청 상세 이동은 처리 흐름에서), 신청자 이름은 가림, 서류는 내려받기만 (확인 처리는 피해신청 상세) -->
			<section class="detail-section">

				<h2 class="detail-section-title">대상 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">대상 정보</caption>
					<tr>
						<th scope="row">피해신청번호</th>
						<td>REQ-2026-000136</td>
						<th scope="row">재해유형 · 품목</th>
						<td>병해충 · 사과</td>
					</tr>
					<tr>
						<th scope="row">신청자 · 농장</th>
						<td colspan="3">김*아 · 행복농장</td>
					</tr>
					<tr>
						<th scope="row">신청 서류</th>
						<td colspan="3">농업경영체 등록확인서 <a class="case-link" href="#">내려받기</a> · 피해신청서 <a class="case-link" href="#">내려받기</a> · 피해 현장 사진 <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 보상금 정보 ============= -->
			<!-- 누가·언제: 결정자·지급결정일, 지급 처리자·지급일 (계좌는 가려서 표시) -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상금 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">보상금 정보</caption>
					<tr>
						<th scope="row">보상 대상 수량</th>
						<td>1,200kg</td>
						<th scope="row">단가</th>
						<td>7,000원/kg</td>
					</tr>
					<tr>
						<th scope="row">보상금액</th>
						<td>8,400,000원</td>
						<th scope="row">지급 계좌</th>
						<td>○○은행 ***-**-1234 (김*아)</td>
					</tr>
					<tr>
						<th scope="row">산정근거</th>
						<td colspan="3">폐기 수량 1,200kg × 단가 7,000원 = 8,400,000원</td>
					</tr>
					<tr>
						<th scope="row">결정자</th>
						<td>박민수</td>
						<th scope="row">지급결정일</th>
						<td>2026-09-29</td>
					</tr>
					<tr>
						<th scope="row">지급 처리자</th>
						<td>박민수</td>
						<th scope="row">지급일</th>
						<td>2026-09-30</td>
					</tr>
					<%-- 보상상태가 부지급일 때만 표시
					<tr>
						<th scope="row">부지급 사유</th>
						<td colspan="3">조치 이행 확인 불가 - 폐기 증빙 미제출</td>
					</tr>
					--%>
				</table>

			</section>

			<!-- ============= 조치 요약 ============= -->
			<!-- 보상 산정의 근거가 되는 조치 결과 (자세한 내용은 처리 흐름의 '조치 완료'에서) -->
			<section class="detail-section">

				<h2 class="detail-section-title">조치 요약</h2>

				<table class="detail-table">
					<caption class="sr-only">조치 요약</caption>
					<tr>
						<th scope="row">조치유형</th>
						<td>폐기</td>
						<th scope="row">조치 종결일</th>
						<td>2026-09-28</td>
					</tr>
					<tr>
						<th scope="row">조치 대상 수량</th>
						<td>1,200kg</td>
						<th scope="row">조치 대상 면적</th>
						<td>3,500㎡</td>
					</tr>
				</table>

			</section>

			<!-- ============= 조사 요약 ============= -->
			<!-- 조치·보상 판단의 근거가 되는 최종 조사 결과 -->
			<section class="detail-section">

				<h2 class="detail-section-title">조사 요약</h2>

				<table class="detail-table">
					<caption class="sr-only">조사 요약</caption>
					<tr>
						<th scope="row">조사완료일</th>
						<td>2026-09-24</td>
						<th scope="row">조사 차수</th>
						<td>2차</td>
					</tr>
					<tr>
						<th scope="row">최종 피해율</th>
						<td>70%</td>
						<th scope="row">최종 피해면적</th>
						<td>3,500㎡</td>
					</tr>
				</table>

			</section>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="${pageContext.request.contextPath}/view/compensationSupportList.jsp">목록</a>
			</div>

		</main>

	</div>

</body>
</html>
