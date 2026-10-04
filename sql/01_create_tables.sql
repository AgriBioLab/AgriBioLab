-- =========================================================
-- 01. CREATE TABLES
-- Oracle
-- Run first.
-- =========================================================

CREATE TABLE compensation_claim_doc (
    claim_doc_id NUMBER NOT NULL,
    compensation_claim_id NUMBER NOT NULL,
    doc_name VARCHAR2(100),
    submission_place VARCHAR2(50),
    submission_date DATE,
    file_url VARCHAR2(500),
    reviewer_name VARCHAR2(50),
    confirm_date DATE
);

CREATE TABLE damage_action (
    damage_action_id NUMBER NOT NULL,
    app_id VARCHAR2(50) NOT NULL,
    action_charger_name VARCHAR2(50),
    plan_action_quantity NUMBER,
    plan_action_area NUMBER,
    action_type VARCHAR2(50),
    plan_action_content VARCHAR2(500),
    plan_action_confirm_date DATE,
    action_duration_days NUMBER,
    action_execution_date DATE,
    execution_charger_name VARCHAR2(50),
    execution_institution VARCHAR2(50),
    execution_confirm_quantity NUMBER,
    execution_confirm_opinion VARCHAR2(1000),
    execution_confirm_date DATE
);

CREATE TABLE compensation_calc_doc (
    calc_doc_id NUMBER NOT NULL,
    compensation_calc_id NUMBER NOT NULL,
    doc_name VARCHAR2(100),
    file_url VARCHAR2(500)
);

CREATE TABLE compensation_payment (
    compensation_payment_id NUMBER NOT NULL,
    compensation_claim_id NUMBER NOT NULL,
    payment_charger_name VARCHAR2(50),
    payment_institution VARCHAR2(50),
    recipient_name VARCHAR2(50),
    payment_account_number VARCHAR2(50),
    payment_decision_date DATE,
    payment_completion_date DATE,
    payment_amount NUMBER
);

CREATE TABLE invest_doc (
    invest_doc_id NUMBER NOT NULL,
    invest_id NUMBER NOT NULL,
    doc_name VARCHAR2(50),
    file_url VARCHAR2(500)
);

CREATE TABLE compensation_claim (
    compensation_claim_id NUMBER NOT NULL,
    app_id VARCHAR2(50) NOT NULL,
    compensation_charger_name VARCHAR2(50) NOT NULL,
    compensation_claim_amount NUMBER NOT NULL,
    compensation_claim_area NUMBER NOT NULL,
    compensation_claim_quantity NUMBER NOT NULL,
    claim_date DATE NOT NULL
);

CREATE TABLE damage_action_doc (
    action_doc_id NUMBER NOT NULL,
    action_id NUMBER NOT NULL,
    doc_name VARCHAR2(100),
    file_url VARCHAR2(500)
);

CREATE TABLE compensation_payment_doc (
    payment_doc_id NUMBER NOT NULL,
    compensation_payment_id NUMBER NOT NULL,
    doc_name VARCHAR2(100),
    file_url VARCHAR2(500)
);

CREATE TABLE quality_assurance_officer (
    officer_id NUMBER NOT NULL,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    department VARCHAR2(50) NOT NULL
);

CREATE TABLE app_doc (
    app_doc_id NUMBER NOT NULL,
    app_id VARCHAR2(50) NOT NULL,
    doc_name VARCHAR2(100),
    file_url VARCHAR2(500)
);

CREATE TABLE agriculture_damage_app (
    app_id VARCHAR2(50) NOT NULL,
    applicant_id NUMBER NOT NULL,
    disaster_api_serial_number VARCHAR2(200) NOT NULL,
    disaster_type VARCHAR2(50) NOT NULL,
    product_name VARCHAR2(100) NOT NULL,
    production_area_serial_number VARCHAR2(200) NOT NULL,
    production_area VARCHAR2(100) NOT NULL,
    app_status VARCHAR2(50) NOT NULL,
    app_date DATE NOT NULL
);

CREATE TABLE applicant (
    applicant_id NUMBER NOT NULL,
    representative_name VARCHAR2(50) NOT NULL,
    organization_name VARCHAR2(50) NOT NULL,
    app_category VARCHAR2(20) NOT NULL,
    postal_code VARCHAR2(20) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    address_detail VARCHAR2(100) NOT NULL
);

CREATE TABLE damage_site_invest (
    invest_id NUMBER NOT NULL,
    app_id VARCHAR2(50) NOT NULL,
    investigator_name VARCHAR2(50),
    damage_type VARCHAR2(50),
    damage_area NUMBER,
    damage_rate NUMBER,
    invest_content VARCHAR2(2000),
    invest_result VARCHAR2(50),
    invest_date DATE
);

CREATE TABLE compensation_calc (
    compensation_calc_id NUMBER NOT NULL,
    claim_id NUMBER NOT NULL,
    calc_charger_name VARCHAR2(50),
    calc_institution_name VARCHAR2(50),
    calc_criterion VARCHAR2(100),
    calc_quantity NUMBER,
    criterion_unit_price NUMBER,
    difference_reason VARCHAR2(100),
    final_compensation_amount NUMBER,
    compensation_applied_rate NUMBER,
    calc_completion_date DATE
);


