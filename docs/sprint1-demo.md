# 1차 스프린트 시연 기준

## 촬영 기준과 현재 상태

기준 확인일: 2026-10-12 (Asia/Seoul).

| 항목 | 확인 결과 |
|---|---|
| 보완 PR | [#56](https://github.com/AgriBioLab/AgriBioLab/pull/56), 보완 head에서 팀 승인 1건 후 dev 병합 |
| #56 병합 커밋·일시 | `b3187b569ff8cb90278376cdb5d06eb1b17bd9a8`, 2026-10-12 11:21:07 +09:00 |
| 제출 PR | [#55](https://github.com/AgriBioLab/AgriBioLab/pull/55), 제출 head에서 팀 승인 1건 후 main 병합 |
| #55 병합 커밋·일시 | `f9c9a43aba6563ae6b9f4617cdb83f6f96300f3f`, 2026-10-12 11:57:01 +09:00 |
| main 촬영 기준 전체 SHA | `f9c9a43aba6563ae6b9f4617cdb83f6f96300f3f` |
| 보완 포함 | main과 #56 병합 dev의 Git tree SHA 동일. squash 병합으로 #56 커밋 자체는 main의 조상이 아님 |
| 별도 시연 폴더 | 위 main에서 준비 완료. 절대 경로·git status는 로컬 demo-baseline 기록에 보관 |
| 실제 외부 웹 URL | 미확정, 배포 후 기록 필요 |
| 최종 MP4 | 미제작 |

두 기준의 Git tree SHA는 `b11f8ebf2fb2e6d825a5b46ac373dcabd31d8802`로 동일하다. 보완 내용 반영은 이 전체 파일 내용 비교와 PR 병합 기록으로 확인했으며, 커밋 조상 포함으로 확인한 것은 아니다.

문서 추가 PR은 위 코드 촬영 기준 이후의 별도 변경이다. 촬영 전에 실제 배포 커밋을 확인하고 기준이 바뀌면 이 기록을 갱신한다. 코드·DB 데이터·배포 환경이 같다면 승인 전 dev와 병합 후 main의 시연 동작은 동일하다.

## 정식 URL과 클래스 근거

아래는 웹 애플리케이션 context path 뒤의 경로다. 실제 외부 배포 주소를 확인한 뒤 사용한다.

| 동작 | 경로 | ActionFactory가 선택하는 클래스 |
|---|---|---|
| 로그인 화면 | `/controller?cmd=qualityOfficerLoginUI` | `QualityOfficerLoginUI` |
| 로그인 처리 | `POST /controller?cmd=qualityOfficerLoginAction` | `QualityOfficerLoginAction` |
| 목록·조건 검색 | `/controller?cmd=compensationListUI` | `CompensationListUIAction` |
| 상세 | `/controller?cmd=compensationDetailAction&appId={피해신청번호}` | `compensationDetailAction` |
| 로그아웃 | `/controller?cmd=qualityOfficerLogout` | `QualityOfficerLogoutAction` |

URL만으로 패턴 적용을 입증하지 않는다. 주소창의 cmd 변화와 함께 다음 실제 코드를 연결해 설명한다.

1. [FrontController](../src/main/java/servlet/FrontController.java): `/controller` 요청·세션 검사·cmd 처리.
2. [ActionFactory](../src/main/java/servlet/ActionFactory.java): cmd로 Action 구현체 선택.
3. [Action](../src/main/java/servlet/Action.java) 및 [목록 Action](../src/main/java/servlet/CompensationListUIAction.java): 공통 실행 계약·DAO 호출·JSP 결과 전달.
4. [목록 DAO](../src/main/java/model/dao/CompensationListDAO.java), [상세 DAO](../src/main/java/model/dao/CompensationDetailDAO.java), [목록 VO](../src/main/java/model/vo/CompensationListVO.java): 조회·데이터 전달. DB 연결은 DBCP, SQL은 Query 사용.

제출 클래스 다이어그램을 유지하며 별도 Service 계층이 구현됐다고 설명하지 않는다. 코드 근거 촬영 시 DB 접속 정보·비밀번호가 화면에 노출되지 않도록 한다.

## 촬영 순서

| 순서 | 조작 | 확인할 결과 |
|---|---|---|
| 1 | root, index, main 진입 | cmd 없는 초기 진입과 로그인 링크 |
| 2 | 잘못된 비밀번호로 로그인 | 실패 메시지·로그인 화면 유지 |
| 3 | 정상 로그인, 새로고침 | 목록 이동·로그인 세션 유지 |
| 4 | 전체 목록 확인 | 표시 건수와 실제 행 수, 이름 마스킹 |
| 5 | 피해신청번호·지급일·품목 등 검색 | 조건/복합조건 결과·입력값 유지 |
| 6 | 존재하지 않는 번호 검색 | 결과 0건 |
| 7 | 실제 초기화 버튼 클릭 | 입력값 비움·전체 구분 선택·전체 목록 복원 |
| 8 | 목록에서 상세 진입 | 신청번호·품목·금액·진행 흐름·서류명 확인 |
| 9 | 상세의 목록 버튼, 로고 이동 | 목록 복귀·main 진입 |
| 10 | 로그아웃 | 로그인 화면 표시 |
| 11 | 목록·상세 controller URL 직접 입력 | 두 요청 모두 로그인 화면으로 이동 |
| 12 | 코드 근거 설명 | URL의 cmd와 FrontController→Factory→Action→DAO/VO 연결 |

보조 확인: 로그인 전후 cmd 없는 controller, 로그인 상태의 잘못된 cmd(404), 시작일만/종료일만 검색, 없는 상세 번호의 목록 복귀, 짧은 화면과 긴 화면 사이 가로 위치 유지.

샘플 신청번호와 건수는 실제 배포 DB에서 촬영 전에 확인한다. 고정 건수를 가정하지 않는다. 직접 JSP 보호와 첨부 다운로드는 이번 완료 기능으로 시연하지 않는다.

## MP4 완료 조건

- 실제 화면 녹화 MP4 파일을 제공한다. 정지 이미지·GIF로 대체하지 않는다.
- 실제 외부 웹 URL과 주소창·브라우저 창 테두리가 보이게 촬영한다. localhost/127.0.0.1 또는 DB 주소를 최종 웹 URL로 대신하지 않는다.
- 호환 형식은 H.264/yuv420p/faststart이며 음성이 있으면 AAC를 사용한다.
- 일반 플레이어에서 실제 재생·일시정지·앞뒤 탐색을 확인한다. 웹 플레이어에는 `controls`를 제공한다.
- 파일명·촬영 일시·배포 SHA·외부 URL·재생시간·시나리오별 타임스탬프·검증 결과를 기록한다.
- 발표자료에 실제 재생 가능한 영상으로 삽입하고 MP4 원본을 함께 보관한다. 발표자료 편집은 별도 요청에 따라 수행한다.

완성 파일과 재생 확인 전에는 영상 완료로 표시하지 않는다. main 병합·시연 폴더 준비 완료와 외부 배포·영상 완성은 구분한다.
