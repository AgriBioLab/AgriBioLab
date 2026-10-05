-- =========================================================
-- 02. CREATE PRIMARY KEY / FOREIGN KEY CONSTRAINTS
-- Oracle
-- Run after 01_create_tables.sql.
-- =========================================================

-- PRIMARY KEY

ALTER TABLE compensation_claim_doc
ADD CONSTRAINT PK_COMPENSATION_CLAIM_DOC
PRIMARY KEY (claim_doc_id);

ALTER TABLE damage_action
ADD CONSTRAINT PK_DAMAGE_ACTION
PRIMARY KEY (damage_action_id);

ALTER TABLE compensation_calc_doc
ADD CONSTRAINT PK_COMPENSATION_CALC_DOC
PRIMARY KEY (calc_doc_id);

ALTER TABLE compensation_payment
ADD CONSTRAINT PK_COMPENSATION_PAYMENT
PRIMARY KEY (compensation_payment_id);

ALTER TABLE invest_doc
ADD CONSTRAINT PK_INVESTIGATION_DOC
PRIMARY KEY (invest_doc_id);

ALTER TABLE compensation_claim
ADD CONSTRAINT PK_COMPENSATION_CLAIM
PRIMARY KEY (compensation_claim_id);

ALTER TABLE damage_action_doc
ADD CONSTRAINT PK_DAMAGE_ACTION_DOC
PRIMARY KEY (action_doc_id);

ALTER TABLE compensation_payment_doc
ADD CONSTRAINT PK_COMPENSATION_PAYMENT_DOC
PRIMARY KEY (payment_doc_id);

ALTER TABLE quality_assurance_officer
ADD CONSTRAINT PK_QUALITY_ASSURANCE_OFFICER
PRIMARY KEY (officer_id);

ALTER TABLE app_doc
ADD CONSTRAINT PK_APPLICATION_DOC
PRIMARY KEY (app_doc_id);

ALTER TABLE agriculture_damage_app
ADD CONSTRAINT PK_AGRICULTURE_DAMAGE_APP
PRIMARY KEY (app_id);

ALTER TABLE applicant
ADD CONSTRAINT PK_APPLICANT
PRIMARY KEY (applicant_id);

ALTER TABLE damage_site_invest
ADD CONSTRAINT PK_DAMAGE_SITE_INVEST
PRIMARY KEY (invest_id);

ALTER TABLE compensation_calc
ADD CONSTRAINT PK_COMPENSATION_CALC
PRIMARY KEY (compensation_calc_id);

-- FOREIGN KEY

ALTER TABLE compensation_claim_doc
ADD CONSTRAINT FK_COMPENSATION_CLAIM_DOC
FOREIGN KEY (compensation_claim_id)
REFERENCES compensation_claim (compensation_claim_id);

ALTER TABLE damage_action
ADD CONSTRAINT FK_AGRICULTURE_DAMAGE_ACTION
FOREIGN KEY (app_id)
REFERENCES agriculture_damage_app (app_id);

ALTER TABLE compensation_calc_doc
ADD CONSTRAINT FK_COMPENSATION_CALC_DOC
FOREIGN KEY (compensation_calc_id)
REFERENCES compensation_calc (compensation_calc_id);

ALTER TABLE compensation_payment
ADD CONSTRAINT FK_COMPENSATION_CLAIM_PAYMENT
FOREIGN KEY (compensation_claim_id)
REFERENCES compensation_claim (compensation_claim_id);

ALTER TABLE invest_doc
ADD CONSTRAINT FK_DAMAGE_INVEST_DOC
FOREIGN KEY (invest_id)
REFERENCES damage_site_invest (invest_id);

ALTER TABLE compensation_claim
ADD CONSTRAINT FK_AGRICULTURE_DAMAGE_CLAIM
FOREIGN KEY (app_id)
REFERENCES agriculture_damage_app (app_id);

ALTER TABLE damage_action_doc
ADD CONSTRAINT FK_DAMAGE_ACTION_DOC
FOREIGN KEY (action_id)
REFERENCES damage_action (damage_action_id);

ALTER TABLE compensation_payment_doc
ADD CONSTRAINT FK_COMPENSATION_PAYMENT_DOC
FOREIGN KEY (compensation_payment_id)
REFERENCES compensation_payment (compensation_payment_id);

ALTER TABLE app_doc
ADD CONSTRAINT FK_AGRICULTURE_DAMAGE_DOC
FOREIGN KEY (app_id)
REFERENCES agriculture_damage_app (app_id);

ALTER TABLE agriculture_damage_app
ADD CONSTRAINT FK_APPLICANT_AGRICULTURE_APP
FOREIGN KEY (applicant_id)
REFERENCES applicant (applicant_id);

ALTER TABLE damage_site_invest
ADD CONSTRAINT FK_AGRICULTURE_DAMAGE_INVEST
FOREIGN KEY (app_id)
REFERENCES agriculture_damage_app (app_id);

ALTER TABLE compensation_calc
ADD CONSTRAINT FK_COMPENSATION_CLAIM_CALC
FOREIGN KEY (compensation_claim_id)
REFERENCES compensation_claim (compensation_claim_id);
