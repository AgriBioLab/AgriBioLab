# 2026-10-05 테이블·컬럼 및 샘플데이터 변경 내역

변경일: 2026-10-05 (한국시간)
대상: AgriComp 1차 스프린트 개발용 Oracle DB
범위: 품질담당자 로그인, 보상처리결과 목록·상세 테스트용 데이터

## 1. 테이블·컬럼 변경

테이블명 변경과 기존 테이블 삭제는 없습니다. 로컬 HR에는 프로젝트 테이블이 없었으므로 수정된 DDL로 프로젝트 테이블 14개와 시퀀스 13개를 신규 생성했습니다.

| 테이블 | 기존 컬럼 | 변경 컬럼 | 내용 |
| --- | --- | --- | --- |
| compensation_calc | claim_id | compensation_claim_id | 보상신청 참조 컬럼명 통일. FK 선언과 샘플 INSERT도 변경 |
| quality_assurance_officer | department | position | 부서 → 직책. VARCHAR2(50) NOT NULL 유지 |

최종 DDL: [01_create_tables.sql](../../sql/01_create_tables.sql), [02_create_constraints.sql](../../sql/02_create_constraints.sql)
시퀀스: [03_create_sequences.sql](../../sql/03_create_sequences.sql) — 신규 생성 시 시작값을 샘플 PK 최댓값보다 크게 설정.

## 2. 샘플데이터 변경

| 대상 | 변경 내용 |
| --- | --- |
| quality_assurance_officer | admin01/admin02 제거. quality01 / quality1234 한 계정 사용. name=이*규, position=품질담당자 |
| agriculture_damage_app | 신청자1의 REQ-2026-000137 추가. 신청자1에 피해신청 3건 |
| damage_site_invest | REQ-2026-000136의 조사ID5 추가하여 조사 2건. 신규 000137의 조사ID6 추가 |
| damage_action / compensation_claim / compensation_calc / compensation_payment | 000137의 조치·보상신청·산정·지급 데이터 추가. 산정·지급액 1,600,000원 |
| 문서 테이블 6종 | 신규 000137 연결 문서 각각 2건 추가. 기존 산정ID1과 지급ID1에도 서류 추가하여 각각 2건 |

문서 테이블 6종: app_doc, invest_doc, damage_action_doc, compensation_claim_doc, compensation_calc_doc, compensation_payment_doc.

검토 결과: 신청자 → 피해신청, 피해신청 → 현장조사, 각 정보 → 서류의 1:N 테스트 가능. 전체 샘플은 [sample_data.sql](../../sql/sample_data.sql)에 반영했습니다.

## 3. 기존 원본 ZIP 샘플 DB에 적용할 실행 순서

아래 파일은 원본 ZIP의 DDL·샘플만 적용되어 있고 이번 변경을 아직 적용하지 않은 개발 DB용입니다.

1. [01_table_column_changes.sql](../../sql/2026-10-05/01_table_column_changes.sql): CLAIM_ID와 DEPARTMENT 컬럼 변경, quality01이 이미 있으면 이름·직책 갱신.
2. [02_sample_data_changes.sql](../../sql/2026-10-05/02_sample_data_changes.sql): 관리자 계정 삭제, 담당자 계정과 1:N 샘플 추가.
3. [03_verify_changes.sql](../../sql/2026-10-05/03_verify_changes.sql): 로그인 계정과 1:N 관계 확인.
4. 확인 결과가 정상이라면 COMMIT; 실행. 데이터 확인 중 오류가 있으면 ROLLBACK; 실행.

Oracle 컬럼 변경은 자동 COMMIT되므로 ROLLBACK으로 되돌릴 수 없습니다. 추가 데이터는 고정 ID를 사용하므로 중복 적용하지 않습니다. 기존 DB의 시퀀스는 추가 스크립트에서 변경하지 않습니다. NEXTVAL 사용 전 각 PK 최댓값보다 큰지 확인합니다.

## 4. DB 상태에 따라 적용 파일 선택

- 신규 DB: sql/01_create_tables.sql → 02_create_constraints.sql → 03_create_sequences.sql → sample_data.sql → sample_data_checks.sql → verify_sample_relationships.sql. 날짜별 변경 스크립트는 실행하지 않습니다.
- 원본 ZIP만 적용된 DB: 위 3번의 날짜별 실행 순서로 적용합니다.
- 1:N 샘플은 이미 적용했고 담당자 컬럼만 department인 DB: sql/migrate_officer_department_to_position.sql만 실행합니다.
- 현재 로컬 HR DB: 오늘 변경이 모두 적용되어 있으므로 재실행하지 않습니다.

## 5. 실제 적용 확인

2026-10-05 로컬 Oracle HR에서 확인했습니다.

- COMPENSATION_CALC 참조 컬럼은 COMPENSATION_CLAIM_ID.
- QUALITY_ASSURANCE_OFFICER의 DEPARTMENT는 POSITION으로 변경, NOT NULL 유지.
- quality01 / quality1234 로그인 성공. 반환값은 직책 품질담당자, 이름 이*규.
- 신청자1의 신청 3건, 000136의 조사 2건, 문서6종의 복수 데이터 확인.
- admin 계정 0건. 지급결과 테스트 대상 000136·000137 두 건.

로그인 SQL은 SELECT position, name을 사용하며 VO·DAO·테스트·주석 학습가이드도 같은 기준으로 변경했습니다. Google Sheets G열 SQL 본문은 이번 로컬 변경에 포함되지 않았습니다.
## 담당자 Java 명칭 통일 (2026-10-05)

QualityManager 계열을 QualityOfficerVO, QualityOfficerDAO, QualityOfficerDAOImpl, QualityOfficerDAOTest로 변경했습니다. SQL 상수는 QUALITY_OFFICER_LOGIN, 담당자 변수는 officer로 통일했습니다. DB 테이블 quality_assurance_officer를 기준으로 맞췄으며 로그인 성공을 확인했습니다. 주석 학습가이드 파일은 docs/quality-officer-login-guide.md입니다.
