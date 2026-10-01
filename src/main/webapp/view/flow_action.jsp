<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 피해조치 처리 흐름: caseActionDetail.jsp 전용 (신청 → 현장조사 결과 등록 → 조치 방법 확정 → 조치 실제 수행 → 조치 수행 결과 확인)
     보상 지급은 피해조치 업무가 아니라서 넣지 않음 (피해신청·보상처리 상세는 flow_damage.jsp 를 그대로 사용)
     끝난 단계 = is-done, 아직 안 된 단계 = 클래스 없음 (날짜 '-')
     step-action = 지금 보고 있는 화면의 단계, 감싸는 div 의 flow-here-action 과 짝 (detail.css)
     샘플: REQ-2026-000136 (MVC2 전환 시 날짜는 조회 결과로) --%>
<div class="detail-flow-wrap">
	<span class="detail-flow-title">신청부터 조치 결과 확인까지 처리 흐름</span>
	<ol class="detail-flow">
		<li class="is-done step-apply">피해신청 접수 <span class="flow-date">2026-09-21</span></li>
		<li class="is-done step-survey">현장조사 결과 등록 <span class="flow-date">2026-09-24</span></li>
		<li class="is-done step-decision">조치 방법 확정 <span class="flow-date">2026-09-24</span></li>
		<li class="is-done step-act">조치 실제 수행 <span class="flow-date">2026-09-27</span></li>
		<li class="is-done step-action">조치 수행 결과 확인 <span class="flow-date">2026-09-28</span></li>
	</ol>
</div>
