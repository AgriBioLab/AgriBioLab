-- =========================================================
-- 04. SELECT CHECK
-- Oracle
-- Run after sample data insert.
-- =========================================================

-- 전체 테이블 목록 확인
SELECT table_name
FROM user_tables
ORDER BY table_name;

-- 각 테이블 조회
SELECT * FROM applicant;
SELECT * FROM agriculture_damage_app;
SELECT * FROM damage_site_invest;
SELECT * FROM damage_action;
SELECT * FROM compensation_claim;
SELECT * FROM compensation_calc;
SELECT * FROM compensation_payment;
SELECT * FROM quality_assurance_officer;
SELECT * FROM app_doc;
SELECT * FROM invest_doc;
SELECT * FROM damage_action_doc;
SELECT * FROM compensation_claim_doc;
SELECT * FROM compensation_calc_doc;
SELECT * FROM compensation_payment_doc;


