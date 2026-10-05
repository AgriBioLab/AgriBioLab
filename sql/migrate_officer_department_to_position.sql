-- 기존 department 컬럼을 사용하는 개발 DB에 1회 실행합니다.
-- Oracle DDL은 자동 COMMIT됩니다. 신규 DB는 수정된 01_create_tables.sql을 사용합니다.
ALTER TABLE quality_assurance_officer RENAME COLUMN department TO position;
UPDATE quality_assurance_officer SET position = '품질담당자', name = '이*규' WHERE username = 'quality01';
COMMIT;
SELECT position, name FROM quality_assurance_officer WHERE username = 'quality01';
