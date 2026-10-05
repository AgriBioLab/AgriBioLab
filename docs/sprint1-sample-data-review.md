# 1차 스프린트 샘플 데이터 점검

기준: Google Sheets `1차 스프린트 업무리스트`의 `인터페이스설계` 탭 G열 `sql`, 담당자 로그인·보상처리결과 목록·상세 UI. 사용자 지시에 따라 I열은 검토·구현 기준에서 제외한다. 로컬 `AgriComp_oracle_sql_latest.zip`의 DDL/샘플을 확인했다. 기존 sql.zip의 sample_data.sql도 동일했다.

## 기존 데이터와 추가 내용

| 점검 항목 | 기존 샘플 | 수정 후 |
| --- | --- | --- |
| 담당자 로그인 | admin01/admin02만 존재, quality01 없음 | admin01/admin02 제거, quality01 / quality1234만 유지, 담당자ID 3 |
| 신청자 → 피해신청 | 신청자1에 000131·000136 두 건 존재 | 000137 추가로 세 건 |
| 피해신청 → 현장조사 | 신청별 조사 한 건 | 000136에 조사ID 4·5 두 건 |
| 피해신청 → 서류 | 000136에 세 건 | 유지, 000137에도 두 건 |
| 현장조사 → 서류 | 조사ID4에 두 건 | 유지, 조사ID5·6에도 두 건 |
| 피해조치 → 서류 | 조치ID3에 두 건 | 유지, 조치ID4에도 두 건 |
| 보상신청 → 서류 | 신청ID2에 두 건 | 유지, 신청ID3에도 두 건 |
| 보상금산정 → 서류 | 산정ID1에 한 건 | 산정ID1·2에 각각 두 건 |
| 보상금지급 → 서류 | 지급ID1에 한 건 | 지급ID1·2에 각각 두 건 |

따라서 세 관계 모두 1:1이라는 현황은 로컬 최신 ZIP과 다르다. 복수 현장조사와 산정·지급 서류가 실제 부족 항목이다.

## 세 화면에서 확인할 시나리오

- 로그인: quality01/quality1234 성공, 잘못된 비밀번호·없는 아이디·기존 admin01/admin02 실패. 관리자 계정 건수는 0건이어야 한다. 현재 로그인 반환값은 position(품질담당자), name(이*규).
- 목록: 기존 지급완료 000136과 신규 지급완료 000137 두 건. 동일 신청자1의 두 지급 결과가 각각 표시되어야 한다. 조사·첨부 건수 때문에 목록이나 총건수가 증가하면 안 된다.
- 신규 000137: 신청자1(김민아/행복농장), 배추, 신청액 2,000,000원, 산정·지급액 1,600,000원, 지급일 2026-09-29. 조사·조치·신청·산정·지급 및 문서6종을 연결했다.
- 기존 000136 상세: 조사4(9/24, 피해율70%, 면적3500)와 조사5(9/25, 피해율68%, 면적3400)를 모두 조회할 수 있다. 요약 화면에서 어느 조사를 대표로 표시할지는 팀에서 결정해야 한다. 이번 작업은 조회 쿼리를 변경하지 않았다.
- 문서: 각 부모 ID별 첨부가 두 건 이상 나오고 다른 신청의 서류가 섞이지 않는지 확인한다. 파일 URL은 테스트 문자열이며 실제 파일은 포함하지 않는다.
- 지급일: UI 기본 종료일은 9/29이므로 9/30 지급된 000136은 날짜 필터 적용 시 제외된다. 두 지급 건을 같이 검증하려면 종료일을 9/30으로 입력한다.

## 인터페이스 탭에서 별도 확인할 부분

쿼리 기준은 인터페이스설계 탭 G열 `sql`로 확정했다. 사용자 지시에 따라 DDL의 보상신청 참조 컬럼은 compensation_claim_id로 통일한다.

