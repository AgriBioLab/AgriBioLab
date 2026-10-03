/*
 * AgriComp 1st sprint sample data - Oracle
 * Run after 01_create_tables.sql, 02_create_constraints.sql, 03_create_sequences.sql.
 *
 * Password sample:
 *   quality01 / quality1234
 *   password_hash stores SHA-256('quality1234') for early DAO tests.
 *   Replace with the team's final password-hashing rule before production use.
 */

INSERT INTO quality_manager (
    manager_id,
    login_id,
    password_hash,
    manager_name,
    role_cd,
    use_yn,
    last_login_at
) VALUES (
    quality_manager_seq.NEXTVAL,
    'quality01',
    '3798a35d7946bf07e4bcd7492b38487908478a5799b625cb77cfaf296e11564c',
    '홍길동',
    'QUALITY_VIEWER',
    'Y',
    TO_DATE('2026-10-03 09:10:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO quality_manager (
    manager_id,
    login_id,
    password_hash,
    manager_name,
    role_cd,
    use_yn,
    last_login_at
) VALUES (
    quality_manager_seq.NEXTVAL,
    'inactive01',
    '3798a35d7946bf07e4bcd7492b38487908478a5799b625cb77cfaf296e11564c',
    '미사용',
    'QUALITY_VIEWER',
    'N',
    NULL
);

INSERT INTO damage_application (
    application_id,
    apply_no,
    target_type,
    business_name,
    owner_name,
    disaster_type,
    item_name,
    production_place
) VALUES (
    damage_application_seq.NEXTVAL,
    'REQ-2026-000136',
    'PRODUCER',
    '행복농장',
    '김현아',
    '집중호우',
    '사과',
    '○○시 ○○읍'
);

INSERT INTO damage_application (
    application_id,
    apply_no,
    target_type,
    business_name,
    owner_name,
    disaster_type,
    item_name,
    production_place
) VALUES (
    damage_application_seq.NEXTVAL,
    'REQ-2026-000133',
    'DISTRIBUTOR',
    '새벽유통',
    '이민준',
    '우박',
    '배',
    '○○시 △△면'
);

INSERT INTO damage_application (
    application_id,
    apply_no,
    target_type,
    business_name,
    owner_name,
    disaster_type,
    item_name,
    production_place
) VALUES (
    damage_application_seq.NEXTVAL,
    'REQ-2026-000132',
    'SELLER',
    '한빛청과',
    '박서연',
    '태풍',
    '복숭아',
    '○○시 □□동'
);

INSERT INTO compensation (
    compensation_id,
    application_id,
    request_amount,
    request_date,
    request_qty_kg,
    request_area_m2,
    basis_name,
    unit_price,
    apply_rate,
    calculation_formula_text,
    adjustment_reason,
    calculation_org_name,
    calculation_manager_name,
    calculated_at,
    final_amount,
    payment_confirmed_at,
    payment_date,
    payment_org_name,
    payment_manager_name,
    payee_name,
    masked_account_no,
    payment_exclusion_reason
) VALUES (
    compensation_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    9590000,
    TO_DATE('2026-09-18', 'YYYY-MM-DD'),
    1370,
    2400,
    '○○ 농산물 재해 피해 지원 기준 (제2026-○○호)',
    7000,
    80,
    '실제 조치 수량 1,200kg × 단가 7,000원 × 지원율 80% = 6,720,000원',
    '보상 신청 수량 1,370kg 대신 실제 조치 수량 1,200kg에 지원율 80% 적용',
    '○○도 보상산정기관',
    '이산정',
    TO_DATE('2026-09-26', 'YYYY-MM-DD'),
    6720000,
    TO_DATE('2026-09-29', 'YYYY-MM-DD'),
    TO_DATE('2026-09-30', 'YYYY-MM-DD'),
    '○○도 보상지급기관',
    '박지급',
    '김현아',
    '농협 ****-**-1234',
    NULL
);

INSERT INTO compensation (
    compensation_id,
    application_id,
    request_amount,
    request_date,
    request_qty_kg,
    request_area_m2,
    basis_name,
    unit_price,
    apply_rate,
    calculation_formula_text,
    adjustment_reason,
    calculation_org_name,
    calculation_manager_name,
    calculated_at,
    final_amount,
    payment_confirmed_at,
    payment_date,
    payment_org_name,
    payment_manager_name,
    payee_name,
    masked_account_no,
    payment_exclusion_reason
) VALUES (
    compensation_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000133'),
    4200000,
    TO_DATE('2026-09-15', 'YYYY-MM-DD'),
    800,
    0,
    '○○ 농산물 재해 피해 지원 기준 (제2026-○○호)',
    5000,
    80,
    '실제 조치 수량 800kg × 단가 5,000원 × 지원율 80% = 3,200,000원',
    '실제 조치 수량 기준 적용',
    '○○도 보상산정기관',
    '이산정',
    TO_DATE('2026-09-24', 'YYYY-MM-DD'),
    3200000,
    TO_DATE('2026-09-28', 'YYYY-MM-DD'),
    TO_DATE('2026-09-29', 'YYYY-MM-DD'),
    '○○도 보상지급기관',
    '박지급',
    '이민준',
    '농협 ****-**-5678',
    NULL
);

INSERT INTO compensation (
    compensation_id,
    application_id,
    request_amount,
    request_date,
    request_qty_kg,
    request_area_m2,
    basis_name,
    unit_price,
    apply_rate,
    calculation_formula_text,
    adjustment_reason,
    calculation_org_name,
    calculation_manager_name,
    calculated_at,
    final_amount,
    payment_confirmed_at,
    payment_date,
    payment_org_name,
    payment_manager_name,
    payee_name,
    masked_account_no,
    payment_exclusion_reason
) VALUES (
    compensation_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000132'),
    2300000,
    TO_DATE('2026-09-14', 'YYYY-MM-DD'),
    370,
    0,
    '○○ 농산물 재해 피해 지원 기준 (제2026-○○호)',
    5000,
    100,
    '실제 조치 수량 370kg × 단가 5,000원 × 지원율 100% = 1,850,000원',
    '현장조사 반영 수량 기준 적용',
    '○○도 보상산정기관',
    '이산정',
    TO_DATE('2026-09-22', 'YYYY-MM-DD'),
    1850000,
    TO_DATE('2026-09-27', 'YYYY-MM-DD'),
    TO_DATE('2026-09-28', 'YYYY-MM-DD'),
    '○○도 보상지급기관',
    '박지급',
    '박서연',
    '농협 ****-**-9012',
    NULL
);

INSERT INTO damage_action_result (
    action_result_id,
    application_id,
    action_method,
    plan_content,
    actual_action_qty_kg,
    result_checked_at
) VALUES (
    damage_action_result_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    '매몰 폐기',
    '피해 과실 전량 수거 후 매몰 폐기',
    1200,
    TO_DATE('2026-09-25', 'YYYY-MM-DD')
);

INSERT INTO damage_action_result (
    action_result_id,
    application_id,
    action_method,
    plan_content,
    actual_action_qty_kg,
    result_checked_at
) VALUES (
    damage_action_result_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000133'),
    '격리 보관',
    '피해 물량 선별 후 격리 보관',
    800,
    TO_DATE('2026-09-23', 'YYYY-MM-DD')
);

INSERT INTO damage_action_result (
    action_result_id,
    application_id,
    action_method,
    plan_content,
    actual_action_qty_kg,
    result_checked_at
) VALUES (
    damage_action_result_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000132'),
    '폐기 처리',
    '판매 부적합 물량 폐기 처리',
    370,
    TO_DATE('2026-09-21', 'YYYY-MM-DD')
);

INSERT INTO damage_survey (
    survey_id,
    application_id,
    survey_completed_at,
    final_survey_round,
    final_damage_rate,
    final_damage_area_m2
) VALUES (
    damage_survey_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    TO_DATE('2026-09-20', 'YYYY-MM-DD'),
    2,
    35.5,
    2100
);

INSERT INTO damage_survey (
    survey_id,
    application_id,
    survey_completed_at,
    final_survey_round,
    final_damage_rate,
    final_damage_area_m2
) VALUES (
    damage_survey_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000133'),
    TO_DATE('2026-09-19', 'YYYY-MM-DD'),
    1,
    22.0,
    0
);

INSERT INTO damage_survey (
    survey_id,
    application_id,
    survey_completed_at,
    final_survey_round,
    final_damage_rate,
    final_damage_area_m2
) VALUES (
    damage_survey_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000132'),
    TO_DATE('2026-09-18', 'YYYY-MM-DD'),
    1,
    18.5,
    0
);

INSERT INTO attachment_file (
    file_id,
    application_id,
    compensation_id,
    file_category,
    document_name,
    submit_source,
    submitted_at,
    checked_yn,
    checked_at,
    checked_by,
    file_path
) VALUES (
    attachment_file_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    NULL,
    'APPLY',
    '피해신청서',
    '신청인',
    TO_DATE('2026-09-10', 'YYYY-MM-DD'),
    'Y',
    TO_DATE('2026-09-11', 'YYYY-MM-DD'),
    '이확인',
    '/files/apply/REQ-2026-000136/application.pdf'
);

INSERT INTO attachment_file (
    file_id,
    application_id,
    compensation_id,
    file_category,
    document_name,
    submit_source,
    submitted_at,
    checked_yn,
    checked_at,
    checked_by,
    file_path
) VALUES (
    attachment_file_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    NULL,
    'APPLY',
    '농업경영체 등록확인서',
    '신청인',
    TO_DATE('2026-09-10', 'YYYY-MM-DD'),
    'Y',
    TO_DATE('2026-09-11', 'YYYY-MM-DD'),
    '이확인',
    '/files/apply/REQ-2026-000136/farm_register.pdf'
);

INSERT INTO attachment_file (
    file_id,
    application_id,
    compensation_id,
    file_category,
    document_name,
    submit_source,
    submitted_at,
    checked_yn,
    checked_at,
    checked_by,
    file_path
) VALUES (
    attachment_file_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    (SELECT c.compensation_id
       FROM compensation c
       JOIN damage_application a ON a.application_id = c.application_id
      WHERE a.apply_no = 'REQ-2026-000136'),
    'COMP',
    '통장 사본',
    '신청인',
    TO_DATE('2026-09-18', 'YYYY-MM-DD'),
    'Y',
    TO_DATE('2026-09-19', 'YYYY-MM-DD'),
    '이확인',
    '/files/comp/REQ-2026-000136/passbook_copy.pdf'
);

INSERT INTO attachment_file (
    file_id,
    application_id,
    compensation_id,
    file_category,
    document_name,
    submit_source,
    submitted_at,
    checked_yn,
    checked_at,
    checked_by,
    file_path
) VALUES (
    attachment_file_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    (SELECT c.compensation_id
       FROM compensation c
       JOIN damage_application a ON a.application_id = c.application_id
      WHERE a.apply_no = 'REQ-2026-000136'),
    'COMP',
    '보상금 지급 요청서',
    '신청인',
    TO_DATE('2026-09-18', 'YYYY-MM-DD'),
    'Y',
    TO_DATE('2026-09-19', 'YYYY-MM-DD'),
    '이확인',
    '/files/comp/REQ-2026-000136/payment_request.pdf'
);

INSERT INTO attachment_file (
    file_id,
    application_id,
    compensation_id,
    file_category,
    document_name,
    submit_source,
    submitted_at,
    checked_yn,
    checked_at,
    checked_by,
    file_path
) VALUES (
    attachment_file_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    (SELECT c.compensation_id
       FROM compensation c
       JOIN damage_application a ON a.application_id = c.application_id
      WHERE a.apply_no = 'REQ-2026-000136'),
    'COMP',
    '보상금 산정 내역서',
    '보상산정기관',
    TO_DATE('2026-09-26', 'YYYY-MM-DD'),
    'Y',
    TO_DATE('2026-09-26', 'YYYY-MM-DD'),
    '이산정',
    '/files/comp/REQ-2026-000136/calculation_statement.pdf'
);

INSERT INTO attachment_file (
    file_id,
    application_id,
    compensation_id,
    file_category,
    document_name,
    submit_source,
    submitted_at,
    checked_yn,
    checked_at,
    checked_by,
    file_path
) VALUES (
    attachment_file_seq.NEXTVAL,
    (SELECT application_id FROM damage_application WHERE apply_no = 'REQ-2026-000136'),
    (SELECT c.compensation_id
       FROM compensation c
       JOIN damage_application a ON a.application_id = c.application_id
      WHERE a.apply_no = 'REQ-2026-000136'),
    'COMP',
    '지급 결정 통지서',
    '보상지급기관',
    TO_DATE('2026-09-30', 'YYYY-MM-DD'),
    'Y',
    TO_DATE('2026-09-30', 'YYYY-MM-DD'),
    '박지급',
    '/files/comp/REQ-2026-000136/payment_notice.pdf'
);

COMMIT;
