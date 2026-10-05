-- =========================================================
-- SAMPLE DATA
-- Oracle
-- Run after 03_create_sequences.sql.
-- =========================================================

-- 신청자
INSERT INTO applicant (
    applicant_id,
    representative_name,
    organization_name,
    app_category,
    postal_code,
    address,
    address_detail
) VALUES (
    1,
    '김민아',
    '행복농장',
    '생산자',
    '21001',
    '인천광역시 강화군',
    '강화읍 농장로 123'
);

INSERT INTO applicant (
    applicant_id,
    representative_name,
    organization_name,
    app_category,
    postal_code,
    address,
    address_detail
) VALUES (
    2,
    '이준호',
    '푸른들농장',
    '생산자',
    '21002',
    '인천광역시 강화군',
    '길상면 농업로 25'
);

INSERT INTO applicant (
    applicant_id,
    representative_name,
    organization_name,
    app_category,
    postal_code,
    address,
    address_detail
) VALUES (
    3,
    '박서연',
    '새봄농원',
    '생산자',
    '21003',
    '경기도 김포시',
    '통진읍 농원길 18'
);

INSERT INTO applicant (
    applicant_id,
    representative_name,
    organization_name,
    app_category,
    postal_code,
    address,
    address_detail
) VALUES (
    4,
    '최현우',
    '한결농산',
    '생산자',
    '21004',
    '경기도 파주시',
    '조리읍 들판로 72'
);

INSERT INTO applicant (
    applicant_id,
    representative_name,
    organization_name,
    app_category,
    postal_code,
    address,
    address_detail
) VALUES (
    5,
    '정수진',
    '햇살농장',
    '생산자',
    '21005',
    '경기도 이천시',
    '장호원읍 농촌길 41'
);

-- 피해 신청
INSERT INTO agriculture_damage_app (
    app_id,
    applicant_id,
    disaster_api_serial_number,
    disaster_type,
    product_name,
    production_area_serial_number,
    production_area,
    app_status,
    app_date
) VALUES (
    'REQ-2026-000131',
    1,
    'DIS-2026-00131',
    '우박',
    '배',
    'AREA-2026-00131',
    '인천광역시 강화군',
    '피해신청 접수',
    TO_DATE('2026-09-20', 'YYYY-MM-DD')
);

INSERT INTO agriculture_damage_app (
    app_id,
    applicant_id,
    disaster_api_serial_number,
    disaster_type,
    product_name,
    production_area_serial_number,
    production_area,
    app_status,
    app_date
) VALUES (
    'REQ-2026-000132',
    2,
    'DIS-2026-00132',
    '폭염',
    '복숭아',
    'AREA-2026-00132',
    '인천광역시 강화군',
    '현장조사 결과 등록',
    TO_DATE('2026-09-21', 'YYYY-MM-DD')
);

INSERT INTO agriculture_damage_app (
    app_id,
    applicant_id,
    disaster_api_serial_number,
    disaster_type,
    product_name,
    production_area_serial_number,
    production_area,
    app_status,
    app_date
) VALUES (
    'REQ-2026-000133',
    3,
    'DIS-2026-00133',
    '태풍',
    '포도',
    'AREA-2026-00133',
    '경기도 김포시',
    '조치 방법 확정',
    TO_DATE('2026-09-22', 'YYYY-MM-DD')
);

INSERT INTO agriculture_damage_app (
    app_id,
    applicant_id,
    disaster_api_serial_number,
    disaster_type,
    product_name,
    production_area_serial_number,
    production_area,
    app_status,
    app_date
) VALUES (
    'REQ-2026-000134',
    4,
    'DIS-2026-00134',
    '병해충',
    '배추',
    'AREA-2026-00134',
    '경기도 파주시',
    '조치 수행 결과 확인',
    TO_DATE('2026-09-23', 'YYYY-MM-DD')
);

-- JSP 상세 화면에 사용하는 데이터
INSERT INTO agriculture_damage_app (
    app_id,
    applicant_id,
    disaster_api_serial_number,
    disaster_type,
    product_name,
    production_area_serial_number,
    production_area,
    app_status,
    app_date
) VALUES (
    'REQ-2026-000136',
    1,
    'DIS-2026-00136',
    '병해충',
    '사과',
    'AREA-2026-00136',
    '행복농장',
    '지급결과 확인',
    TO_DATE('2026-09-20', 'YYYY-MM-DD')
);

-- 현장 조사
INSERT INTO damage_site_invest (
    invest_id,
    app_id,
    investigator_name,
    damage_type,
    damage_area,
    damage_rate,
    invest_content,
    invest_result,
    invest_date
) VALUES (
    1,
    'REQ-2026-000132',
    '박민수',
    '폭염 피해',
    2200,
    45,
    '고온으로 인한 작물 생육 저하 및 상품성 저하가 확인됨.',
    '피해 인정',
    TO_DATE('2026-09-24', 'YYYY-MM-DD')
);

