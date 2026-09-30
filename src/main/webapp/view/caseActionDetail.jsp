<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 피해조치 상세</title>

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
				<span>홈</span> &gt; <span>피해조치</span> &gt; <span>상세</span>
			</nav>

			<!-- Page Title (조치에는 별도 번호가 없음, 피해신청번호는 아래 신청 요약에서 링크로) -->
			<h1 class="page-title">피해조치 상세</h1>

			<!-- ============= 처리 흐름 (신청 → 조사 → 조치 → 보상, 같은 피해신청번호) ============= -->
			<div class="flow-here-action">
				<%@ include file="flow_damage.jsp"%>
			</div>

			<!-- ============= 요약 정보 ============= -->
			<!-- 조치 단계 요약 (전체 처리 일수는 핵심 화면인 보상처리 상세에서), 조사완료일 = '조사 완료' 판정 회차의 조사일, 조치 종결일 = 이행 확인날짜 -->
			<dl class="detail-summary">
				<div>
					<dt>진행상태</dt>
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
					<dt>조사완료일</dt>
					<dd>2026-09-24</dd>
				</div>
				<div>
					<dt>조치 종결일</dt>
					<dd>2026-09-28</dd>
				</div>
			</dl>

			<%-- 샘플 데이터: 생산자 본인이 신청한 REQ-2026-000136 1건 (목록의 어느 번호를 눌러도 이 화면, MVC2 전환 시 번호로 조회)
			     진행상태 조치완료 = 서류 모두 확인 → 현장조사 완료 → 조치 결정 → 조치 이행 → 담당자 이행 확인까지 끝나 종결된 상태
			     날짜 흐름: 발생 9/15 → 신청 9/21 → 서류 확인 9/22~23 → 조사 9/22·9/24 → 조치 결정 9/24 → 조치 기간 9/24~27 → 이행 9/27 → 이행 확인 9/28 --%>

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

			<!-- ============= 조치 이행정보 (0~1건) ============= -->
			<!-- 조치를 이행한 건만 표시 (회수·폐기·용도변경 모든 조치유형 공통, 이행 전이면 '조치 이행 전입니다.' 안내)
		     이행 담당자·조치 이행날짜 = 조치기관에서 실제로 이행한 사람과 날, 이행 확인자·이행 확인날짜 = 이행을 확인한 담당자와 날
		     조치 이행날짜가 조치 기간을 넘으면 이행 확인 의견에 지연 사유 기록
		     이행 증빙 = 첨부서류 중 서류구분 이행(ACTION), 조치기관이 발급한 확인서 (회수 확인서, 폐기 확인서 등) -->
			<section class="detail-section">

				<h2 class="detail-section-title">조치 이행정보</h2>

				<table class="detail-table">
					<caption class="sr-only">조치 이행정보</caption>
					<tr>
						<th scope="row">이행 담당자</th>
						<td>이정훈</td>
						<th scope="row">조치 이행날짜</th>
						<td>2026-09-27</td>
					</tr>
					<tr>
						<th scope="row">이행 확인자</th>
						<td>박민수</td>
						<th scope="row">이행 확인날짜</th>
						<td>2026-09-28</td>
					</tr>
					<tr>
						<th scope="row">조치기관</th>
						<td colspan="3">○○시 농업기술센터</td>
					</tr>
					<tr>
						<th scope="row">이행 확인 의견</th>
						<td colspan="3">폐기 현장 확인 완료, 잔량 없음 (기한 내 이행)</td>
					</tr>
					<tr>
						<th scope="row">이행 증빙</th>
						<td colspan="3">폐기 확인서 (○○시 농업기술센터 발급) <a class="case-link" href="#">내려받기</a></td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해조치정보 ============= -->
			<!-- 조치 결정일 = 조사 후 조치를 정한 날, 조치 기간 = 정한 이행 기한 (시작일 ~ 완료일)
		     조치 결정 전(조사중)이면 표 대신 '조치 결정 전입니다.' 안내 -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해조치정보</h2>

				<table class="detail-table">
					<caption class="sr-only">피해조치정보</caption>
					<tr>
						<th scope="row">조치유형</th>
						<td>폐기</td>
						<th scope="row">조치 기간</th>
						<td>2026-09-24 ~ 2026-09-27</td>
					</tr>
					<tr>
						<th scope="row">결정자</th>
						<td>박민수</td>
						<th scope="row">조치 결정일</th>
						<td>2026-09-24</td>
					</tr>
					<tr>
						<th scope="row">조치 대상 수량</th>
						<td>1,200kg</td>
						<th scope="row">조치 대상 면적</th>
						<td>3,500㎡</td>
					</tr>
					<tr>
						<th scope="row">조치 내용</th>
						<td colspan="3">피해 과실 1,200kg 전량 수거 후 매몰 폐기</td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해현장조사 정보 (여러 건) ============= -->
			<!-- 피해신청 1건에 조사가 여러 번 있을 수 있어 목록 표로 표시, 조사 보고서 = 첨부서류 중 서류구분 조사(SURVEY), 조사 1회당 1건
		     조사 판정: 추가 조사(MORE) / 조사 완료(DONE), '조사 완료'인 회차의 조사일 = 조사완료일
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
								<th scope="col">조사담당자명</th>
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

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="${pageContext.request.contextPath}/view/caseActionList.jsp">목록</a>
				<%-- 2차: 진행상태가 조치완료일 때만 표시, 상세 내용을 모아 조치 이행 확인서를 인쇄·PDF로 출력
				<a class="list-btn" href="#">조치 이행 확인서 출력</a>
				--%>
			</div>

		</main>

	</div>

</body>
</html>
