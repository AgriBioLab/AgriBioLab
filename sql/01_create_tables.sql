/*
 * AgriComp 1st sprint physical model - Oracle
 * Scope:
 *   - Compensation payment-result list
 *   - Compensation detail monitoring page
 *   - Manager login
 *
 * Design notes:
 *   - Do not create independent status-code tables in this sprint.
 *   - Payment result is inferred from final_amount, payment_date, and payment_org_name.
 *   - Damage action and survey tables are used as compensation detail summary sources.
 */

CREATE TABLE quality_manager (
    manager_id       NUMBER        NOT NULL,
    login_id         VARCHAR2(50)  NOT NULL,
    password_hash    VARCHAR2(255) NOT NULL,
    manager_name     VARCHAR2(50)  NOT NULL,
    role_cd          VARCHAR2(30)  NOT NULL,
    use_yn           CHAR(1)       DEFAULT 'Y' NOT NULL,
    last_login_at    DATE
);

COMMENT ON TABLE quality_manager IS '담당자 로그인 인증 정보';
COMMENT ON COLUMN quality_manager.manager_id IS '담당자 내부 PK';
COMMENT ON COLUMN quality_manager.login_id IS '로그인 아이디';
COMMENT ON COLUMN quality_manager.password_hash IS '비밀번호 해시값';
COMMENT ON COLUMN quality_manager.manager_name IS '담당자명';
COMMENT ON COLUMN quality_manager.role_cd IS '권한 코드';
COMMENT ON COLUMN quality_manager.use_yn IS '사용 여부 Y/N';
COMMENT ON COLUMN quality_manager.last_login_at IS '마지막 로그인 시각';

CREATE TABLE damage_application (
    application_id     NUMBER         NOT NULL,
    apply_no           VARCHAR2(30)   NOT NULL,
    target_type        VARCHAR2(20)   NOT NULL,
    business_name      VARCHAR2(100),
    owner_name         VARCHAR2(50)   NOT NULL,
    disaster_type      VARCHAR2(80)   NOT NULL,
    item_name          VARCHAR2(80)   NOT NULL,
    production_place   VARCHAR2(200)
);

COMMENT ON TABLE damage_application IS '피해신청 공통 정보. 피해신청번호 단위 전체 흐름의 부모 테이블';
COMMENT ON COLUMN damage_application.application_id IS '피해신청 내부 PK';
COMMENT ON COLUMN damage_application.apply_no IS '피해신청번호';
COMMENT ON COLUMN damage_application.target_type IS '신청 구분: 생산자, 유통자, 판매자';
COMMENT ON COLUMN damage_application.business_name IS '단체/상호명';
COMMENT ON COLUMN damage_application.owner_name IS '대표자명';
COMMENT ON COLUMN damage_application.disaster_type IS '재해유형';
COMMENT ON COLUMN damage_application.item_name IS '품목명';
COMMENT ON COLUMN damage_application.production_place IS '생산지';

CREATE TABLE compensation (
    compensation_id           NUMBER          NOT NULL,
    application_id            NUMBER          NOT NULL,
    request_amount            NUMBER(15, 0),
    request_date              DATE,
    request_qty_kg            NUMBER(12, 2),
    request_area_m2           NUMBER(12, 2),
    basis_name                VARCHAR2(200),
    unit_price                NUMBER(12, 0),
    apply_rate                NUMBER(5, 2),
    calculation_formula_text  VARCHAR2(500),
    adjustment_reason         VARCHAR2(1000),
    calculation_org_name      VARCHAR2(100),
    calculation_manager_name  VARCHAR2(50),
    calculated_at             DATE,
    final_amount              NUMBER(15, 0)   NOT NULL,
    payment_confirmed_at      DATE,
    payment_date              DATE,
    payment_org_name          VARCHAR2(100),
    payment_manager_name      VARCHAR2(50),
    payee_name                VARCHAR2(50),
    masked_account_no         VARCHAR2(80),
    payment_exclusion_reason  VARCHAR2(500)
);

