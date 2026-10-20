# 코드 규칙 합의사항

기준일: 2026-10-12. 새 코드 작성과 PR 리뷰에서 사용하는 이름 규칙이다. 일반 코드와 단위테스트 메서드의 명명 방식을 구분한다.

## 이름 규칙

| 대상 | 규칙 | 예시 |
|---|---|---|
| 클래스 | PascalCase, 업무명과 역할 표현 | `CompensationDetailDAO`, `CompensationSummaryVO` |
| 변수·일반 메서드 | camelCase | `appId`, `getCompensationSummary(...)` |
| 상수 | 대문자 + 언더스코어 | `GET_COMPENSATION_CLAIM` |
| request/session Attribute 키 | 업무 영문명, camelCase | `compensationSummary` |
| 테스트 클래스 | 대상 클래스명 + `Test` | `CompensationDetailDAOTest` |
| 단위테스트 메서드 | 한글로 업무·조건·결과 표현, 단어는 언더스코어로 구분 | `피해신청_접수_정보_조회_성공` |

클래스명의 `DAO`, `VO`는 예시와 같이 대문자로 쓴다. Attribute 키는 값을 넣는 Java 코드와 사용하는 JSP/EL에서 동일하게 쓴다.

현재 구현의 연결 예시:

```java
CompensationSummaryVO compensationSummary = dao.getCompensationSummary(appId);
request.setAttribute("compensationSummary", compensationSummary);
```

JSP에서는 `${compensationSummary}`를 기준으로 해당 VO의 속성을 참조한다. SQL 상수는 `Query.GET_COMPENSATION_CLAIM`처럼 사용한다.

## CRUD 메서드 접두사

| DB 작업 | 메서드 이름 규칙 | 이름 예시 |
|---|---|---|
| SELECT / 조회 | `getXXX` | `getCompensationSummary` |
| INSERT / 등록 | `addXXX` | `addCompensationClaim` |
| UPDATE / 수정 | `editXXX` | `editCompensationClaim` |
| DELETE / 삭제 | `removeXXX` | `removeCompensationClaim` |

`XXX`에는 업무 영문명을 PascalCase로 붙여 전체 메서드명을 camelCase로 만든다. 등록·수정·삭제 예시는 명명 규칙 설명이며 현재 기능이 구현됐다는 의미가 아니다.

## 단위테스트: 한글로 조건 표현

단위테스트 메서드는 일반 메서드의 camelCase 규칙에 대한 예외다. 테스트 이름만 보고 무엇을 어떤 조건에서 확인하는지 구분할 수 있게 쓴다.

- 기본 형식: `업무_동작_조건_기대결과`. 조건이 없으면 `업무_동작_기대결과`처럼 쓴다.
- 조회 성공과 없는 번호 조회를 각각 표현한다.
- 입력 조건과 기대 결과는 테스트 본문의 준비 데이터·호출·assert와 일치해야 한다.
- 기존 테스트 이름을 형식에 맞추려고 일괄 변경하지 않는다.

현재 `CompensationDetailDAOTest`의 선언 예시다. 아래는 이름을 보여주기 위해 본문을 생략한 문서용 발췌이며, 실행 가능한 테스트 템플릿은 아니다.

```java
@Test
public void 피해신청_접수_정보_조회_성공() {
    // 본문 생략
}

@Test
public void 피해신청_접수_정보_조회_없는_경우() {
    // 본문 생략
}
```

로그인도 `로그인_성공`, `로그인_실패`처럼 구분한다. 성공·조회 결과 없음 등 서로 다른 조건은 이름과 검증 내용을 구분한다.

## 1차 스프린트 적용 범위

- [1차 합의사항](sprint1-agreements.md)의 클래스 다이어그램 유지 조건을 우선한다.
- 규칙 문서화만으로 기존 클래스·필드·메서드·상수·Attribute를 일괄 개명하지 않는다.
- 기존 `compensationDetailAction`, 조건 검색 `searchCompensationList` 등 현재 이름과 요청 계약은 유지한다. 이름 정리가 필요하면 [2차 후속 작업](sprint2-follow-up.md)의 설계 검토에서 다룬다.
- 기존 단위테스트 25개의 이름·구성을 유지한다. 이 문서 추가로 테스트 코드나 캡처를 변경하지 않는다.

## PR에서 확인하는 방법

1. 신규·변경 코드의 클래스, 변수·메서드, 상수, Attribute 이름을 위 표와 대조한다.
2. CRUD 메서드 접두사와 실제 수행 작업이 일치하는지 확인한다.
3. 테스트 메서드가 한글로 조건과 결과를 구분하는지 확인한다.
4. 기존 클래스 다이어그램·요청 파라미터·Attribute·JSP 참조에 영향이 있는지 확인한다.

이 문서를 기준으로 코드와 리뷰 내용을 확인한다. Markdown은 규칙을 기록하는 문서이며 이름 규칙을 자동 검사하거나 코드를 변경하지 않는다.
