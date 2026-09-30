<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 처리 흐름 공통: damageApplyDetail.jsp, caseActionDetail.jsp, compensationSupportDetail.jsp 에서 요약 정보 바로 아래 include
     한 건(같은 피해신청번호)이 신청 → 조사 → 조치 → 보상까지 어디까지 왔는지 한 줄 경로로 표시 (진행 기록만, 이동 링크 없음)
     지금 보고 있는 화면의 단계는 감싸는 div 클래스(flow-here-apply / action / comp)로 굵게 표시
     끝난 단계 = is-done, 아직 안 된 단계 = 클래스 없음 (날짜 '-')
     샘플: REQ-2026-000136 (MVC2 전환 시 번호·날짜는 조회 결과로) --%>
<div class="detail-flow-wrap">
	<span class="detail-flow-title">처리 흐름</span>
	<ol class="detail-flow">
		<li class="is-done step-apply">신청 <span class="flow-date">2026-09-21</span></li>
		<li class="is-done step-survey">조사 완료 <span class="flow-date">2026-09-24</span></li>
		<li class="is-done step-decision">조치 결정 <span class="flow-date">2026-09-24</span></li>
		<li class="is-done step-action">조치 완료 <span class="flow-date">2026-09-28</span></li>
		<li class="is-done step-comp">보상 지급 <span class="flow-date">2026-09-30</span></li>
	</ol>
</div>
