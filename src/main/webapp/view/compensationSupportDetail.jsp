<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 보상처리 지급결과 조회</title>

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
				<span>홈</span> &gt; <span>보상처리 지급결과 조회</span>
			</nav>

			<!-- Page Title (보상에는 별도 번호가 없음, 피해신청번호는 아래 신청 요약에서 링크로) -->
			<h1 class="page-title">보상처리 지급결과 조회</h1>

			<!-- ============= 요약 정보 ============= -->
			<!-- 핵심 화면 모니터링용: 보상 신청 금액과 최종 보상금의 차이, 처리 일수(보상 신청일 ~ 지급일, 부지급은 확정일, 진행 중은 경과일), 지급일은 바로 아래 전체 흐름에서 -->
			<dl class="detail-summary">
				<div>
					<dt>통합 진행상태</dt>
					<dd>지급결과 확인</dd>
				</div>
				<div>
					<dt>보상 신청 금액</dt>
					<dd>9,590,000원</dd>
				</div>
				<div>
					<dt>최종 보상금</dt>
					<dd>6,720,000원</dd>
				</div>
				<div>
					<dt>조치담당자</dt>
					<dd>박민수</dd>
				</div>
				<div>
					<dt>보상 신청부터 지급까지 걸린 기간</dt>
					<dd>9일</dd>
				</div>
			</dl>

			<!-- ============= 처리 흐름 (요약 바로 아래, 같은 피해신청번호의 단계별 날짜) ============= -->
			<div class="flow-here-comp">
				<%@ include file="flow_damage.jsp"%>
			</div>

			<%-- 샘플 데이터: REQ-2026-000136 (김*아 · 행복농장) 보상 신청 9,590,000원 → 산정 6,720,000원(지원율 80%) → 9/30 지급결과 확인 --%>

			<!-- ============= 신청 정보 ============= -->
			<!-- 피해신청 기준 정보: 누구의 무엇인지 식별, 개인농가는 단체/상호명 '-'·대표자 = 신청인 본인 (피해신청번호를 누르면 피해신청 상세, 단계별 날짜는 처리 흐름에서), 신청 주체는 단체/상호명(업체: 생산자·유통자·판매자)와 대표자, 대표자 이름은 가림, 생산지는 그 농산물을 생산한 곳 (생산자 신청이면 단체/상호명와 같음), 서류는 내려받기만 (확인 처리는 피해신청 상세) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해신청 접수 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">피해신청 접수 정보</caption>
					<tr>
						<th scope="row">피해신청번호</th>
						<td><a class="case-link" href="${pageContext.request.contextPath}/view/damageApplyDetail.jsp?no=REQ-2026-000136">REQ-2026-000136</a></td>
						<th scope="row">재해유형 · 품목</th>
						<td>병해충 · 사과</td>
					</tr>
					<tr>
						<th scope="row">단체/상호명</th>
						<td>행복농장 (생산자)</td>
						<th scope="row">대표자</th>
						<td>김*아</td>
					</tr>
					<tr>
						<th scope="row">생산지</th>
						<td colspan="3">행복농장</td>
					</tr>
					<tr>
						<th scope="row">피해신청 관련 서류</th>
						<td colspan="3">피해신청서(피해 접수 내용) <a class="case-link" href="#">내려받기</a> · 농업경영체 등록확인서(생산자 자격 확인) <a class="case-link" href="#">내려받기</a> · 피해 현장 사진(피해 사실 증빙) <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 보상 신청 정보 ============= -->
			<!-- 1차 스프린트는 피해신청자와 보상신청자가 같은 건만 다룬다. 신청 금액·일자·수량 중심으로 표시한다. -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상 신청 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">보상 신청 정보</caption>
					<tr>
						<th scope="row">보상 신청 금액</th>
						<td>9,590,000원</td>
						<th scope="row">보상 신청일</th>
						<td>2026-09-29</td>
					</tr>
					<tr>
						<th scope="row">보상 신청 수량</th>
						<td>1,370kg</td>
						<th scope="row">보상 신청 면적</th>
						<td>3,800㎡</td>
					</tr>
				</table>

			</section>

			<!-- ============= 보상금 산정 정보 ============= -->
			<!-- 지원 기준 정책(재해유형·품목별 단가·지원율)으로 산정한 금액과 근거, 보상 신청 금액과 다르면 조정 사유 기록
		     기준 단가·지원율 = 지원 기준 정책에서 품목·재해유형·산정일로 자동으로 불러온 값 (담당자 수정 불가, 산정 당시 값을 보상 건에 저장)
		     실제 조치 수량 = 보상 신청 수량이 아니라 피해조치 상세 '조치 수행 결과'의 실제 조치 수량 (같은 값, 같은 이름)
		     (표 첫 줄에 colspan 이 있으면 고정 폭 표의 칸 너비가 틀어져서 첫 줄은 두 칸 짝으로) -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상금 산정 근거 및 최종 금액</h2>

				<table class="detail-table">
					<caption class="sr-only">보상금 산정 근거 및 최종 금액</caption>
					<tr>
						<th scope="row">적용한 보상 기준</th>
						<td>○○ 농산물 재해 피해 지원 기준 (제2026-○○호)</td>
						<th scope="row">보상 기준 단가</th>
						<td>7,000원/kg (사과)</td>
					</tr>
					<tr>
						<th scope="row">보상 산정에 반영한 실제 조치 수량</th>
						<td>1,200kg (조치 수행 결과)</td>
						<th scope="row">보상 적용 비율</th>
						<td>80%</td>
					</tr>
					<tr>
						<th scope="row">보상금 산정식</th>
						<td colspan="3">실제 조치 수량 1,200kg × 단가 7,000원 × 지원율 80% = 6,720,000원</td>
					</tr>
					<tr>
						<th scope="row">보상 신청 금액과 산정 금액이 다른 사유</th>
						<td colspan="3">보상 신청 수량 1,370kg 대신 실제 조치 수량 1,200kg에 지원율 80% 적용 (보상 신청 금액 대비 2,870,000원 감액)</td>
					</tr>
					<tr>
						<th scope="row">보상금 산정 기관</th>
						<td>○○도 보상산정기관</td>
						<th scope="row">보상금 산정 담당자</th>
						<td>박민수</td>
					</tr>
					<tr>
						<th scope="row">보상금을 산정한 날짜</th>
						<td colspan="3">2026-09-29</td>
					</tr>
					<tr>
						<th scope="row">최종 보상금</th>
						<td colspan="3"><strong>6,720,000원</strong></td>
					</tr>
					<tr>
						<th scope="row">보상금 산정 결과 문서</th>
						<td colspan="3">보상금 산정 내역서(산정 기준 및 산정식) <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 지급 정보 ============= -->
			<!-- 언제·누가: 결정일(결재 기록은 전자결재에), 지급기관·지급 담당자·지급일 (계좌·명의는 가림)
		     산정 기관과 지급 기관은 업무가 다르면 다른 기관명으로 표시
		     1차 스프린트는 피해신청자와 보상신청자가 같은 건만 표시 -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상금 지급 처리 결과</h2>

				<table class="detail-table">
					<caption class="sr-only">보상금 지급 처리 결과</caption>
					<tr>
						<th scope="row">보상금 지급 확정일</th>
						<td>2026-09-29</td>
						<th scope="row">보상금 지급일</th>
						<td>2026-09-30</td>
					</tr>
					<tr>
						<th scope="row">보상금 지급 기관</th>
						<td>○○도 보상지급기관</td>
						<th scope="row">보상금 지급 담당자</th>
						<td>한소영</td>
					</tr>
					<tr>
						<th scope="row">보상금 수령인</th>
						<td colspan="3">김*아</td>
					</tr>
					<tr>
						<th scope="row">보상금 입금 계좌</th>
						<td colspan="3">○○은행 ***-**-1234 (김*아)</td>
					</tr>
					<tr>
						<th scope="row">보상금 지급 결과 문서</th>
						<td colspan="3">지급 결정 통지서(지급 결정 결과 통보) <a class="case-link" href="#">내려받기</a></td>
					</tr>
					<%-- 지급 제외 건일 때만 표시 (사유 코드: P01 조치 수행 증빙 미제출 / P02 지원 기준 미해당 / P03 다른 보상과 중복 / P04 지원 한도 초과)
					<tr>
						<th scope="row">지급 제외 사유</th>
						<td colspan="3">조치 수행 증빙 미제출 (P01)</td>
					</tr>
					--%>
				</table>

			</section>

			<!-- ============= 관련 서류 (여러 건) ============= -->
			<!-- 첨부서류 중 서류구분 보상(COMP), 신청인이 제출한 확인 대상 서류, 최신이 위 -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상 신청 제출 서류 확인 현황</h2>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">보상 신청 제출 서류 확인 현황</caption>
						<thead>
							<tr>
								<th scope="col">서류명</th>
								<th scope="col">제출처</th>
								<th scope="col">제출일</th>
								<th scope="col">서류 확인 상태</th>
								<th scope="col">서류 확인일</th>
								<th scope="col">서류 확인자</th>
								<th scope="col">첨부파일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cell-text">통장 사본(수령 계좌 확인)</td>
								<td>신청인</td>
								<td>2026-09-21</td>
								<td>서류 확인 완료</td>
								<td>2026-09-22</td>
								<td>박민수</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
							<tr>
								<td class="cell-text">보상금 지급 요청서(보상금 지급 요청 근거)</td>
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

			<!-- ============= 조치 요약 ============= -->
			<!-- 보상금 산정의 근거가 되는 피해조치 상세의 조치 수행 결과 (실제 조치 수량 = 산정 정보의 실제 조치 수량) -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상금 산정에 사용한 조치 수행 결과 요약</h2>

				<table class="detail-table">
					<caption class="sr-only">보상금 산정에 사용한 조치 수행 결과 요약</caption>
					<tr>
						<th scope="row">조치 방법</th>
						<td>폐기</td>
						<th scope="row">조치 계획 내용</th>
						<td>피해 과실 전량 수거 후 매몰 폐기</td>
					</tr>
					<tr>
						<th scope="row">실제 조치 수량</th>
						<td>1,200kg</td>
						<th scope="row">조치 결과 확인일</th>
						<td>2026-09-28</td>
					</tr>
				</table>

			</section>

			<!-- ============= 조사 요약 ============= -->
			<!-- 조치·보상 판단의 근거가 되는 최종 조사 결과 -->
			<section class="detail-section">

				<h2 class="detail-section-title">보상금 산정에 사용한 현장조사 결과 요약</h2>

				<table class="detail-table">
					<caption class="sr-only">보상금 산정에 사용한 현장조사 결과 요약</caption>
					<tr>
						<th scope="row">현장조사 완료일</th>
						<td>2026-09-24</td>
						<th scope="row">최종 반영 조사차수</th>
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
