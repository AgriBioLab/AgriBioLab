# Oracle Identifier Naming Dictionary

## Naming Rules

- Oracle 30-character limit must be kept for table, column, constraint, and sequence names.
- If an English term is abbreviated because of the 30-character limit, use the same abbreviation everywhere.
- Avoid unclear abbreviations. Use only common or project-approved abbreviations.
- Keep `applicant` as full name because it identifies the 신청자 entity and is already within 30 characters.
- Keep `compensation` and `payment` as full names because they are core domain terms and remain readable within 30 characters.

## Standard Abbreviations

| Full term | Standard term | Use case |
| --- | --- | --- |
| application | app | 피해신청 관련 테이블/컬럼/시퀀스 |
| document | doc | 문서 관련 테이블/컬럼/시퀀스 |
| calculation | calc | 보상금 산정 관련 테이블/컬럼/시퀀스 |
| investigation | invest | 현장조사 관련 테이블/컬럼/시퀀스 |
| compensation | compensation | 보상 도메인 핵심어이므로 유지 |
| payment | payment | 지급 도메인 핵심어이므로 유지 |
| applicant | applicant | 신청자 엔티티명이므로 유지 |

## Standard Table Names

| Previous / long name | Current standard name |
| --- | --- |
| agricultural_damage_application | agriculture_damage_app |
| damage_site_investigation | damage_site_invest |
| application_document | app_doc |
| investigation_document | invest_doc |
| damage_action_document | damage_action_doc |
| compensation_claim_document | compensation_claim_doc |
| compensation_calculation | compensation_calc |
| compensation_calculation_document | compensation_calc_doc |
| compensation_payment_document | compensation_payment_doc |

## Standard Column Names

| Previous / long name | Current standard name |
| --- | --- |
| application_id | app_id |
| application_category | app_category |
| application_status | app_status |
| application_date | app_date |
| application_doc_id | app_doc_id |
| investigation_id | invest_id |
| investigation_content | invest_content |
| investigation_result | invest_result |
| investigation_date | invest_date |
| investigation_doc_id | invest_doc_id |
| document_id | doc_id |
| document_name | doc_name |
| document_type | doc_type |
| compensation_calculation_id | compensation_calc_id |
| calculation_doc_id | calc_doc_id |
| calculation_criterion | calc_criterion |
| calculation_quantity | calc_quantity |
| calculation_institution_name | calc_institution_name |
| calculation_completion_date | calc_completion_date |
| calculator_name | calc_charger_name |
| compensation_payment_document_id | payment_doc_id |

## Standard Sequence Names

| Previous / typo / long name | Current standard name |
| --- | --- |
| seq_application_document | seq_app_doc |
| seq_investigaiton_document | seq_invest_doc |
| seq_investigation_document | seq_invest_doc |
| seq_damage_site_investigation | seq_damage_site_invest |
| seq_compenstion_calculation_document | seq_compensation_calc_doc |
| seq_compensation_calculation | seq_compensation_calc |
| seq_compensation_calculation_document | seq_compensation_calc_doc |

## Current SQL Execution Order

1. `01_create_tables.sql`
2. `02_create_constraints.sql`
3. `03_create_sequences.sql`
4. `sample_data.sql`
5. `04_select_check.sql`

Use `99_drop_all.sql` only when database reset is needed.
