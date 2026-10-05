-- 기존 Oracle 개발 DB에서 CLAIM_ID 컬럼을 사용하는 경우에만 1회 실행.
-- 신규 스키마에는 실행하지 않는다. Oracle DDL은 암묵적 COMMIT을 수행한다.
ALTER TABLE compensation_calc RENAME COLUMN claim_id TO compensation_claim_id;

SELECT column_name
FROM user_tab_columns
WHERE table_name = 'COMPENSATION_CALC'
  AND column_name IN ('CLAIM_ID', 'COMPENSATION_CLAIM_ID');
-- 기대 결과: COMPENSATION_CLAIM_ID 1건
