# 1차 스프린트 인터페이스 설계

## 설계 기준

- 기준 업무리스트: Google Sheets `1차 스프린트 업무리스트`
- 기준 탭: `원규(목록)`, `재숙(상세)`
- 기준 SQL: 최신 Oracle DDL 및 `sql/sample_data.sql`
- 피해신청번호는 `agriculture_damage_app.app_id`를 사용한다.
- 신청자 일련번호는 `applicant.applicant_id`를 사용한다.
- `application`은 `app`, `document`는 `doc`, `calculation`은 `calc`, `investigation`은 `invest`로 통일한다.

## 설계 방향

업무리스트의 한 행을 그대로 DAO 메서드 하나로 만들지 않는다. 같은 화면 구역에서 함께 필요한 항목은 하나의 조회 메서드로 묶는다.

예를 들어 `원규(목록)` 탭의 조건별 조회 행은 모두 같은 목록 조회 SQL의 조건 차이이므로 `selectCompensationList(CompensationSearchVO search)` 하나로 통합한다.

`재숙(상세)` 탭의 상세 조회 행은 화면 구역 단위로 나눈다. 상단 요약, 피해신청 접수 정보, 보상 신청 정보, 산정 정보, 지급 결과, 조치 요약, 조사 요약, 문서 조회가 기준이다.

## DAO 인터페이스 후보

| 인터페이스 | 기준 탭 | 담당 범위 |
| --- | --- | --- |
| `QualityOfficerDAOInterface` | `원규(목록)` | 담당자 로그인 |
| `CompensationListDAOInterface` | `원규(목록)` | 보상처리 지급결과 목록, 검색 조건, 목록 건수 |
| `CompensationDetailDAOInterface` | `재숙(상세)` | 보상처리 지급결과 상세 화면의 주요 구역 조회 |
| `CompensationDocumentDAOInterface` | `재숙(상세)` | 피해신청/조사/조치/보상/산정/지급 문서 조회 |

## VO 후보

| VO | 용도 |
| --- | --- |
| `QualityOfficerVO` | 로그인 담당자 정보 |
| `CompensationSearchVO` | 목록 검색 조건 |
| `CompensationListVO` | 목록 한 행 |
| `CompensationDetailVO` | 상세 종합 조회 |
| `CompensationClaimVO` | 보상 신청 정보 |
| `CompensationCalcVO` | 보상금 산정 정보 |
| `CompensationPaymentVO` | 보상금 지급 결과 |
| `DamageActionVO` | 피해조치 계획/수행 요약 |
| `DamageInvestVO` | 현장조사 결과 요약 |
| `DocumentVO` | 공통 문서 정보 |

## 원규(목록) 탭 매핑

| 업무 | 인터페이스 메서드 | Input | Output |
| --- | --- | --- | --- |
| 조건 검색에 따른 보상 지급 목록 조회 | `selectCompensationList(CompensationSearchVO search)` | 지급일, 피해신청번호, 단체/상호명, 대표자명, 신청자 구분, 품목명 | `List<CompensationListVO>` |
| 검색 결과 건수 조회 | `countCompensationList(CompensationSearchVO search)` | 목록 검색 조건 | `int` |
| 피해신청번호 조회 | `selectAppIdByClaimId(int compensationClaimId)` | 보상신청ID | `String appId` |
| 로그인 인증 | `login(String username, String password)` | 아이디, 패스워드 | `QualityOfficerVO` |

## 재숙(상세) 탭 매핑

| 업무 묶음 | 인터페이스 메서드 | Input | Output |
| --- | --- | --- | --- |
| 상세 상단 요약 | `selectCompensationDetail(String appId)` | 피해신청번호 | `CompensationDetailVO` |
| 피해신청 접수 정보 | `selectAppReception(String appId)` | 피해신청번호 | `AppReceptionVO` 또는 `CompensationDetailVO` 일부 |
| 보상 신청 정보 | `selectCompensationClaim(String appId)` | 피해신청번호 | `CompensationClaimVO` |
| 보상금 산정 정보 | `selectCompensationCalc(int compensationClaimId)` | 보상신청ID | `CompensationCalcVO` |
| 보상금 지급 처리 결과 | `selectCompensationPayment(int compensationClaimId)` | 보상신청ID | `CompensationPaymentVO` |
| 조치 수행 결과 요약 | `selectDamageActionSummary(String appId)` | 피해신청번호 | `DamageActionVO` |
| 현장조사 결과 요약 | `selectDamageInvestSummary(String appId)` | 피해신청번호 | `DamageInvestVO` |
| 관련 문서 통합 조회 | `selectAllDocsByAppId(String appId)` | 피해신청번호 | `List<DocumentVO>` |

## Java 인터페이스 스켈레톤

```java
public interface QualityOfficerDAOInterface {
    QualityOfficerVO login(String username, String password) throws SQLException;
}
```

```java
public interface CompensationListDAOInterface {
    List<CompensationListVO> selectCompensationList(CompensationSearchVO search) throws SQLException;
    int countCompensationList(CompensationSearchVO search) throws SQLException;
    String selectAppIdByClaimId(int compensationClaimId) throws SQLException;
}
```

```java
public interface CompensationDetailDAOInterface {
    CompensationDetailVO selectCompensationDetail(String appId) throws SQLException;
    CompensationClaimVO selectCompensationClaim(String appId) throws SQLException;
    CompensationCalcVO selectCompensationCalc(int compensationClaimId) throws SQLException;
    CompensationPaymentVO selectCompensationPayment(int compensationClaimId) throws SQLException;
    DamageActionVO selectDamageActionSummary(String appId) throws SQLException;
    DamageInvestVO selectDamageInvestSummary(String appId) throws SQLException;
}
```

```java
public interface CompensationDocumentDAOInterface {
    List<DocumentVO> selectAppDocs(String appId) throws SQLException;
    List<DocumentVO> selectInvestDocs(int investId) throws SQLException;
    List<DocumentVO> selectActionDocs(int actionId) throws SQLException;
    List<DocumentVO> selectClaimDocs(int compensationClaimId) throws SQLException;
    List<DocumentVO> selectCalcDocs(int compensationCalcId) throws SQLException;
    List<DocumentVO> selectPaymentDocs(int compensationPaymentId) throws SQLException;
    List<DocumentVO> selectAllDocsByAppId(String appId) throws SQLException;
}
```

## 클래스 다이어그램 작성 기준

- DAO 인터페이스는 보라색 `I` 아이콘이 붙은 인터페이스로 표현한다.
- VO는 초록색 `C` 아이콘이 붙은 클래스로 표현한다.
- DAO에서 사용하는 VO를 의존 관계로 연결한다.
- 목록과 상세를 분리해 배치하면 팀원이 담당 범위를 이해하기 쉽다.
- Eclipse 기본 기능만으로는 이미지처럼 자동 다이어그램을 뽑기 어렵다. `PlantUML`, `ObjectAid UML`, `AmaterasUML` 중 하나를 사용하는 방식이 현실적이다.
