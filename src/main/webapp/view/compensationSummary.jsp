<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<caption class="sr-only">보상처리결과 요약</caption>
    <thead>
        <tr>
            <th scope="col">통합 진행상태</th>
            <th scope="col">보상 신청 금액</th>
            <th scope="col">최종 보상금</th>
            <th scope="col">조치담당자</th>
            <th scope="col">보상 신청부터 지급까지 걸린 기간</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>${summary.applicationStatus}</td>
            <td>${summary.compensationClaimAmount}</td>
            <td>${summary.finalCompensationAmount}</td>
            <td>${summary.actionChargerName}</td>
            <td>${day}</td>
        </tr>
    </tbody>
