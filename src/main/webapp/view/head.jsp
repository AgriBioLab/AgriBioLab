<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 모든 화면 공통 <head> 내용. 각 화면에서 <%@ include file="head.jsp"%> 로 불러온다.
     화면마다 다른 것(<title>, 화면별 CSS)은 각 화면에 둔다. --%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 웹폰트: Pretendard GOV (굵기별 subset 파일. 처음 한 번 받으면 모든 페이지에서 캐시 사용 → 페이지 이동 때 글꼴이 바뀌며 흔들리지 않음). 버전 고정 -->
<link rel="stylesheet" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/packages/pretendard-gov/dist/web/static/pretendard-gov-subset.min.css">

<!-- 헤더 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<!-- 사이드 메뉴 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidemenu.css">
