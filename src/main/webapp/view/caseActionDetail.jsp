<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물피해조치 - 피해신청 상세</title>

<!-- 상세 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<!-- 목록 표 CSS (현장조사·제출서류처럼 여러 건인 정보) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- ============= PAGE LAYOUT ============= -->
	<div class="page-layout">

		<!-- ============= SIDE MENU (메뉴별 공통) ============= -->
		<%@ include file="side_caseAction.jsp"%>

		<!-- ============= CONTENT ============= -->
		<main class="content">

			<!-- Breadcrumb -->
			<nav class="breadcrumb">
				<span>홈</span> &gt; <span>피해신청</span> &gt; <span>상세</span>
			</nav>

			<!-- Page Title + 이 상세의 번호 (오른쪽 위) -->
			<div class="detail-head">
				<h1 class="page-title">피해신청 상세</h1>
				<p class="detail-no">피해신청번호 <strong>REQ-2026-000127</strong></p>
			</div>

			<%-- 샘플 데이터: 생산자 본인이 신청한 REQ-2026-000127 1건 (목록의 어느 번호를 눌러도 이 화면, MVC2 전환 시 번호로 조회)
			     진행상태 조치완료 = 서류 모두 확인 → 현장조사 완료 → 조치 결정 → 조치 이행 → 담당자 이행 확인까지 끝나 종결된 상태
			     날짜 흐름: 발생 9/15 → 신청 9/21 → 서류 확인 9/22~23 → 조사 9/22·9/24 → 조치 기간 9/24~27 → 이행 9/27 → 이행 확인 9/28 --%>

			<!-- ============= 피해신청정보 ============= -->
			<!-- 피해신청번호는 제목 오른쪽 위에 표시. 신청 품목은 생산자가 재해 대상 품목 중에서 고른 값 (품목코드 → 이름) -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해신청정보</h2>

				<table class="detail-table">
					<caption class="sr-only">피해신청정보</caption>
					<tr>
						<th scope="row">진행상태</th>
						<td>조치완료</td>
						<th scope="row">신청일</th>
						<td>2026-09-21</td>
					</tr>
					<tr>
						<th scope="row">신청자명</th>
						<td>김현아</td>
						<th scope="row">신청자 분류</th>
						<td>생산자</td>
					</tr>
					<tr>
						<th scope="row">신청 품목</th>
						<td colspan="3">사과</td>
					</tr>
					<%-- 진행상태가 반려 / 조치 대상 아님일 때만 표시 (이 샘플은 조치완료라 숨김)
					<tr>
						<th scope="row">사유</th>
						<td colspan="3">보완 기한 내 미보완 (R01) - 2026-09-30까지 농업경영체 등록확인서 미제출</td>
					</tr>
					--%>
				</table>

			</section>

			<!-- ============= 재해정보 ============= -->
			<!-- 신청에 저장된 재해정보_일련번호로 등록된 재해를 불러와 표시 (재해유형·발생지역은 코드 → 이름)
		     담당자 확인용: 발생 지역 ↔ 농장주소, 발생일 ↔ 신청일 (농산물 재해 메뉴를 다시 살리면 재해정보번호에 링크 연결) -->
			<section class="detail-section">

				<h2 class="detail-section-title">재해정보</h2>

				<table class="detail-table">
					<caption class="sr-only">재해정보</caption>
					<tr>
						<th scope="row">재해정보번호</th>
						<td>DIS-2026-000127</td>
						<th scope="row">재해유형</th>
						<td>병해충</td>
					</tr>
					<tr>
						<th scope="row">발생 지역</th>
						<td>경북 영주시 풍기읍</td>
						<th scope="row">발생일</th>
						<td>2026-09-15</td>
					</tr>
				</table>

			</section>

			<!-- ============= 생산자정보 ============= -->
			<%-- 생산자정보_일련번호로 연결 (조회용 키라 화면에는 표시하지 않음) --%>
			<section class="detail-section">

				<h2 class="detail-section-title">생산자정보</h2>

				<table class="detail-table">
					<caption class="sr-only">생산자정보</caption>
					<tr>
						<th scope="row">생산자명</th>
						<td>김현아</td>
						<th scope="row">농장명</th>
						<td>행복농장</td>
					</tr>
					<tr>
						<th scope="row">재배면적</th>
						<td>5,000㎡</td>
						<th scope="row">농장주소</th>
						<td>경상북도 영주시 풍기읍 ○○로 123</td>
					</tr>
				</table>

			</section>

			<!-- ============= 피해신청서류 정보 (여러 건) ============= -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해신청서류 정보</h2>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">피해신청서류 정보</caption>
						<thead>
							<tr>
								<th scope="col">서류명</th>
								<th scope="col">제출기관</th>
								<th scope="col">제출일</th>
								<th scope="col">확인상태</th>
								<th scope="col">확인일</th>
								<th scope="col">첨부파일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cell-text">피해신청서</td>
								<td>신청자 제출</td>
								<td>2026-09-21</td>
								<td>확인</td>
								<td>2026-09-22</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
							<tr>
								<td class="cell-text">피해 현장 사진</td>
								<td>신청자 제출</td>
								<td>2026-09-21</td>
								<td>확인</td>
								<td>2026-09-22</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
							<tr>
								<td class="cell-text">농업경영체 등록확인서</td>
								<td>신청자 제출</td>
								<td>2026-09-23</td>
								<td>확인</td>
								<td>2026-09-23</td>
								<td><a class="case-link" href="#">내려받기</a></td>
							</tr>
						</tbody>
					</table>
				</div>

			</section>

			<!-- ============= 피해현장조사 정보 (여러 건) ============= -->
			<!-- 피해신청 1건에 조사가 여러 번 있을 수 있어 목록 표로 표시 -->
			<section class="detail-section">

				<h2 class="detail-section-title">피해현장조사 정보</h2>

				<div class="table-wrap">
					<table class="list-table">
						<caption class="sr-only">피해현장조사 정보</caption>
						<thead>
							<tr>
								<th scope="col">조사일</th>
								<th scope="col">조사담당자명</th>
								<th scope="col">피해유형</th>
								<th scope="col">피해면적</th>
								<th scope="col">피해율</th>
								<th scope="col">피해내용</th>
								<th scope="col">현장조사결과</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2026-09-22</td>
								<td>박민수</td>
								<td>과실 병반</td>
								<td>2,000㎡</td>
								<td>40%</td>
								<td class="cell-text">탄저병 초기 증상 확인</td>
								<td class="cell-text">확산 우려가 있어 재조사 필요</td>
							</tr>
							<tr>
								<td>2026-09-24</td>
								<td>박민수</td>
								<td>과실 부패</td>
								<td>3,500㎡</td>
								<td>70%</td>
								<td class="cell-text">과실 상품성이 저하되고 수확량이 감소함</td>
								<td class="cell-text">피해 과실 폐기 필요</td>
							</tr>
						</tbody>
					</table>
				</div>

			</section>

			<!-- ============= 피해조치정보 ============= -->
			<!-- 조치 기간 = 담당자가 정한 조치 시작일 ~ 조치 완료일 (첫 줄에 colspan이 있으면 고정 폭 표의 칸 너비가 틀어져서 한 칸으로 묶음) -->
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
						<th scope="row">조치 대상 수량</th>
						<td>1,200kg</td>
						<th scope="row">조치 대상 면적</th>
						<td>3,500㎡</td>
					</tr>
				</table>

			</section>

			<!-- ============= 조치 이행정보 (0~1건) ============= -->
			<!-- 조치를 이행한 건만 표시 (회수·폐기·용도변경 모든 조치유형 공통, 조치 전이면 이 섹션 없음)
		     조치 이행날짜 = 실제로 이행한 날, 이행 확인날짜 = 담당자가 이행을 확인한 날 -->
			<section class="detail-section">

				<h2 class="detail-section-title">조치 이행정보</h2>

				<table class="detail-table">
					<caption class="sr-only">조치 이행정보</caption>
					<tr>
						<th scope="row">조치담당자</th>
						<td>이정훈</td>
						<th scope="row">조치기관</th>
						<td>○○시 농업기술센터</td>
					</tr>
					<tr>
						<th scope="row">조치 이행날짜</th>
						<td>2026-09-27</td>
						<th scope="row">이행 확인날짜</th>
						<td>2026-09-28</td>
					</tr>
				</table>

			</section>

			<!-- ============= 하단 이동 ============= -->
			<div class="detail-actions">
				<a class="list-btn" href="${pageContext.request.contextPath}/view/caseActionList.jsp">목록</a>
			</div>

		</main>

	</div>

</body>
</html>
