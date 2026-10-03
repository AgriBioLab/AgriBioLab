/*
 * AgriComp 1st sprint constraints - Oracle
 * Run after 01_create_tables.sql.
 */

ALTER TABLE quality_manager
    ADD CONSTRAINT pk_quality_manager
    PRIMARY KEY (manager_id);

ALTER TABLE quality_manager
    ADD CONSTRAINT uk_quality_manager_login_id
    UNIQUE (login_id);

ALTER TABLE quality_manager
    ADD CONSTRAINT ck_quality_manager_use_yn
    CHECK (use_yn IN ('Y', 'N'));

ALTER TABLE quality_manager
    ADD CONSTRAINT ck_quality_manager_role_cd
    CHECK (role_cd IN ('QUALITY_VIEWER', 'ADMIN'));

ALTER TABLE damage_application
    ADD CONSTRAINT pk_damage_application
    PRIMARY KEY (application_id);

ALTER TABLE damage_application
    ADD CONSTRAINT uk_damage_application_apply_no
    UNIQUE (apply_no);

ALTER TABLE damage_application
    ADD CONSTRAINT ck_damage_application_target_type
    CHECK (target_type IN ('PRODUCER', 'DISTRIBUTOR', 'SELLER'));

ALTER TABLE compensation
    ADD CONSTRAINT pk_compensation
    PRIMARY KEY (compensation_id);

ALTER TABLE compensation
    ADD CONSTRAINT uk_compensation_application
    UNIQUE (application_id);

ALTER TABLE compensation
    ADD CONSTRAINT fk_compensation_application
    FOREIGN KEY (application_id)
    REFERENCES damage_application (application_id);

ALTER TABLE compensation
    ADD CONSTRAINT ck_compensation_request_amount
    CHECK (request_amount IS NULL OR request_amount >= 0);

ALTER TABLE compensation
    ADD CONSTRAINT ck_compensation_request_qty
    CHECK (request_qty_kg IS NULL OR request_qty_kg >= 0);

ALTER TABLE compensation
    ADD CONSTRAINT ck_compensation_request_area
    CHECK (request_area_m2 IS NULL OR request_area_m2 >= 0);

ALTER TABLE compensation
    ADD CONSTRAINT ck_compensation_unit_price
    CHECK (unit_price IS NULL OR unit_price >= 0);

ALTER TABLE compensation
    ADD CONSTRAINT ck_compensation_apply_rate
    CHECK (apply_rate IS NULL OR apply_rate BETWEEN 0 AND 100);

ALTER TABLE compensation
    ADD CONSTRAINT ck_compensation_final_amount
    CHECK (final_amount >= 0);

ALTER TABLE compensation
    ADD CONSTRAINT ck_compensation_payment_date
    CHECK (
        payment_date IS NULL
        OR payment_confirmed_at IS NULL
        OR payment_date >= payment_confirmed_at
    );

ALTER TABLE damage_action_result
    ADD CONSTRAINT pk_damage_action_result
    PRIMARY KEY (action_result_id);

ALTER TABLE damage_action_result
    ADD CONSTRAINT uk_action_result_application
    UNIQUE (application_id);

ALTER TABLE damage_action_result
    ADD CONSTRAINT fk_action_result_application
    FOREIGN KEY (application_id)
    REFERENCES damage_application (application_id);

ALTER TABLE damage_action_result
    ADD CONSTRAINT ck_action_result_qty
    CHECK (actual_action_qty_kg IS NULL OR actual_action_qty_kg >= 0);

ALTER TABLE damage_survey
    ADD CONSTRAINT pk_damage_survey
    PRIMARY KEY (survey_id);

ALTER TABLE damage_survey
    ADD CONSTRAINT uk_damage_survey_application
    UNIQUE (application_id);

ALTER TABLE damage_survey
    ADD CONSTRAINT fk_damage_survey_application
    FOREIGN KEY (application_id)
    REFERENCES damage_application (application_id);

ALTER TABLE damage_survey
    ADD CONSTRAINT ck_damage_survey_round
    CHECK (final_survey_round IS NULL OR final_survey_round >= 1);

ALTER TABLE damage_survey
    ADD CONSTRAINT ck_damage_survey_rate
    CHECK (final_damage_rate IS NULL OR final_damage_rate BETWEEN 0 AND 100);

ALTER TABLE damage_survey
    ADD CONSTRAINT ck_damage_survey_area
    CHECK (final_damage_area_m2 IS NULL OR final_damage_area_m2 >= 0);

ALTER TABLE attachment_file
    ADD CONSTRAINT pk_attachment_file
    PRIMARY KEY (file_id);

ALTER TABLE attachment_file
    ADD CONSTRAINT fk_attachment_application
    FOREIGN KEY (application_id)
    REFERENCES damage_application (application_id);

ALTER TABLE attachment_file
    ADD CONSTRAINT fk_attachment_compensation
    FOREIGN KEY (compensation_id)
    REFERENCES compensation (compensation_id);

ALTER TABLE attachment_file
    ADD CONSTRAINT ck_attachment_parent
    CHECK (application_id IS NOT NULL OR compensation_id IS NOT NULL);

ALTER TABLE attachment_file
    ADD CONSTRAINT ck_attachment_category
    CHECK (file_category IN ('APPLY', 'SURVEY', 'ACTION', 'COMP'));

ALTER TABLE attachment_file
    ADD CONSTRAINT ck_attachment_checked_yn
    CHECK (checked_yn IN ('Y', 'N'));

CREATE INDEX ix_compensation_payment_date
    ON compensation (payment_date DESC, application_id);

CREATE INDEX ix_damage_application_owner
    ON damage_application (owner_name);

CREATE INDEX ix_damage_application_item
    ON damage_application (item_name);

CREATE INDEX ix_attachment_application
    ON attachment_file (application_id, file_category);

CREATE INDEX ix_attachment_compensation
    ON attachment_file (compensation_id, file_category);
