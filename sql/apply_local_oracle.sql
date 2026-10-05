-- Eclipse New Oracle(0): 127.0.0.1:1521:xe / HR
-- 프로젝트 테이블이 없는 로컬 개발 DB 최초 구성용. 기존 스키마에는 재실행 금지.
-- SQL*Plus에서 현재 폴더를 프로젝트 루트로 두고 OS 인증 SYSDBA로 실행.
SET SQLBLANKLINES ON
SET SERVEROUTPUT ON
SET DEFINE OFF
WHENEVER OSERROR EXIT FAILURE ROLLBACK
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
ALTER SESSION SET CURRENT_SCHEMA = HR;
DECLARE
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n FROM all_tables WHERE owner = 'HR'
      AND table_name IN ('APPLICANT','AGRICULTURE_DAMAGE_APP','QUALITY_ASSURANCE_OFFICER',
      'COMPENSATION_CLAIM','COMPENSATION_CALC','COMPENSATION_PAYMENT','DAMAGE_SITE_INVEST',
      'DAMAGE_ACTION','APP_DOC','INVEST_DOC','DAMAGE_ACTION_DOC','COMPENSATION_CLAIM_DOC',
      'COMPENSATION_CALC_DOC','COMPENSATION_PAYMENT_DOC');
    IF n <> 0 THEN RAISE_APPLICATION_ERROR(-20010, 'Project tables already exist; inspect before applying'); END IF;
END;
/
@sql/01_create_tables.sql
@sql/02_create_constraints.sql
@sql/03_create_sequences.sql
@sql/sample_data.sql
@sql/verify_sample_relationships.sql
@sql/sample_data_checks.sql
EXIT SUCCESS
