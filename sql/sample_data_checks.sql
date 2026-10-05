-- 로그인 1건 / 신청자1 신청3건 / 000136 조사2건 / 문서6종 복수건 / 지급목록2건

SELECT position, name FROM quality_assurance_officer WHERE username = 'quality01' AND password = 'quality1234';

-- expected: 0
SELECT COUNT(*) AS admin_count FROM quality_assurance_officer WHERE LOWER(username) LIKE 'admin%';

SELECT applicant_id, COUNT(*) AS child_count FROM agriculture_damage_app GROUP BY applicant_id HAVING COUNT(*) > 1;

SELECT app_id, COUNT(*) AS child_count FROM damage_site_invest GROUP BY app_id HAVING COUNT(*) > 1;

SELECT compensation_claim_id, COUNT(*) AS child_count FROM compensation_claim_doc GROUP BY compensation_claim_id HAVING COUNT(*) > 1;

SELECT compensation_calc_id, COUNT(*) AS child_count FROM compensation_calc_doc GROUP BY compensation_calc_id HAVING COUNT(*) > 1;

SELECT invest_id, COUNT(*) AS child_count FROM invest_doc GROUP BY invest_id HAVING COUNT(*) > 1;

SELECT action_id, COUNT(*) AS child_count FROM damage_action_doc GROUP BY action_id HAVING COUNT(*) > 1;

SELECT compensation_payment_id, COUNT(*) AS child_count FROM compensation_payment_doc GROUP BY compensation_payment_id HAVING COUNT(*) > 1;

SELECT app_id, COUNT(*) AS child_count FROM app_doc GROUP BY app_id HAVING COUNT(*) > 1;

SELECT a.app_id, ap.organization_name, a.product_name, p.payment_completion_date, p.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON ap.applicant_id=a.applicant_id JOIN compensation_claim c ON c.app_id=a.app_id JOIN compensation_payment p ON p.compensation_claim_id=c.compensation_claim_id ORDER BY a.app_id;

SELECT invest_id, app_id, invest_date, damage_rate, damage_area FROM damage_site_invest WHERE app_id='REQ-2026-000136' ORDER BY invest_date, invest_id;
