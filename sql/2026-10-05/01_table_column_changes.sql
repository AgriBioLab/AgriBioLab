-- 2026-10-05 / 기존 ZIP 기준 개발 DB의 컬럼 변경 (1회 실행)
-- 이미 변경된 DB 또는 신규 생성 DB에는 실행하지 않습니다.
-- 테이블명 변경 없음. Oracle DDL은 자동 COMMIT됩니다.

-- 기존 Oracle 개발 DB에서 CLAIM_ID 컬럼을 사용하는 경우에만 1회 실행.
-- 신규 스키마에는 실행하지 않는다. Oracle DDL은 암묵적 COMMIT을 수행한다.
ALTER TABLE compensation_calc RENAME COLUMN claim_id TO compensation_claim_id;

SELECT column_name
FROM user_tab_columns
WHERE table_name = 'COMPENSATION_CALC'
  AND column_name IN ('CLAIM_ID', 'COMPENSATION_CLAIM_ID');
-- 기대 결과: COMPENSATION_CLAIM_ID 1건

-- 기존 department 컬럼을 사용하는 개발 DB에 1회 실행합니다.
-- Oracle DDL은 자동 COMMIT됩니다. 신규 DB는 수정된 01_create_tables.sql을 사용합니다.
ALTER TABLE quality_assurance_officer RENAME COLUMN department TO position;
UPDATE quality_assurance_officer SET position = '품질담당자', name = '이*규' WHERE username = 'quality01';
COMMIT;
SELECT position, name FROM quality_assurance_officer WHERE username = 'quality01';
