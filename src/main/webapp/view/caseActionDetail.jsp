<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 피해조치</title>

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
				<span>홈</span> &gt; <span>피해조치</span>
			</nav>

			<!-- Page Title (조치에는 별도 번호가 없음, 피해신청번호는 아래 신청 요약에서 링크로) -->
			<h1 class="page-title">피해조치</h1>

			<!-- ============= 요약 정보 ============= -->
			<!-- 조치 단계 요약 (단계별 날짜는 바로 아래 처리 흐름에서, 전체 처리 일수는 보상처리 상세에서)
			     조치상태 = 피해조치 업무의 상태 (피해신청 목록·통계의 진행상태와 같은 코드값)
			     이행기한 = 이 날까지 조치를 끝내야 하는 날 (조치 결정일과 합치지 않음) -->
			<dl class="detail-summary">
				<div>
					<dt>조치상태</dt>
					<dd>조치완료</dd>
				</div>
				<div>
					<dt>처리 담당자</dt>
					<dd>박민수</dd>
				</div>
				<div>
					<dt>조치유형</dt>
					<dd>폐기</dd>
				</div>
				<div>
					<dt>이행기한</dt>
					<dd>2026-09-27</dd>
				</div>
			</dl>

			<!-- ============= 처리 흐름 (요약 바로 아래, 같은 피해신청번호의 단계별 날짜) ============= -->
			<!-- 피해조치 전용 흐름 (보상 지급은 별도 업무라 넣지 않음) -->
			<div class="flow-here-action">
				<%@ include file="flow_action.jsp"%>
			</div>

			<%-- 샘플 데이터: 생산자 본인이 신청한 REQ-2026-000136 1건 (목록의 어느 번호를 눌러도 이 화면, MVC2 전환 시 번호로 조회)
			     조치상태 조치완료 = 대상자가 결정된 조치를 이행하고 담당자가 이행 결과와 증빙까지 확인한 상태
			     날짜 흐름: 발생 9/15 → 신청 9/21 → 서류 확인 9/22~23 → 조사 9/22·9/24 → 조치 결정 9/24 → 이행기한 9/27 → 조치 이행 9/27 → 이행 확인 9/28
			     화면 순서 = 업무 흐름 순서 (신청 → 현장조사 → 조치 결정 → 조치 이행), 여러 건인 현장조사 표 안에서만 최신 차수가 위 --%>

			<!-- ============= 신청 정보 ============= -->
			<!-- 피해신청 기준 정보: 누구의 무엇인지 식별, 개인농가는 단체/상호명 '-'·대표자 = 신청인 본인 (피해신청번호를 누르면 피해신청 상세, 단계별 날짜는 처리 흐름에서), 신청 주체는 단체/상호명(업체: 생산자·유통자·판매자)와 대표자, 대표자 이름은 가림, 생산 농장은 그 농산물을 생산한 곳 (생산자 신청이면 단체/상호명와 같음), 서류는 내려받기만 (확인 처리는 피해신청 상세) -->
			<section class="detail-section">

				<h2 class="detail-section-title">신청 정보</h2>

				<table class="detail-table">
					<caption class="sr-only">신청 정보</caption>
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
						<th scope="row">생산 농장</th>
						<td colspan="3">행복농장</td>
					</tr>
					<tr>
						<th scope="row">신청 서류</th>
						<td colspan="3">농업경영체 등록확인서 <a class="case-link" href="#">내려받기</a> · 피해신청서 <a class="case-link" href="#">내려받기</a> · 피해 현장 사진 <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해현장조사 정보 (여러 건) ============= -->
			<!-- 조치를 그렇게 결정한 근거: 피해신청 1건에 조사가 여러 번 있을 수 있어 목록 표로 표시 (조사 1회당 보고서 1건, 서류구분 조사(SURVEY))
		     조사 판정: 추가 조사(MORE) / 조사 완료(DONE), '조사 완료'인 회차의 조사일 = 조사완료일 → 이 결과로 아래 피해조치정보를 결정
		     정렬: 최신 차수가 맨 위 (1차가 맨 아래) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해현장조사 정보</h2>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">피해현장조사 정보</caption>
						<thead>
							<tr>
								<th scope="col">차수</th>
								<th scope="col">조사일</th>
								<th scope="col">조사담당자</th>
								<th scope="col">피해유형</th>
								<th scope="col">피해면적</th>
								<th scope="col">피해율</th>
								<th scope="col">피해내용</th>
								<th scope="col">현장조사결과</th>
								<th scope="col">조사 판정</th>
								<th scope="col">조사 보고서</th>
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
								<td><a class="case-link" href="#">내려받기</a></td>
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
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
						</tbody>
					</table>
				</div>

			</section>

			<!-- ============= 피해조치정보 ============= -->
			<!-- 결정된 조치 내용: 현장조사 결과를 보고 무엇을 얼마만큼 언제까지 조치할지 정한 기록 (아래 조치 이행정보의 기준)
		     조치유형 = 회수(RECALL) / 폐기(DISPOSAL) / 용도변경(CHANGE_USE), 조치내용 = 그 유형을 어떻게 처리하는지 (폐기: 매몰·소각 / 회수: 회수 경로 / 용도변경: 변경 용도)
		     조치 결정일 ≠ 이행기한: 결정한 날과 이행을 끝내야 하는 날은 다른 개념이라 한 기간으로 합치지 않음
		     조치대상수량·조치대상면적 = 결정된 계획 수량·면적 (실제로 이행된 양은 조치 이행정보)
		     결정 전(조사중)이면 '조치 결정 전입니다.' 안내
		     (표 첫 줄에 colspan 이 있으면 고정 폭 표의 칸 너비가 틀어져서 첫 줄은 두 칸 짝으로) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해조치정보</h2>

				<table class="detail-table">
					<caption class="sr-only">피해조치정보</caption>
					<tr>
						<th scope="row">조치유형</th>
						<td>폐기</td>
						<th scope="row">결정자</th>
						<td>정우진 (○○시 농업정책과 팀장)</td>
					</tr>
					<tr>
						<th scope="row">조치 결정일</th>
						<td>2026-09-24</td>
						<th scope="row">이행기한</th>
						<td>2026-09-27</td>
					</tr>
					<tr>
						<th scope="row">조치대상수량</th>
						<td>1,200kg</td>
						<th scope="row">조치대상면적</th>
						<td>3,500㎡</td>
					</tr>
					<tr>
						<th scope="row">조치내용</th>
						<td colspan="3">피해 과실 1,200kg 전량 수거 후 매몰 폐기</td>
					</tr>
				</table>

			</section>

			<!-- ============= 조치 이행정보 (0~1건) ============= -->
			<!-- 실제로 이행된 결과와 담당자의 확인 기록 (이행 확인일 = 처리 흐름의 '조치 완료', 조치상태가 조치완료가 되는 시점)
		     이행주체 = 결정된 조치를 실제로 수행한 대상자(신청 주체), 이행 확인자 = 현장에서 확인한 처리 담당자
		     실제 이행수량 ≠ 조치대상수량: 계획 수량과 실제 이행량은 다를 수 있어 따로 저장, 보상처리 상세 산정 정보의 실제 이행수량과 같은 값
		     입회기관 = 이행 현장에 함께 입회해 증빙을 확인한 기관 (없으면 '-')
		     이행 전이면 '조치 이행정보가 없습니다.' 안내, 조치 이행일이 이행기한을 넘으면 이행 확인의견에 지연 사유 기록 -->
			<section class="detail-section">

				<h2 class="detail-section-title">조치 이행정보</h2>

				<table class="detail-table">
					<caption class="sr-only">조치 이행정보</caption>
					<tr>
						<th scope="row">이행주체</th>
						<td>행복농장 (대표자 김*아)</td>
						<th scope="row">조치 이행일</th>
						<td>2026-09-27</td>
					</tr>
					<tr>
						<th scope="row">실제 이행수량</th>
						<td>1,200kg</td>
						<th scope="row">입회기관</th>
						<td>○○시 농업기술센터</td>
					</tr>
					<tr>
						<th scope="row">이행 확인자</th>
						<td>박민수 (○○시 농업정책과)</td>
						<th scope="row">이행 확인일</th>
						<td>2026-09-28</td>
					</tr>
					<tr>
						<th scope="row">이행 확인의견</th>
						<td colspan="3">폐기 현장 확인 완료, 잔량 없음 (이행기한 내 이행)</td>
					</tr>
					<tr>
						<th scope="row">이행증빙</th>
						<td colspan="3">폐기확인서 <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="${pageContext.request.contextPath}/view/caseActionList.jsp">목록</a>
				<%-- 2차: 조치상태가 조치완료일 때만 표시, 상세 내용을 모아 이행 확인서를 인쇄·PDF로 출력
				<a class="list-btn" href="#">이행 확인서 출력</a>
				--%>
			</div>

		</main>

	</div>

</body>
</html>