INSERT INTO damage_site_invest (
    invest_id,
    app_id,
    investigator_name,
    damage_type,
    damage_area,
    damage_rate,
    invest_content,
    invest_result,
    invest_date
) VALUES (
    2,
    'REQ-2026-000133',
    '김민수',
    '태풍 피해',
    3100,
    60,
    '강풍으로 인한 포도나무 및 과실 피해가 확인됨.',
    '피해 인정',
    TO_DATE('2026-09-25', 'YYYY-MM-DD')
);

INSERT INTO damage_site_invest (
    invest_id,
    app_id,
    investigator_name,
    damage_type,
    damage_area,
    damage_rate,
    invest_content,
    invest_result,
    invest_date
) VALUES (
    3,
    'REQ-2026-000134',
    '이현우',
    '병해충 피해',
    2800,
    65,
    '병해충 발생으로 인해 배추 상품성 저하가 확인됨.',
    '피해 인정',
    TO_DATE('2026-09-26', 'YYYY-MM-DD')
);

-- JSP 상세 화면용
INSERT INTO damage_site_invest (
    invest_id,
    app_id,
    investigator_name,
    damage_type,
    damage_area,
    damage_rate,
    invest_content,
    invest_result,
    invest_date
) VALUES (
    4,
    'REQ-2026-000136',
    '박민수',
    '병해충 피해',
    3500,
    70,
    '병해충으로 인한 사과 과실 피해를 확인하였으며 일부 물량은 폐기 조치가 필요함.',
    '피해 인정',
    TO_DATE('2026-09-24', 'YYYY-MM-DD')
);

-- 피해 조치
INSERT INTO damage_action (
    damage_action_id,
    app_id,
    action_charger_name,
    plan_action_quantity,
    plan_action_area,
    action_type,
    plan_action_content,
    plan_action_confirm_date,
    action_duration_days,
    action_execution_date,
    execution_charger_name,
    execution_institution,
    execution_confirm_quantity,
    execution_confirm_opinion,
    execution_confirm_date
) VALUES (
    1,
    'REQ-2026-000133',
    '김민수',
    900,
    3100,
    '폐기',
    '피해 과실 수거 후 폐기',
    TO_DATE('2026-09-26', 'YYYY-MM-DD'),
    3,
    TO_DATE('2026-09-29', 'YYYY-MM-DD'),
    '김민수',
    '○○군 농업기술센터',
    850,
    '계획 물량 중 850kg 폐기 완료',
    TO_DATE('2026-09-29', 'YYYY-MM-DD')
);

INSERT INTO damage_action (
    damage_action_id,
    app_id,
    action_charger_name,
    plan_action_quantity,
    plan_action_area,
    action_type,
    plan_action_content,
    plan_action_confirm_date,
    action_duration_days,
    action_execution_date,
    execution_charger_name,
    execution_institution,
    execution_confirm_quantity,
    execution_confirm_opinion,
    execution_confirm_date
) VALUES (
    2,
    'REQ-2026-000134',
    '이현우',
    1100,
    2800,
    '폐기',
    '피해 배추 수거 후 폐기',
    TO_DATE('2026-09-27', 'YYYY-MM-DD'),
    2,
    TO_DATE('2026-09-29', 'YYYY-MM-DD'),
    '이현우',
    '○○시 농업기술센터',
    1050,
    '대상 물량의 대부분 폐기 완료',
    TO_DATE('2026-09-29', 'YYYY-MM-DD')
);

-- JSP 상세 화면용
INSERT INTO damage_action (
    damage_action_id,
    app_id,
    action_charger_name,
    plan_action_quantity,
    plan_action_area,
    action_type,
    plan_action_content,
    plan_action_confirm_date,
    action_duration_days,
    action_execution_date,
    execution_charger_name,
    execution_institution,
    execution_confirm_quantity,
    execution_confirm_opinion,
    execution_confirm_date
) VALUES (
    3,
    'REQ-2026-000136',
    '박민수',
    1370,
    3500,
    '폐기',
    '피해 과실 전량 수거 후 매몰 폐기',
    TO_DATE('2026-09-26', 'YYYY-MM-DD'),
    3,
    TO_DATE('2026-09-28', 'YYYY-MM-DD'),
    '박민수',
    '○○도 농업기술센터',
    1200,
    '실제 조치 수량 1,200kg 폐기 완료',
    TO_DATE('2026-09-28', 'YYYY-MM-DD')
);

-- 보상 신청
INSERT INTO compensation_claim (
    compensation_claim_id,
    app_id,
    compensation_charger_name,
    compensation_claim_amount,
    compensation_claim_area,
    compensation_claim_quantity,
    claim_date
) VALUES (
    1,
    'REQ-2026-000134',
    '이현우',
    7700000,
    2800,
    1100,
    TO_DATE('2026-09-29', 'YYYY-MM-DD')
);

-- JSP 상세 화면용
INSERT INTO compensation_claim (
    compensation_claim_id,
    app_id,
    compensation_charger_name,
    compensation_claim_amount,
    compensation_claim_area,
    compensation_claim_quantity,
    claim_date
) VALUES (
    2,
    'REQ-2026-000136',
    '박민수',
    9590000,
    3800,
    1370,
    TO_DATE('2026-09-29', 'YYYY-MM-DD')
);

