<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 피해조치 진행상태 및 수행 결과 조회</title>

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<!-- 목록 표 CSS (현장조사처럼 여러 건인 정보) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body class="menu-action">

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_caseAction.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>피해조치 진행상태 및 수행 결과 조회</span>
			</nav>

			<!-- Page Title (조치에는 별도 번호가 없음, 피해신청번호는 아래 신청 요약에서 링크로) -->
			<h1 class="page-title">피해조치 진행상태 및 수행 결과 조회</h1>

			<!-- ============= 요약 정보 ============= -->
			<!-- 조치 단계 요약 (단계별 날짜는 바로 아래 처리 흐름에서, 전체 처리 일수는 보상처리 상세에서)
			     조치상태 = 피해조치 업무의 상태 (피해신청 목록·통계의 진행상태와 같은 코드값)
			     조치 완료 요청기한 = 이 날까지 조치를 끝내야 하는 날 (조치 방법 확정일과 합치지 않음) -->
			<dl class="detail-summary">
				<div>
					<dt>피해조치 진행상태</dt>
					<dd>조치 수행 및 결과 확인 완료</dd>
				</div>
				<div>
					<dt>조치담당자</dt>
					<dd>박민수</dd>
				</div>
				<div>
					<dt>조치 방법</dt>
					<dd>폐기</dd>
				</div>
				<div>
					<dt>조치 완료 요청기한</dt>
					<dd>2026-09-27</dd>
				</div>
			</dl>

			<!-- ============= 처리 흐름 (요약 바로 아래, 같은 피해신청번호의 단계별 날짜) ============= -->
			<!-- 피해조치 전용 흐름 (보상 지급은 별도 업무라 넣지 않음) -->
			<div class="flow-here-action">
				<%@ include file="flow_action.jsp"%>
			</div>

			<%-- 샘플 데이터: 생산자 본인이 신청한 REQ-2026-000136 1건 (목록의 어느 번호를 눌러도 이 화면, MVC2 전환 시 번호로 조회)
			     조치 수행 및 결과 확인 완료 = 대상자가 확정된 조치를 수행하고 담당자가 결과와 증빙까지 확인한 상태
			     날짜 흐름: 발생 9/15 → 신청 9/21 → 서류 확인 9/22~23 → 조사 9/22·9/24 → 조치 방법 확정 9/24 → 조치 완료 요청기한 9/27 → 조치 수행 9/27 → 결과 확인 9/28
			     화면 순서 = 품질담당자 조회 관점의 두괄식 순서 (신청 → 조치 수행 → 조치 계획 → 현장조사), 여러 건인 현장조사 표 안에서만 최신 차수가 위 --%>

			<!-- ============= 품질담당자 검토 요약 ============= -->
			<!-- 품질담당자가 상세 근거를 보기 전에 조치 결과와 보상금 계산에 필요한 핵심 판단을 먼저 확인 -->
			<section class="detail-section">

				<h2 class="detail-section-title">품질담당자 검토 요약</h2>

				<table class="detail-table">
					<caption class="sr-only">품질담당자 검토 요약</caption>
					<tr>
						<th scope="row">피해조치 진행상태</th>
						<td>조치 수행 및 결과 확인 완료</td>
						<th scope="row">품질담당자 검토 결과</th>
						<td>폐기 수행 및 증빙 검토 완료</td>
					</tr>
					<tr>
						<th scope="row">보상금 계산에 사용할 기준</th>
						<td>실제 조치 수량 1,200kg</td>
						<th scope="row">먼저 확인해야 할 근거 문서</th>
						<td>폐기확인서, 2차 현장조사 보고서</td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해신청 접수 정보 ============= -->
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

			<!-- ============= 실제 조치 수행 결과 (0~1건) ============= -->
			<!-- 실제로 수행된 결과와 담당자의 확인 기록 (조치 결과 확인일 = 처리 흐름의 '조치 수행 결과 확인', 조치상태가 조치 수행 및 결과 확인 완료가 되는 시점)
		     수행 주체 = 확정된 조치를 실제로 수행한 대상자(신청 주체), 조치 결과 확인자 = 현장에서 확인한 조치담당자
		     실제 조치 수량 ≠ 조치 예정 수량: 계획 수량과 실제 수행량은 다를 수 있어 따로 저장, 보상처리 상세 계산 정보의 실제 조치 수량과 같은 값
		     수행 전이면 '조치 수행 결과가 없습니다.' 안내, 조치 수행일이 조치 완료 요청기한을 넘으면 조치 결과 확인 의견에 지연 사유 기록 -->
			<section class="detail-section">

				<h2 class="detail-section-title">실제 조치 수행 결과</h2>

				<table class="detail-table">
					<caption class="sr-only">실제 조치 수행 결과</caption>
					<tr>
						<th scope="row">조치를 수행한 주체</th>
						<td>행복농장 (대표자 김*아)</td>
						<th scope="row">실제 조치 수행일</th>
						<td>2026-09-27</td>
					</tr>
					<tr>
						<th scope="row">실제 조치 수량</th>
						<td colspan="3">1,200kg</td>
					</tr>
					<tr>
						<th scope="row">조치 결과 확인자</th>
						<td>박민수</td>
						<th scope="row">조치 결과 확인일</th>
						<td>2026-09-28</td>
					</tr>
					<tr>
						<th scope="row">조치 결과 확인 의견</th>
						<td colspan="3">폐기 현장 확인 완료, 잔량 없음 (조치 완료 요청기한 내 수행)</td>
					</tr>
					<tr>
						<th scope="row">조치 수행 증빙서류</th>
						<td colspan="3">폐기확인서(폐기 조치 수행 증빙) <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해 조치 계획 및 기준 ============= -->
			<!-- 확정된 조치 내용: 현장조사 결과를 보고 무엇을 얼마만큼 언제까지 조치할지 정한 기록 (위 조치 수행 결과의 기준)
		     조치 방법 = 회수(RECALL) / 폐기(DISPOSAL) / 용도변경(CHANGE_USE), 조치 계획 내용 = 그 방법으로 어떻게 처리하는지 (폐기: 매몰·소각 / 회수: 회수 경로 / 용도변경: 변경 용도)
		     조치 방법 확정일 ≠ 조치 완료 요청기한: 확정한 날과 수행을 끝내야 하는 날은 다른 개념이라 한 기간으로 합치지 않음
		     조치 예정 수량·조치 예정 면적 = 확정된 계획 수량·면적 (실제로 수행된 양은 조치 수행 결과)
		     확정 전(조사중)이면 '조치 방법 확정 전입니다.' 안내
		     (표 첫 줄에 colspan 이 있으면 고정 폭 표의 칸 너비가 틀어져서 첫 줄은 두 칸 짝으로) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해 조치 계획 및 기준</h2>

				<table class="detail-table">
					<caption class="sr-only">피해 조치 계획 및 기준</caption>
					<tr>
						<th scope="row">조치 방법</th>
						<td>폐기</td>
						<th scope="row">조치 방법 확정일</th>
						<td>2026-09-24</td>
					</tr>
					<tr>
						<th scope="row">조치 완료 요청기한</th>
						<td colspan="3">2026-09-27</td>
					</tr>
					<tr>
						<th scope="row">조치 예정 수량</th>
						<td>1,200kg</td>
						<th scope="row">조치 예정 면적</th>
						<td>3,500㎡</td>
					</tr>
					<tr>
						<th scope="row">조치 계획 내용</th>
						<td colspan="3">피해 과실 1,200kg 전량 수거 후 매몰 폐기</td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해 현장조사 결과 (여러 건) ============= -->
			<!-- 조치를 그렇게 확정한 근거: 피해신청 1건에 조사가 여러 번 있을 수 있어 목록 표로 표시 (조사 1회당 보고서 1건, 서류구분 조사(SURVEY))
		     조사 판정: 추가 조사(MORE) / 조사 완료(DONE), '조사 완료'인 회차의 조사일 = 조사완료일 → 이 결과로 위 피해 조치정보를 결정
		     정렬: 최신 차수가 맨 위 (1차가 맨 아래) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해 현장조사 결과</h2>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">피해 현장조사 결과</caption>
						<thead>
							<tr>
								<th scope="col">조사차수</th>
								<th scope="col">현장조사일</th>
								<th scope="col">현장조사자</th>
								<th scope="col">현장에서 확인한 피해유형</th>
								<th scope="col">현장에서 확인한 피해면적</th>
								<th scope="col">현장에서 확인한 피해율</th>
								<th scope="col">현장에서 확인한 피해내용</th>
								<th scope="col">현장조사 종합의견</th>
								<th scope="col">조사 진행 판단</th>
								<th scope="col">현장조사 관련 서류</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2차</td>
								<td>2026-09-24</td>
								<td>박민수</td>
								<td>과실 부패</td>
								<td>3,500㎡</td>
								<td>70%</td>
								<td class="cell-text">과실 상품성이 저하되고 수확량이 감소함</td>
								<td class="cell-text">피해 과실 폐기 필요</td>
								<td>조사 완료</td>
								<td><a class="case-link" href="#">2차 현장조사 보고서(조사 완료 근거) 내려받기</a></td>
							</tr>
							<tr>
								<td>1차</td>
								<td>2026-09-22</td>
								<td>박민수</td>
								<td>과실 병반</td>
								<td>2,000㎡</td>
								<td>40%</td>
								<td class="cell-text">탄저병 초기 증상 확인</td>
								<td class="cell-text">확산 우려가 있어 재조사 필요</td>
								<td>추가 조사</td>
								<td><a class="case-link" href="#">1차 현장조사 보고서(추가 조사 근거) 내려받기</a></td>
							</tr>
						</tbody>
					</table>
				</div>

			</section>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="${pageContext.request.contextPath}/view/caseActionList.jsp">목록</a>
				<%-- 2차: 조치상태가 조치 수행 및 결과 확인 완료일 때만 표시, 상세 내용을 모아 조치 결과 확인서를 인쇄·PDF로 출력
				<a class="list-btn" href="#">조치 결과 확인서 출력</a>
				--%>
			</div>

		</main>

	</div>

</body>
</html>
