<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 사이드메뉴 공통: myPage.jsp 에서 <%@ include file="side_myPage.jsp"%> 로 사용 --%>
<aside class="side-menu">

	<div class="side-title">마이페이지</div>

	<div class="side-section">

		<div class="side-section-title">마이페이지</div>

		<ul class="side-menu-list">
			<li class="active"><a href="${pageContext.request.contextPath}/view/myPage.jsp">내 정보</a></li>
			<li><a href="#">비밀번호 변경</a></li>
			<li><a href="#">접속 이력</a></li>
		</ul>

	</div>

</aside>
