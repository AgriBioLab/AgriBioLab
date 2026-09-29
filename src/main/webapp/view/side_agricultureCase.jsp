<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 사이드메뉴 공통: agricultureCaseList.jsp, agricultureCaseDetail.jsp 에서 <%@ include file="side_agricultureCase.jsp"%> 로 사용 --%>
<aside class="side-menu">

	<div class="side-title">농산물 사건</div>

	<div class="side-section">

		<div class="side-section-title">농산물 사건</div>

		<ul class="side-menu-list">
			<li class="active"><a href="${pageContext.request.contextPath}/view/agricultureCaseList.jsp">농산물 사건</a></li>
			<li><a href="#">농산물 사건 내역</a></li>
		</ul>

	</div>

</aside>