-- 보상금 산정
INSERT INTO compensation_calc (
    compensation_calc_id,
    compensation_claim_id,
    calc_charger_name,
    calc_institution_name,
    calc_criterion,
    calc_quantity,
    criterion_unit_price,
    difference_reason,
    final_compensation_amount,
    compensation_applied_rate,
    calc_completion_date
) VALUES (
    1,
    2,
    '박민수',
    '○○도 보상산정기관',
    '○○ 농산물 재해 피해 지원 기준 (제2026-○○호)',
    1200,
    7000,
    '보상 신청 수량 1,370kg 대신 실제 조치 수량 1,200kg에 지원율 80% 적용',
    6720000,
    80,
    TO_DATE('2026-09-29', 'YYYY-MM-DD')
);

-- 보상금 지급
INSERT INTO compensation_payment (
    compensation_payment_id,
    compensation_claim_id,
    payment_charger_name,
    payment_institution,
    recipient_name,
    payment_account_number,
    payment_decision_date,
    payment_completion_date,
    payment_amount
) VALUES (
    1,
    2,
    '한소영',
    '○○도 보상지급기관',
    '김민아',
    '○○은행 ***-**-1234',
    TO_DATE('2026-09-29', 'YYYY-MM-DD'),
    TO_DATE('2026-09-30', 'YYYY-MM-DD'),
    6720000
);





-- 신청 서류
INSERT INTO app_doc (
    app_doc_id,
    app_id,
    doc_name,
    file_url
) VALUES (
    1,
    'REQ-2026-000136',
    '피해신청서',
    '/uploads/application/REQ-2026-000136/application.pdf'
);

INSERT INTO app_doc (
    app_doc_id,
    app_id,
    doc_name,
    file_url
) VALUES (
    2,
    'REQ-2026-000136',
    '농업경영체 등록확인서',
    '/uploads/application/REQ-2026-000136/business.pdf'
);

INSERT INTO app_doc (
    app_doc_id,
    app_id,
    doc_name,
    file_url
) VALUES (
    3,
    'REQ-2026-000136',
    '피해 현장 사진',
    '/uploads/application/REQ-2026-000136/damage.jpg'
);

-- 현장 조사 서류
INSERT INTO invest_doc (
    invest_doc_id,
    invest_id,
    doc_name,
    file_url
) VALUES (
    1,
    4,
    '현장조사 결과서',
    '/uploads/investigation/4/result.pdf'
);

INSERT INTO invest_doc (
    invest_doc_id,
    invest_id,
    doc_name,
    file_url
) VALUES (
    2,
    4,
    '현장조사 사진',
    '/uploads/investigation/4/photo.jpg'
);

-- 피해 조치 서류
INSERT INTO damage_action_doc (
    action_doc_id,
    action_id,
    doc_name,
    file_url
) VALUES (
    1,
    3,
    '폐기 조치 계획서',
    '/uploads/action/3/plan.pdf'
);

INSERT INTO damage_action_doc (
    action_doc_id,
    action_id,
    doc_name,
    file_url
) VALUES (
    2,
    3,
    '폐기 조치 결과 확인서',
    '/uploads/action/3/result.pdf'
);

-- 보상 신청 서류
INSERT INTO compensation_claim_doc (
    claim_doc_id,
    compensation_claim_id,
    doc_name,
    submission_place,
    submission_date,
    file_url,
    reviewer_name,
    confirm_date
) VALUES (
    1,
    2,
    '통장 사본',
    '신청인',
    TO_DATE('2026-09-21', 'YYYY-MM-DD'),
    '/uploads/compensation/2/account.pdf',
    '박민수',
    TO_DATE('2026-09-22', 'YYYY-MM-DD')
);

INSERT INTO compensation_claim_doc (
    claim_doc_id,
    compensation_claim_id,
    doc_name,
    submission_place,
    submission_date,
    file_url,
    reviewer_name,
    confirm_date
) VALUES (
    2,
    2,
    '보상금 지급 요청서',
    '신청인',
    TO_DATE('2026-09-21', 'YYYY-MM-DD'),
    '/uploads/compensation/2/payment_request.pdf',
    '박민수',
    TO_DATE('2026-09-22', 'YYYY-MM-DD')
);

-- 보상금 산정 서류
INSERT INTO compensation_calc_doc (
    calc_doc_id,
    compensation_calc_id,
    doc_name,
    file_url
) VALUES (
    1,
    1,
    '보상금 산정 내역서',
    '/uploads/calculation/1/calculation.pdf'
);

-- 보상금 지급 서류
INSERT INTO compensation_payment_doc (
    payment_doc_id,
    compensation_payment_id,
    doc_name,
    file_url
) VALUES (
    1,
    1,
    '지급 결정 통지서',
    '/uploads/payment/1/payment_notice.pdf'
);




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

COMMIT;
