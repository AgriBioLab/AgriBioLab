-- =========================================================
-- 03. CREATE SEQUENCES
-- Oracle
-- Run after 02_create_constraints.sql.
-- =========================================================

CREATE SEQUENCE seq_compensation_claim_doc
    START WITH 5
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_damage_action
    START WITH 5
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_compensation_calc_doc
    START WITH 5
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_compensation_payment
    START WITH 3
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_invest_doc
    START WITH 7
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_compensation_claim
    START WITH 4
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_damage_action_doc
    START WITH 5
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_compensation_payment_doc
    START WITH 5
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_quality_assurance_officer
    START WITH 4
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_app_doc
    START WITH 6
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_applicant
    START WITH 6
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_damage_site_invest
    START WITH 7
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_compensation_calc
    START WITH 3
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
