-- 변경 취합일: 2026-10-05
-- 기존 원본 ZIP 샘플 DB 전용. 01_table_column_changes.sql 적용 후 실행합니다.
-- 이미 추가 샘플을 적용한 DB에는 실행하지 않습니다.

-- 원본 DDL의 department 컬럼을 사용하는 DB에서는 migrate_officer_department_to_position.sql을 먼저 실행합니다.
-- Oracle / UTF-8. 기존 최신 ZIP의 sample_data.sql 실행 후 1회 실행.
-- 고정 ID를 사용하는 개발용 데이터입니다. 재실행/기존 ID 충돌 시 실행하지 마세요.
-- COMMIT 전 확인 쿼리로 결과를 확인하고 필요하면 ROLLBACK 하세요.
-- URL은 테스트 문자열이며 실제 첨부파일은 포함하지 않습니다.

DELETE FROM quality_assurance_officer WHERE username IN ('admin01', 'admin02');

INSERT INTO quality_assurance_officer (officer_id, username, password, name, position)
VALUES (3, 'quality01', 'quality1234', '이*규', '품질담당자');

INSERT INTO damage_site_invest (invest_id, app_id, investigator_name, damage_type, damage_area, damage_rate, invest_content, invest_result, invest_date)
VALUES (5, 'REQ-2026-000136', '품질담당자', '병해충 피해', 3400, 68, '재조사: 최초 조사 이후 피해면적과 피해율 재확인', '조사 완료', TO_DATE('2026-09-25', 'YYYY-MM-DD'));

INSERT INTO invest_doc (invest_doc_id, invest_id, doc_name, file_url)
VALUES (3, 5, '재조사 결과서', '/uploads/investigation/5/result.pdf');

INSERT INTO invest_doc (invest_doc_id, invest_id, doc_name, file_url)
VALUES (4, 5, '재조사 현장사진', '/uploads/investigation/5/photo.jpg');

INSERT INTO compensation_calc_doc (calc_doc_id, compensation_calc_id, doc_name, file_url)
VALUES (2, 1, '산정 근거 확인서', '/uploads/calculation/1/basis.pdf');

INSERT INTO compensation_payment_doc (payment_doc_id, compensation_payment_id, doc_name, file_url)
VALUES (2, 1, '지급 이체 확인서', '/uploads/payment/1/transfer.pdf');

INSERT INTO agriculture_damage_app (app_id, applicant_id, disaster_api_serial_number, disaster_type, product_name, production_area_serial_number, production_area, app_status, app_date)
VALUES ('REQ-2026-000137', 1, 'DIS-2026-00137', '집중호우', '배추', 'AREA-2026-00137', '인천광역시 강화군', '지급결과 확인', TO_DATE('2026-09-21', 'YYYY-MM-DD'));

INSERT INTO damage_site_invest (invest_id, app_id, investigator_name, damage_type, damage_area, damage_rate, invest_content, invest_result, invest_date)
VALUES (6, 'REQ-2026-000137', '품질담당자', '침수 피해', 1000, 40, '침수 피해 확인', '조사 완료', TO_DATE('2026-09-23', 'YYYY-MM-DD'));

INSERT INTO damage_action (damage_action_id, app_id, action_charger_name, plan_action_quantity, plan_action_area, action_type, plan_action_content, plan_action_confirm_date, action_duration_days, action_execution_date, execution_charger_name, execution_institution, execution_confirm_quantity, execution_confirm_opinion, execution_confirm_date)
VALUES (4, 'REQ-2026-000137', '품질담당자', 500, 1000, '폐기', '침수 작물 폐기', TO_DATE('2026-09-24', 'YYYY-MM-DD'), 1, TO_DATE('2026-09-25', 'YYYY-MM-DD'), '품질담당자', '품질관리과', 500, '폐기 확인', TO_DATE('2026-09-26', 'YYYY-MM-DD'));

INSERT INTO compensation_claim (compensation_claim_id, app_id, compensation_charger_name, compensation_claim_amount, compensation_claim_area, compensation_claim_quantity, claim_date)
VALUES (3, 'REQ-2026-000137', '품질담당자', 2000000, 1000, 500, TO_DATE('2026-09-27', 'YYYY-MM-DD'));

