-- Oracle: 적용 대상 개발 스키마로 접속한 상태에서 실행.
-- 요청된 세 관계를 데이터 수준에서 검증한다. 데이터/DDL 변경 없음.
SET SERVEROUTPUT ON
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
DECLARE
    n NUMBER;
    PROCEDURE require_many(p_table VARCHAR2, p_fk VARCHAR2) IS
    BEGIN
        EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM (SELECT ' || p_fk ||
            ' FROM ' || p_table || ' GROUP BY ' || p_fk || ' HAVING COUNT(*) > 1)' INTO n;
        IF n = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Missing 1:N sample: ' || p_table || '.' || p_fk);
        END IF;
        DBMS_OUTPUT.PUT_LINE('PASS 1:N ' || p_table || '.' || p_fk);
    END;
BEGIN
    require_many('agriculture_damage_app', 'applicant_id');
    require_many('damage_site_invest', 'app_id');
    require_many('app_doc', 'app_id');
    require_many('invest_doc', 'invest_id');
    require_many('damage_action_doc', 'action_id');
    require_many('compensation_claim_doc', 'compensation_claim_id');
    require_many('compensation_calc_doc', 'compensation_calc_id');
    require_many('compensation_payment_doc', 'compensation_payment_id');
    SELECT COUNT(*) INTO n FROM quality_assurance_officer
    WHERE username = 'quality01' AND password = 'quality1234';
    IF n <> 1 THEN RAISE_APPLICATION_ERROR(-20002, 'Expected one quality01 account'); END IF;
    SELECT COUNT(*) INTO n FROM quality_assurance_officer WHERE LOWER(username) LIKE 'admin%';
    IF n <> 0 THEN RAISE_APPLICATION_ERROR(-20003, 'Admin sample accounts remain'); END IF;
    DBMS_OUTPUT.PUT_LINE('PASS quality01 login / no admin accounts');
END;
/