- compensation_calc의 CLAIM_ID를 COMPENSATION_CLAIM_ID로 변경했다. DDL, 외래키 선언, 전체·추가 샘플 INSERT와 생성 스크립트에 반영했다. 원본 ZIP 추출본은 비교 자료로 보존했다. G10·G16의 compensation_claim_id 조건은 변경된 DDL과 일치하므로 컬럼명 오류가 아니다.
- G열 지급서류 조회의 JOIN 조건이 doc.compensation_payment_id = doc.compensation_payment_id로 자기 비교한다. 지급 테이블과 문서 테이블 연결 조건 확인이 필요하다.

G17 지급서류 JOIN 조건은 doc.compensation_payment_id = payment.compensation_payment_id로 수정이 필요하다. G열 SQL 본문과 Java/JSP는 수정하지 않았다. feat_sql-dao-query-sync 브랜치의 DAO는 calc.claim_id를 사용하므로 해당 브랜치에서도 calc.compensation_claim_id로 후속 변경해야 한다.

## 실행 방법

신규 테스트 스키마: sql/01_create_tables.sql → sql/02_create_constraints.sql → sql/03_create_sequences.sql → sql/sample_data.sql → sql/sample_data_checks.sql 순서. 시퀀스 시작값은 전체 샘플 PK 최댓값보다 크게 조정했다.

기존 CLAIM_ID 스키마는 sql/migrate_claim_id.sql로 컬럼을 먼저 변경한 다음 추가 샘플을 적용한다. Oracle의 컬럼 RENAME은 DDL이며 암묵적 COMMIT이 발생한다. 확인한 로컬 HR에는 프로젝트 테이블이 없어 수정된 DDL로 신규 생성했으며 RENAME은 실행하지 않았다.

기존 샘플 DB: sql/sample_data_additions.sql만 한 번 실행한 뒤 sql/sample_data_checks.sql로 확인하고 수동 COMMIT한다. 기존 ZIP 샘플과 같은 상태인 개발 DB가 전제이며 고정 ID 충돌이 없는지 먼저 확인한다. 이미 적용했으면 재실행하지 않는다. 기존 DB의 시퀀스는 이 추가 스크립트가 변경하지 않으므로 이후 NEXTVAL 사용 전 각 테이블의 MAX(PK)보다 큰지 확인한다.

## 실제 Oracle 적용 결과 (2026-10-05)

- Eclipse의 New Oracle(0) 연결 속성에서 jdbc:oracle:thin:@127.0.0.1:1521:xe, 사용자 HR을 확인했다.
- HR에 프로젝트 테이블이 없음을 확인하고 14개 테이블, PK/FK, 13개 시퀀스와 최종 샘플을 생성·커밋했다. 기존 HR 테이블 21개와 기존 시퀀스는 유지했다.
- 신청자1 → 신청3건, 000136 → 조사2건, 문서6종 → 각각 복수 건을 Oracle에서 확인했다.
- quality01 인증 조회 1건, quality_assurance_officer의 admin 계정 0건을 확인했다.
- COMPENSATION_CALC에는 COMPENSATION_CLAIM_ID만 존재한다. 프로젝트 PK/FK는 모두 ENABLED/VALIDATED 상태이다.
- 지급목록 조회는 000136(6,720,000원, 9/30)과 000137(1,600,000원, 9/29) 두 건이다.
- 적용 중 데이터는 정상 커밋됐으나 후속 확인 SQL의 세미콜론 뒤 인라인 주석이 SQL*Plus에서 ORA-00911을 일으켰다. 주석을 별도 줄로 수정하고 전체 확인 쿼리를 재실행해 성공했다.
- 최종 검증 기록: docs/oracle-sample-verification.log. 초기 적용 기록: docs/oracle-sample-apply.log.
- 로그인 DAO/VO 및 main 테스트 구현과 실제 DB 조회를 완료했다. 화면 연동은 다음 단계이다.

- 담당자 DDL: department → position VARCHAR2(50) NOT NULL. 실제 Oracle 반영 후 quality01 로그인 성공을 확인함. 기존 DB 적용용: sql/migrate_officer_department_to_position.sql (1회 실행).

- 날짜별 최종 변경 취합: docs/change-history/2026-10-05-db-sample-changes.md. 기존 원본 ZIP DB 적용용 SQL은 sql/2026-10-05에 정리함.
