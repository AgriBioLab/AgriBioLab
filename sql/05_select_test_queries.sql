/*
 * AgriComp 1st sprint SELECT verification queries - Oracle
 *
 * DAO design note:
 *   - Do not create a separate damage-action DAO for this sprint.
 *   - The compensation detail DAO should include action and survey summary fields
 *     in CompensationDetailVO through LEFT JOINs.
 */

/* 1. Compensation list: payment-result view */
SELECT
    a.apply_no,
    CASE a.target_type
        WHEN 'PRODUCER' THEN '생산자'
        WHEN 'DISTRIBUTOR' THEN '유통자'
        WHEN 'SELLER' THEN '판매자'
    END AS target_type_name,
    NVL(a.business_name, '-') AS business_name,
    SUBSTR(a.owner_name, 1, 1) || '*' || SUBSTR(a.owner_name, -1) AS owner_name_masked,
    a.item_name,
    c.final_amount,
    c.payment_date,
    c.payment_org_name
FROM damage_application a
JOIN compensation c
  ON c.application_id = a.application_id
WHERE (:start_date IS NULL OR c.payment_date >= :start_date)
  AND (:end_date IS NULL OR c.payment_date < :end_date + 1)
  AND (:apply_no IS NULL OR a.apply_no = :apply_no)
  AND (:biz_name IS NULL OR a.business_name LIKE '%' || :biz_name || '%')
  AND (:owner_name IS NULL OR a.owner_name LIKE '%' || :owner_name || '%')
  AND (:target_type IS NULL OR a.target_type = :target_type)
  AND (:item_name IS NULL OR a.item_name LIKE '%' || :item_name || '%')
ORDER BY c.payment_date DESC NULLS LAST, a.apply_no DESC;

/* 2. Compensation detail: one row for CompensationDetailVO */
SELECT
    a.apply_no,
    a.target_type,
    CASE a.target_type
        WHEN 'PRODUCER' THEN '생산자'
        WHEN 'DISTRIBUTOR' THEN '유통자'
        WHEN 'SELLER' THEN '판매자'
    END AS target_type_name,
    a.business_name,
    a.owner_name,
    a.disaster_type,
    a.item_name,
    a.production_place,
    c.request_amount,
    c.request_date,
    c.request_qty_kg,
    c.request_area_m2,
    c.basis_name,
    c.unit_price,
    c.apply_rate,
    c.calculation_formula_text,
    c.adjustment_reason,
    c.calculation_org_name,
    c.calculation_manager_name,
    c.calculated_at,
    c.final_amount,
    c.payment_confirmed_at,
    c.payment_date,
    c.payment_org_name,
    c.payment_manager_name,
    c.payee_name,
    c.masked_account_no,
    c.payment_exclusion_reason,
    ar.action_method,
    ar.plan_content,
    ar.actual_action_qty_kg,
    ar.result_checked_at,
    s.survey_completed_at,
    s.final_survey_round,
    s.final_damage_rate,
    s.final_damage_area_m2
FROM damage_application a
JOIN compensation c
  ON c.application_id = a.application_id
LEFT JOIN damage_action_result ar
  ON ar.application_id = a.application_id
LEFT JOIN damage_survey s
  ON s.application_id = a.application_id
WHERE a.apply_no = :apply_no;

/* 3. Compensation detail attachments */
SELECT
    f.file_id,
    f.file_category,
    f.document_name,
    f.submit_source,
    f.submitted_at,
    f.checked_yn,
    CASE f.checked_yn
        WHEN 'Y' THEN '서류 확인 완료'
        ELSE '서류 확인 전'
    END AS checked_text,
    f.checked_at,
    f.checked_by,
    f.file_path
FROM attachment_file f
JOIN damage_application a
  ON a.application_id = f.application_id
LEFT JOIN compensation c
  ON c.compensation_id = f.compensation_id
WHERE a.apply_no = :apply_no
  AND (:file_category IS NULL OR f.file_category = :file_category)
ORDER BY f.file_category, f.submitted_at DESC, f.file_id DESC;

/* 4. Login: active manager lookup */
SELECT
    manager_id,
    login_id,
    password_hash,
    manager_name,
    role_cd,
    use_yn,
    last_login_at
FROM quality_manager
WHERE login_id = :login_id
  AND use_yn = 'Y';

/* 5. Login success: update last login time */
UPDATE quality_manager
   SET last_login_at = SYSDATE
 WHERE manager_id = :manager_id
   AND use_yn = 'Y';

/* 6. Verification: list must not depend on independent status columns */
SELECT
    a.apply_no,
    c.final_amount,
    c.payment_date,
    c.payment_org_name,
    CASE
        WHEN c.final_amount > 0
         AND c.payment_date IS NOT NULL
         AND c.payment_org_name IS NOT NULL
        THEN '지급 결과 확인 가능'
        ELSE '지급 결과 추가 확인 필요'
    END AS payment_result_check
FROM damage_application a
JOIN compensation c
  ON c.application_id = a.application_id
ORDER BY a.apply_no DESC;

/* 7. Verification: expected sample list row count */
SELECT COUNT(*) AS compensation_list_count
FROM damage_application a
JOIN compensation c
  ON c.application_id = a.application_id
WHERE c.payment_date IS NOT NULL;
