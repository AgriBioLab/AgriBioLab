# AgriBioLab

농산물 품질 담당자의 로그인과 보상처리결과 목록·상세 조회를 제공하는 Java Servlet/JSP 업무 시스템입니다. 1차 스프린트 통합본과 보완 사항은 #56 → dev, #55 → main 순서로 팀 승인 후 병합됐습니다.

## 1차 스프린트 범위

- 로그인 성공/실패, 세션 유지, 로그아웃.
- 보상처리결과 전체 목록·건수·이름 마스킹, 조건/복합조건/0건 검색, 검색조건 유지·초기화.
- 목록→상세→목록 이동, 신청·산정·지급·조치·조사·진행 흐름·서류명 조회.
- 로그아웃 후 목록·상세의 정식 controller URL 접근 시 로그인 화면으로 이동.
- root/index/main 진입, 기본·잘못된 cmd 처리, 한쪽 날짜 검색, 없는 상세 처리, 실제 품목 표시.
- 스크롤바 유무에 따라 화면이 가로로 움직이지 않도록 공통 여백 유지.

첨부 다운로드는 미구현입니다. 직접 JSP 접근 보호는 2차 스프린트 작업이며, 1차의 로그인 검사는 정식 `/controller?cmd=...` 경로에 적용됩니다.

## 요청 처리 구조

`FrontController → ActionFactory → Action 구현체 → DAO·VO`

DAO는 `DBCP`의 JDBC 연결과 `Query`를 사용하고, Action은 JSP에 조회 결과를 전달합니다. 별도 Service 계층은 현재 구현 범위에 없습니다. URL의 cmd 변화와 해당 코드의 연결을 함께 보여주는 것이 시연의 패턴 설명 근거입니다.

1차는 제출한 클래스 다이어그램의 클래스·인터페이스·필드·메서드 구성을 유지합니다. 초기 UI 프로토타입 차이는 허용하되 업무 흐름·용어·ERD를 유지합니다. 자세한 내용은 [합의사항](docs/sprint1-agreements.md)을 확인하세요.

## 화면 진입

아래 경로는 배포된 애플리케이션의 context path 뒤에 붙입니다. JSP 직접 URL 대신 controller 경로를 사용합니다.

| 화면/동작 | 경로 |
|---|---|
| 초기 진입 | `/`, `/index.html`, `/main.html` |
| 로그인 화면 | `/controller?cmd=qualityOfficerLoginUI` |
| 로그인 처리 | `POST /controller?cmd=qualityOfficerLoginAction` |
| 보상처리결과 목록 | `/controller?cmd=compensationListUI` |
| 보상처리결과 상세 | `/controller?cmd=compensationDetailAction&appId={피해신청번호}` |
| 로그아웃 | `/controller?cmd=qualityOfficerLogout` |

cmd 없는 controller 요청은 로그인 전에는 로그인 화면, 로그인 후에는 목록으로 이동합니다. 로그인 상태의 알 수 없는 cmd는 404로 처리합니다.

## 개발 환경

| 항목 | 버전 |
|---|---|
| JDK | 17 |
| Apache Tomcat | 9.0 |
| Eclipse | eGovFrame 4.3.1 (Dynamic Web Project, Web Module 4.0) |
| DB | Oracle, 저장소의 팀 기준 설정 유지 |

## 실행 방법

1. Eclipse → File → Import → **Existing Projects into Workspace** → 저장소 폴더 선택
   - "Copy projects into workspace"는 **체크 해제**
2. Window → Preferences → Server → Runtime Environments → **Apache Tomcat v9.0** 등록
3. 팀 DB 접근 가능 여부를 확인하고 프로젝트 우클릭 → Run As → **Run on Server**로 배포합니다.
4. 배포된 context path의 `/index.html` 또는 `/main.html`에서 시작합니다.

개인 환경의 DB 접속 정보·비밀번호·로컬 설정은 커밋과 PR에 포함하지 않습니다. GitHub 병합과 실제 웹 서버 배포는 별도 단계입니다.

## 검증·시연 상태

2026-10-12 기준 main 촬영 기준은 `f9c9a43aba6563ae6b9f4617cdb83f6f96300f3f`입니다. 검증한 dev `b3187b5`와 파일 내용이 전체 동일합니다. dev 재실행 결과는 Java 29개 컴파일, JUnit 25/25, 1차 범위 HTTP 27/27 통과입니다. 별도 직접 JSP 접근 점검 6개는 미충족으로 2차 이관했습니다.

DB 연동은 저장소 밖 별도 검증 런타임의 로컬 접속 설정으로 실행했습니다. 팀 DB 접속 환경의 실행 결과나 main에서 새로 실행한 결과로 표기하지 않습니다. 최종 배포 환경에서의 확인이 필요합니다.

최종 영상은 실제 외부 웹 URL·주소창·브라우저 테두리를 포함한 MP4이며 재생·일시정지·탐색이 가능해야 합니다. 현재 외부 웹 URL은 미확정이고 MP4는 미제작입니다. [시연 기준과 순서](docs/sprint1-demo.md)를 확인하세요.

## 폴더 구조

```
src/main/java/
├ servlet/              FrontController, ActionFactory, Action 및 구현체
├ model/dao/            DB 조회
├ model/vo/             조회 결과 데이터
├ util/                 DBCP, Query, 마스킹 유틸
└ test/                 JUnit 테스트
src/main/webapp/
├ index.html, main.html 초기 진입
├ view/                 로그인·보상처리결과 목록/상세 JSP
│ └ common/             head.jsp, header.jsp, side_compensationResult.jsp
├ resources/css/        공통·로그인·검색·목록·상세 스타일
└ WEB-INF/lib/          JDBC, JSTL 등 라이브러리
docs/                   1차 합의·시연 기준·2차 후속 작업
```

## 협업 규칙

- [문서 목록](docs/README.md)
- [코드 규칙 합의사항](docs/code-conventions.md)
- [1차 스프린트 합의사항](docs/sprint1-agreements.md)
- [시연 기준·시나리오·MP4 완료 조건](docs/sprint1-demo.md)
- [2차 스프린트 후속 작업](docs/sprint2-follow-up.md)
- [브랜치·커밋·PR 규칙](CONTRIBUTING.md)
