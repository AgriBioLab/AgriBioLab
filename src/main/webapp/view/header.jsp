<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ============= HEADER ============= -->
<header class="top-header">
	<div class="header-inner">
		<div class="logo">
			<div class="logo-icon">로고</div>
			<span>농산물피해조치</span>
		</div>

		<!-- 로그인 정보 영역 -->
		<div class="header-right">
			<span class="user-name">피해조치담당자</span> <span class="user-name">이*규님</span>
			<!-- 마이페이지: 아이콘 + 글자 함께 표시 (아이콘만 두면 의미를 알기 어려움) -->
			<a class="mypage-link" href="${pageContext.request.contextPath}/view/myPage.jsp">
				<svg class="mypage-icon" viewBox="0 0 24 24" width="18" height="18"><circle cx="12" cy="8" r="4" fill="none" stroke="currentColor" stroke-width="2"/><path d="M4 21c0-4.4 3.6-7 8-7s8 2.6 8 7" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></svg>
				마이페이지
			</a>
			<button class="logout-btn">로그아웃</button>
		</div>

		<!-- 전체 메뉴 (1023px 이하에서만 보임)
		     details/summary: JS 없이 누르면 펼치고 다시 누르면 접히는 HTML 기본 태그 -->
		<details class="all-menu">
			<summary class="all-menu-btn">☰ 메뉴</summary>

			<nav class="all-menu-panel">
				<!-- 767px 이하: 헤더에서 숨긴 로그인 정보를 메뉴 맨 위에 표시 (메뉴가 길어도 스크롤 없이 보이게) -->
				<div class="all-menu-user">
					<span class="user-name">피해조치담당자 이*규님</span>
					<span class="all-menu-user-btns">
						<a class="mypage-link" href="${pageContext.request.contextPath}/view/myPage.jsp">
							<svg class="mypage-icon" viewBox="0 0 24 24" width="18" height="18"><circle cx="12" cy="8" r="4" fill="none" stroke="currentColor" stroke-width="2"/><path d="M4 21c0-4.4 3.6-7 8-7s8 2.6 8 7" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></svg>
							마이페이지
						</a>
						<button class="logout-btn">로그아웃</button>
					</span>
				</div>

				<ul class="all-menu-list">
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/qualityStatistics.jsp">통계</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/qualityStatistics.jsp">보상금</a></li>
							<li><a href="#">신청/지급건수</a></li>
						</ul>
					</li>
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/compensationSupportList.jsp">보상처리</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/compensationSupportList.jsp">보상처리 목록</a></li>
						</ul>
					</li>
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/caseActionList.jsp">피해조치</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/caseActionList.jsp">피해조치 목록</a></li>
						</ul>
					</li>
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/damageApplyList.jsp">피해신청</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/damageApplyList.jsp">피해신청 목록</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</details>
	</div>
</header>

<!-- ============= GNB ============= -->
<%-- 선택 표시: 각 화면 body 의 메뉴 클래스(menu-stats / comp / action / apply)와 짝이 맞는 메뉴를 header.css 에서 표시 --%>
<nav class="gnb">
	<div class="gnb-inner">
		<ul class="gnb-menu">
			<li class="gnb-stats"><a href="qualityStatistics.jsp">통계</a></li>
			<li class="gnb-comp"><a href="compensationSupportList.jsp">보상처리</a></li>
			<li class="gnb-action"><a href="caseActionList.jsp">피해조치</a></li>
			<li class="gnb-apply"><a href="damageApplyList.jsp">피해신청</a></li>
		</ul>
	</div>
</nav>
