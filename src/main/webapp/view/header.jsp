<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ============= HEADER ============= -->
<header class="top-header">
	<div class="header-inner">
		<div class="logo">
			<div class="logo-icon">로고</div>
			<span>농산물</span>
		</div>

		<!-- 로그인 정보 영역 -->
		<div class="header-right">
			<span class="user-name"> 품질담당자</span> <span class="user-name"> 이OO님</span>
			<button class="logout-btn">로그아웃</button>
		</div>

		<!-- 전체 메뉴 (1023px 이하에서만 보임)
		     details/summary: JS 없이 누르면 펼치고 다시 누르면 접히는 HTML 기본 태그 -->
		<details class="all-menu">
			<summary class="all-menu-btn">☰ 메뉴</summary>

			<nav class="all-menu-panel">
				<!-- 767px 이하: 헤더에서 숨긴 로그인 정보를 메뉴 맨 위에 표시 (메뉴가 길어도 스크롤 없이 보이게) -->
				<div class="all-menu-user">
					<span class="user-name">품질담당자 이OO님</span>
					<button class="logout-btn">로그아웃</button>
				</div>

				<ul class="all-menu-list">
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/qualityStatistics.jsp">품질통계</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/qualityStatistics.jsp">보상금</a></li>
							<li><a href="#">신청/지급건수</a></li>
						</ul>
					</li>
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/compensationSupportList.jsp">보상·지원</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/compensationSupportList.jsp">보상·지원</a></li>
							<li><a href="#">보상·지원 내역</a></li>
						</ul>
					</li>
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/caseActionList.jsp">사건조치</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/caseActionList.jsp">사건조치</a></li>
							<li><a href="#">사건조치 내역</a></li>
						</ul>
					</li>
					<li>
						<a class="all-menu-title" href="${pageContext.request.contextPath}/view/agricultureCaseList.jsp">농산물 사건</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/view/agricultureCaseList.jsp">농산물 사건</a></li>
							<li><a href="#">농산물 사건 내역</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</details>
	</div>
</header>

<!-- ============= GNB ============= -->
<nav class="gnb">
	<div class="gnb-inner">
		<ul class="gnb-menu">
			<li><a href="qualityStatistics.jsp">품질통계</a></li>
			<li class="active"><a href="compensationSupportList.jsp">보상·지원</a></li>
			<li><a href="caseActionList.jsp">사건조치</a></li>
			<li><a href="agricultureCaseList.jsp">농산물 사건</a></li>
		</ul>
	</div>
</nav>
