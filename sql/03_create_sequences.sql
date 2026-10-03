/*
 * AgriComp 1st sprint sequences - Oracle
 * Run after table creation. Sample data uses these sequences.
 */

CREATE SEQUENCE quality_manager_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE damage_application_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE compensation_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE damage_action_result_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE damage_survey_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE attachment_file_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