COMMENT ON TABLE compensation IS '보상 신청, 보상금 산정, 보상금 지급 처리 결과';
COMMENT ON COLUMN compensation.compensation_id IS '보상 내부 PK';
COMMENT ON COLUMN compensation.application_id IS '피해신청 FK';
COMMENT ON COLUMN compensation.request_amount IS '보상 신청 금액';
COMMENT ON COLUMN compensation.request_date IS '보상 신청일';
COMMENT ON COLUMN compensation.request_qty_kg IS '보상 신청 수량 kg';
COMMENT ON COLUMN compensation.request_area_m2 IS '보상 신청 면적 m2';
COMMENT ON COLUMN compensation.basis_name IS '적용한 보상 기준명';
COMMENT ON COLUMN compensation.unit_price IS '보상 기준 단가';
COMMENT ON COLUMN compensation.apply_rate IS '보상 적용 비율';
COMMENT ON COLUMN compensation.calculation_formula_text IS '보상금 산정식 표시 문구';
COMMENT ON COLUMN compensation.adjustment_reason IS '보상 신청 금액과 산정 금액 차이 사유';
COMMENT ON COLUMN compensation.calculation_org_name IS '보상금 산정 기관';
COMMENT ON COLUMN compensation.calculation_manager_name IS '보상금 산정 담당자';
COMMENT ON COLUMN compensation.calculated_at IS '보상금 산정일';
COMMENT ON COLUMN compensation.final_amount IS '최종 보상금';
COMMENT ON COLUMN compensation.payment_confirmed_at IS '보상금 지급 확정일';
COMMENT ON COLUMN compensation.payment_date IS '보상금 지급일';
COMMENT ON COLUMN compensation.payment_org_name IS '보상금 지급 기관';
COMMENT ON COLUMN compensation.payment_manager_name IS '보상금 지급 담당자';
COMMENT ON COLUMN compensation.payee_name IS '보상금 수령인';
COMMENT ON COLUMN compensation.masked_account_no IS '마스킹된 보상금 입금 계좌';
COMMENT ON COLUMN compensation.payment_exclusion_reason IS '지급 제외 사유. 지급 제외 건에서만 사용';

CREATE TABLE damage_action_result (
    action_result_id       NUMBER          NOT NULL,
    application_id         NUMBER          NOT NULL,
    action_method          VARCHAR2(100),
    plan_content           VARCHAR2(1000),
    actual_action_qty_kg   NUMBER(12, 2),
    result_checked_at      DATE
);

COMMENT ON TABLE damage_action_result IS '보상금 산정에 사용한 조치 수행 결과 요약';
COMMENT ON COLUMN damage_action_result.action_result_id IS '조치 수행 결과 내부 PK';
COMMENT ON COLUMN damage_action_result.application_id IS '피해신청 FK';
COMMENT ON COLUMN damage_action_result.action_method IS '조치 방법';
COMMENT ON COLUMN damage_action_result.plan_content IS '조치 계획 내용';
COMMENT ON COLUMN damage_action_result.actual_action_qty_kg IS '실제 조치 수량 kg';
COMMENT ON COLUMN damage_action_result.result_checked_at IS '조치 결과 확인일';

CREATE TABLE damage_survey (
    survey_id              NUMBER         NOT NULL,
    application_id         NUMBER         NOT NULL,
    survey_completed_at    DATE,
    final_survey_round     NUMBER(3),
    final_damage_rate      NUMBER(5, 2),
    final_damage_area_m2   NUMBER(12, 2)
);

COMMENT ON TABLE damage_survey IS '보상금 산정에 사용한 현장조사 결과 요약';
COMMENT ON COLUMN damage_survey.survey_id IS '현장조사 결과 내부 PK';
COMMENT ON COLUMN damage_survey.application_id IS '피해신청 FK';
COMMENT ON COLUMN damage_survey.survey_completed_at IS '현장조사 완료일';
COMMENT ON COLUMN damage_survey.final_survey_round IS '최종 반영 조사차수';
COMMENT ON COLUMN damage_survey.final_damage_rate IS '최종 피해율';
COMMENT ON COLUMN damage_survey.final_damage_area_m2 IS '최종 피해면적 m2';

CREATE TABLE attachment_file (
    file_id          NUMBER         NOT NULL,
    application_id   NUMBER,
    compensation_id  NUMBER,
    file_category    VARCHAR2(20)   NOT NULL,
    document_name    VARCHAR2(100)  NOT NULL,
    submit_source    VARCHAR2(50),
    submitted_at     DATE,
    checked_yn       CHAR(1)        DEFAULT 'N' NOT NULL,
    checked_at       DATE,
    checked_by       VARCHAR2(50),
    file_path        VARCHAR2(500)  NOT NULL
);

COMMENT ON TABLE attachment_file IS '피해신청, 보상 신청, 산정, 지급 관련 첨부파일';
COMMENT ON COLUMN attachment_file.file_id IS '첨부파일 내부 PK';
COMMENT ON COLUMN attachment_file.application_id IS '피해신청 FK';
COMMENT ON COLUMN attachment_file.compensation_id IS '보상 FK';
COMMENT ON COLUMN attachment_file.file_category IS '파일 구분: APPLY, SURVEY, ACTION, COMP';
COMMENT ON COLUMN attachment_file.document_name IS '서류명';
COMMENT ON COLUMN attachment_file.submit_source IS '제출처';
COMMENT ON COLUMN attachment_file.submitted_at IS '제출일';
COMMENT ON COLUMN attachment_file.checked_yn IS '서류 확인 여부 Y/N';
COMMENT ON COLUMN attachment_file.checked_at IS '서류 확인일';
COMMENT ON COLUMN attachment_file.checked_by IS '서류 확인자';
COMMENT ON COLUMN attachment_file.file_path IS '파일 경로';
