# Compensation DAO Interface Design

## 기준

- 기준 SQL: `sql/01_create_tables.sql`, `sql/sample_data.sql`, Google Sheets `1차 스프린트 업무리스트`
- 피해신청번호는 `agriculture_damage_app.app_id`를 사용한다.
- 신청자 일련번호는 `applicant.applicant_id`를 사용한다.
- DAO 외부 메서드명은 기존 JSP/테스트 영향 최소화를 위해 `applyNo` 표현을 유지하되, 내부 SQL에서는 `app_id`로 매핑한다.

## DAO 범위

`CompensationDAO`는 1차 스프린트의 보상처리 지급결과 화면을 담당한다.

| 메서드 | 화면/업무 | 주요 테이블 | 의도 |
| --- | --- | --- | --- |
| `findCompensationList(CompensationSearchVO search)` | 보상처리 지급결과 목록 조회 | `agriculture_damage_app`, `applicant`, `compensation_claim`, `compensation_calc`, `compensation_payment` | 검색 조건에 맞는 지급결과 목록을 조회한다. |
| `findCompensationDetailByApplyNo(String applyNo)` | 보상처리 지급결과 상세 종합 조회 | 목록 테이블 + `damage_action`, `damage_site_invest` | 피해신청번호 하나 기준으로 신청, 신청자, 조사, 조치, 산정, 지급 정보를 한 번에 조회한다. |
| `findCompensationAttachments(String applyNo, String fileCategory)` | 첨부파일 원문 확인 정보 통합 조회 | `app_doc`, `invest_doc`, `damage_action_doc`, `compensation_claim_doc`, `compensation_calc_doc`, `compensation_payment_doc` | 분리된 문서 테이블을 화면 공통 첨부 목록 형태로 통합 조회한다. |

## 검색 조건 매핑

| 화면 조건 | Search VO | SQL 컬럼 |
| --- | --- | --- |
| 보상금 지급일 시작 | `startDate` | `compensation_payment.payment_completion_date` |
| 보상금 지급일 종료 | `endDate` | `compensation_payment.payment_completion_date` |
| 피해신청번호 | `applyNo` | `agriculture_damage_app.app_id` |
| 단체/상호명 | `bizName` | `applicant.organization_name` |
| 대표자명 | `ownerName` | `applicant.representative_name` |
| 신청자 구분 | `targetType` | `applicant.app_category` |
| 품목명 | `itemName` | `agriculture_damage_app.product_name` |

## 문서 구분

| fileCategory | 포함 문서 |
| --- | --- |
| `APP` | 피해신청 문서 |
| `INVEST` | 현장조사 문서 |
| `ACTION` | 피해조치 문서 |
| `COMP` | 보상신청 문서, 보상금 산정 문서, 보상금 지급 문서 |
| `null` | 전체 문서 |

## 단위테스트 의도

- 목록 조회가 최신 물리모델의 JOIN 기준으로 실행되는지 확인한다.
- 피해신청번호 조건이 `app_id` 기준으로 동작하는지 확인한다.
- 상세 조회가 조사/조치/산정/지급 요약값을 함께 매핑하는지 확인한다.
- 분리된 문서 테이블이 첨부 목록 형태로 통합 조회되는지 확인한다.
- 존재하지 않는 피해신청번호는 빈 결과로 처리되는지 확인한다.