INSERT INTO compensation_calc (compensation_calc_id, compensation_claim_id, calc_charger_name, calc_institution_name, calc_criterion, calc_quantity, criterion_unit_price, difference_reason, final_compensation_amount, compensation_applied_rate, calc_completion_date)
VALUES (2, 3, '품질담당자', '품질관리과', '침수 작물 보상 기준', 500, 4000, '지원율 80% 적용', 1600000, 80, TO_DATE('2026-09-28', 'YYYY-MM-DD'));

INSERT INTO compensation_payment (compensation_payment_id, compensation_claim_id, payment_charger_name, payment_institution, recipient_name, payment_account_number, payment_decision_date, payment_completion_date, payment_amount)
VALUES (2, 3, '품질담당자', '보상지원과', '김민아', '테스트계좌-0137', TO_DATE('2026-09-29', 'YYYY-MM-DD'), TO_DATE('2026-09-29', 'YYYY-MM-DD'), 1600000);

INSERT INTO app_doc (app_doc_id, app_id, doc_name, file_url)
VALUES (4, 'REQ-2026-000137', '확인서', '/uploads/test137/app_doc/1.pdf');

INSERT INTO app_doc (app_doc_id, app_id, doc_name, file_url)
VALUES (5, 'REQ-2026-000137', '증빙자료', '/uploads/test137/app_doc/2.pdf');

INSERT INTO invest_doc (invest_doc_id, invest_id, doc_name, file_url)
VALUES (5, 6, '확인서', '/uploads/test137/invest_doc/1.pdf');

INSERT INTO invest_doc (invest_doc_id, invest_id, doc_name, file_url)
VALUES (6, 6, '증빙자료', '/uploads/test137/invest_doc/2.pdf');

INSERT INTO damage_action_doc (action_doc_id, action_id, doc_name, file_url)
VALUES (3, 4, '확인서', '/uploads/test137/damage_action_doc/1.pdf');

INSERT INTO damage_action_doc (action_doc_id, action_id, doc_name, file_url)
VALUES (4, 4, '증빙자료', '/uploads/test137/damage_action_doc/2.pdf');

INSERT INTO compensation_claim_doc (claim_doc_id, compensation_claim_id, doc_name, submission_place, submission_date, file_url, reviewer_name, confirm_date)
VALUES (3, 3, '확인서', '신청인', TO_DATE('2026-09-27', 'YYYY-MM-DD'), '/uploads/test137/compensation_claim_doc/1.pdf', '품질담당자', TO_DATE('2026-09-28', 'YYYY-MM-DD'));

INSERT INTO compensation_claim_doc (claim_doc_id, compensation_claim_id, doc_name, submission_place, submission_date, file_url, reviewer_name, confirm_date)
VALUES (4, 3, '증빙자료', '신청인', TO_DATE('2026-09-27', 'YYYY-MM-DD'), '/uploads/test137/compensation_claim_doc/2.pdf', '품질담당자', TO_DATE('2026-09-28', 'YYYY-MM-DD'));

INSERT INTO compensation_calc_doc (calc_doc_id, compensation_calc_id, doc_name, file_url)
VALUES (3, 2, '확인서', '/uploads/test137/compensation_calc_doc/1.pdf');

INSERT INTO compensation_calc_doc (calc_doc_id, compensation_calc_id, doc_name, file_url)
VALUES (4, 2, '증빙자료', '/uploads/test137/compensation_calc_doc/2.pdf');

INSERT INTO compensation_payment_doc (payment_doc_id, compensation_payment_id, doc_name, file_url)
VALUES (3, 2, '확인서', '/uploads/test137/compensation_payment_doc/1.pdf');

INSERT INTO compensation_payment_doc (payment_doc_id, compensation_payment_id, doc_name, file_url)
VALUES (4, 2, '증빙자료', '/uploads/test137/compensation_payment_doc/2.pdf');

-- 검증 후 수동 COMMIT;
