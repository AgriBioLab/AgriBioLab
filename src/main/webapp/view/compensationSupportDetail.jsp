<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 보상처리 상세</title>

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<!-- 목록 표 CSS (관련 서류처럼 여러 건인 정보) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body class="menu-comp">

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

			<!-- ============= 요약 정보 ============= -->
			<!-- 핵심 화면 모니터링용: 청구액과 최종 산정액의 차이, 처리 일수(신청일 ~ 지급일, 부지급은 결정일, 진행 중은 경과일), 지급일은 바로 아래 처리 흐름에서 -->
			<dl class="detail-summary">
				<div>
					<dt>보상상태</dt>
					<dd>지급완료</dd>
				</div>
				<div>
					<dt>청구액</dt>
					<dd>9,590,000원</dd>
				</div>
				<div>
					<dt>최종 산정액</dt>
					<dd>6,720,000원</dd>
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

			<!-- ============= 처리 흐름 (요약 바로 아래, 같은 피해신청번호의 단계별 날짜) ============= -->
			<div class="flow-here-comp">
				<%@ include file="flow_damage.jsp"%>
			</div>

			<%-- 샘플 데이터: REQ-2026-000136 (김*아 · 행복농장) 청구 9,590,000원 → 산정 6,720,000원(지원율 80%) → 9/30 지급완료 --%>

			<!-- ============= 대상 정보 ============= -->
			<!-- 누구의 무엇인지 식별 (피해신청번호를 누르면 피해신청 상세, 단계별 날짜는 처리 흐름에서), 신청 주체는 상호(업체: 생산자·유통자·판매자)와 대표자, 대표자 이름은 가림, 생산 농장은 그 농산물을 생산한 곳 (생산자 신청이면 상호와 같음), 서류는 내려받기만 (확인 처리는 피해신청 상세) -->
			<section class="detail-section">

				<h2 class="detail-section-title">대상 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">대상 정보</caption>
					<tr>
						<th scope="row">피해신청번호</th>
						<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
						<th scope="row">재해유형 · 품목</th>
						<td>병해충 · 사과</td>
					</tr>
					<tr>
						<th scope="row">상호</th>
						<td>행복농장 (생산자)</td>
						<th scope="row">대표자</th>
						<td>김*아</td>
					</tr>
					<tr>
						<th scope="row">생산 농장</th>
						<td colspan="3">행복농장 (신청 업체와 같음)</td>
					</tr>
					<tr>
						<th scope="row">신청 서류</th>
						<td colspan="3">농업경영체 등록확인서 <a class="case-link" href="#">내려받기</a> · 피해신청서 <a class="case-link" href="#">내려받기</a> · 피해 현장 사진 <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 청구 정보 ============= -->
			<!-- 생산자가 피해신청 때 청구한 내용 (보상의 출발점) -->
			<section class="detail-section">

				<h2 class="detail-section-title">청구 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">청구 정보</caption>
					<tr>
						<th scope="row">청구 금액</th>
						<td>9,590,000원</td>
						<th scope="row">청구일</th>
						<td>2026-09-21</td>
					</tr>
					<tr>
						<th scope="row">청구 수량</th>
						<td>1,370kg</td>
						<th scope="row">청구 면적</th>
						<td>3,800㎡</td>
					</tr>
				</table>

			</section>

			<!-- ============= 산정 정보 ============= -->
			<!-- 지원 기준 정책(재해유형·품목별 단가·지원율)으로 계산한 금액과 근거, 청구와 다르면 조정 사유 기록
		     확인 수량 = 청구 수량이 아니라 조치 이행 확인에서 실제로 확인된 수량 (출처와 기준일을 괄호로)
		     (표 첫 줄에 colspan 이 있으면 고정 폭 표의 칸 너비가 틀어져서 첫 줄은 두 칸 짝으로) -->
			<section class="detail-section">

				<h2 class="detail-section-title">산정 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">산정 정보</caption>
					<tr>
						<th scope="row">적용 기준</th>
						<td>○○ 농산물 재해 피해 지원 기준 (제2026-○○호)</td>
						<th scope="row">품목 단가</th>
						<td>7,000원/kg (사과)</td>
					</tr>
					<tr>
						<th scope="row">확인 수량</th>
						<td>1,200kg (이행 확인 2026-09-28 기준)</td>
						<th scope="row">지원율</th>
						<td>80%</td>
					</tr>
					<tr>
						<th scope="row">산정식</th>
						<td colspan="3">확인 수량 1,200kg × 단가 7,000원 × 지원율 80% = 6,720,000원</td>
					</tr>
					<tr>
						<th scope="row">조정 사유</th>
						<td colspan="3">청구 수량 1,370kg 중 폐기 이행이 확인된 1,200kg에 지원율 80% 적용 (청구 대비 2,870,000원 감액)</td>
					</tr>
					<tr>
						<th scope="row">산정자</th>
						<td>박민수</td>
						<th scope="row">산정일</th>
						<td>2026-09-29</td>
					</tr>
					<tr>
						<th scope="row">산정 기관</th>
						<td colspan="3">○○시 농업정책과</td>
					</tr>
					<tr>
						<th scope="row">최종 산정액</th>
						<td colspan="3"><strong>6,720,000원</strong></td>
					</tr>
				</table>

			</section>

			<!-- ============= 지급 정보 ============= -->
			<!-- 누가·언제: 결정자·지급결정일, 지급 처리자·지급일 (계좌·명의는 가림)
		     산정 기관과 지급 기관은 같을 수도 다를 수도 있음 (샘플: 산정은 ○○시 농업정책과 박민수, 지급은 ○○도 농업재해지원팀 한소영)
		     직무 분리: 산정(처리 담당자) → 지급 결정(결재권자, 팀장) → 지급 처리(지급 기관 담당자)
		     수령인은 신청자와 다를 수 있음 (임차농·소유주, 법인 대표, 대리인, 상속인) → 신청자와의 관계를 함께 표시 -->
			<section class="detail-section">

				<h2 class="detail-section-title">지급 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">지급 정보</caption>
					<tr>
						<th scope="row">지급 기관</th>
						<td>○○도 농업재해지원팀</td>
						<th scope="row">수령인</th>
						<td>김*아 (대표자 본인)</td>
					</tr>
					<tr>
						<th scope="row">결정자</th>
						<td>정우진 (팀장)</td>
						<th scope="row">지급결정일</th>
						<td>2026-09-29</td>
					</tr>
					<tr>
						<th scope="row">지급 처리자</th>
						<td>한소영</td>
						<th scope="row">지급일</th>
						<td>2026-09-30</td>
					</tr>
					<tr>
						<th scope="row">지급 계좌</th>
						<td colspan="3">○○은행 ***-**-1234 (김*아)</td>
					</tr>
					<%-- 보상상태가 부지급일 때만 표시 (사유 코드: P01 이행 증빙 미제출 / P02 지원 기준 미해당 / P03 다른 보상과 중복 / P04 지원 한도 초과)
					<tr>
						<th scope="row">부지급 사유</th>
						<td colspan="3">조치 이행 증빙 미제출 (P01)</td>
					</tr>
					--%>
				</table>

			</section>

			<!-- ============= 관련 서류 (여러 건) ============= -->
			<!-- 첨부서류 중 서류구분 보상(COMP), 최신이 위, 기관 발급 서류는 확인 대상이 아니라 '-' -->
			<section class="detail-section">

				<h2 class="detail-section-title">관련 서류</h2>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">관련 서류</caption>
						<thead>
							<tr>
								<th scope="col">서류명</th>
								<th scope="col">제출기관</th>
								<th scope="col">제출일</th>
								<th scope="col">확인상태</th>
								<th scope="col">확인일</th>
								<th scope="col">확인자</th>
								<th scope="col">첨부파일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cell-text">지급 결정 통지서</td>
								<td>○○기관 발급</td>
								<td>2026-09-29</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
							<tr>
								<td class="cell-text">통장 사본</td>
								<td>신청자 제출</td>
								<td>2026-09-21</td>
								<td>확인</td>
								<td>2026-09-22</td>
								<td>박민수</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
							<tr>
								<td class="cell-text">보상금 청구서</td>
								<td>신청자 제출</td>
								<td>2026-09-21</td>
								<td>확인</td>
								<td>2026-09-22</td>
								<td>박민수</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
						</tbody>
					</table>
				</div>

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
