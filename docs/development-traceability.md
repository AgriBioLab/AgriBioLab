# 개발 이력 연결 · Jira / GitHub / Confluence

연결 작업: [SCRUM-86](https://tlals0028.atlassian.net/browse/SCRUM-86) · [GitHub #61](https://github.com/AgriBioLab/AgriBioLab/issues/61).

## 한 작업의 연결 순서

1. Jira에 목적·범위·담당·기한·완료 기준을 기록합니다.
2. GitHub 이슈에 같은 Jira 링크와 재현/구현·검증 근거를 넣습니다. GitHub 이슈는 코드 논의와 결함 상세를 기록하고 실행 상태는 Jira를 기준으로 확인합니다.
3. 최신 `dev`에서 `feat_SCRUM-49-springAccess`처럼 키가 포함된 브랜치를 만듭니다. Codex 브랜치 예: `codex/SCRUM-86-work-traceability`.
4. 커밋 제목은 `refactor: [SCRUM-49] 기존 기능 접근 보호 전환`처럼 기존 말머리를 유지합니다.
5. PR 제목에도 같은 Jira 키를 넣고 본문에 정확한 Jira URL, GitHub 이슈, Confluence 결정/설계와 테스트 결과를 연결합니다. 기본 base는 `dev`, `dev → main`은 제출·시연 준비 때만 진행합니다.
6. 리뷰·검증 후 병합합니다. PR URL, 실제 머지 커밋 전체 SHA, Actions 실행 URL을 Jira와 변경 기록에 남깁니다. PR의 `merge_commit_sha`는 병합 전에는 테스트 머지 SHA일 수 있으므로 `merged_at` 또는 `merged`와 함께 확인합니다.
7. Jira 완료는 완료 기준·요구사항 검증 근거로 판단합니다. PR 머지만으로 Jira를 자동 완료 처리하지 않습니다.

`Closes #61`은 GitHub의 이슈 종료 규칙을 따릅니다. 계속 추적할 이슈는 `Refs #61`을 사용합니다. Jira 키·일반 링크 자체가 계정 간 자동 동기화를 설치하지는 않습니다.

## 도구별 원본과 자동화 범위

| 대상 | 원본·운영 기준 |
|---|---|
| 목표·회의·결정·인수인계 | [Confluence 홈](https://tlals0028.atlassian.net/wiki/spaces/2/overview)에서 Jira·문서 원본으로 이동 |
| 담당·기한·진행 상태 | [Jira](https://tlals0028.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog) |
| GitHub 이슈·재현 조건 | [Issues](https://github.com/AgriBioLab/AgriBioLab/issues) |
| 코드 검토·승인·변경 파일·머지 여부 | [PR](https://github.com/AgriBioLab/AgriBioLab/pulls) 및 [병합된 PR](https://github.com/AgriBioLab/AgriBioLab/pulls?q=is%3Apr+is%3Amerged) |
| 커밋·브랜치 간 차이 | [dev 커밋](https://github.com/AgriBioLab/AgriBioLab/commits/dev/) · [main과 비교](https://github.com/AgriBioLab/AgriBioLab/compare/main...dev) |
| 자동 검사·작업 로그·실행 결과 | [Actions](https://github.com/AgriBioLab/AgriBioLab/actions)에서 run → job → step 확인 |
| Markdown·변경 기록 | [문서 인덱스](README.md) · [CHANGELOG](../CHANGELOG.md) |

이 PR은 Jira 키 연결 검사만 추가합니다. Java/Tomcat/DB 통합 테스트·배포 파이프라인은 포함하지 않으며 검사 성공을 업무 기능 검증으로 해석하지 않습니다. 워크플로는 병합되어 대상 브랜치에서 사용될 때 실행되며 최초 도입 PR에서 실행되지 않으면 로컬 검증 결과와 도입 이후 실행 결과를 구분합니다.

## 로그·변경 기록

- Actions: 실행 URL·run ID·job·step·성공/실패·확인 시점과 커밋 전체 SHA를 남깁니다. 로그 원본은 Actions에 두고 회의록과 Jira에는 링크·요약·후속 조치를 기록합니다.
- 앱/서버 오류: 환경, 입력, 기대/실제 결과, 발생 시각(KST 또는 시간대 명시), 요청 식별자와 재현 절차를 기록합니다. 비밀번호·토큰·DB 접속 정보·개인정보를 제거합니다.
- 머지: PR URL, base/head, 실제 `merged_at`, merge SHA, 리뷰·테스트 결과를 기록합니다. 닫힌 PR과 병합된 PR을 구분합니다.
- 문서: 변경된 `.md` 파일의 PR 링크와 커밋에 고정한 파일 링크를 남깁니다. 이미 병합된 커밋 메시지를 Jira 연결 목적으로 재작성하지 않습니다.
- `docs/changes/TEMPLATE.md`를 복제해 작업별 결과를 기록합니다. 로그 보존 기간·배포 로그 수집은 저장소/운영 환경 관리자 설정을 확인합니다.

## 연결 확인과 관리자 설정

2026-10-22 Jira 개발 화면에서 GitHub for Atlassian의 AgriBioLab 조직과 AgriBioLab/AgriBioLab 저장소 연결을 확인했습니다. 이 작업의 [PR #62](https://github.com/AgriBioLab/AgriBioLab/pull/62)가 Jira 풀리퀘스트 목록에 자동 수집되는 것도 확인했습니다. [첫 Actions 실행](https://github.com/AgriBioLab/AgriBioLab/actions/runs/39730352831)은 성공했습니다. 이후 변경의 실행 결과는 PR Checks와 Actions 원본을 확인합니다.

현재 작업 계정은 저장소 push 권한이 있고 admin 권한은 없습니다. 기존 앱 연결은 유지하고 아래 자동 링크·수집 범위는 관리자가 필요에 따라 확인합니다.

1. 이미 연결된 Atlassian 공식 **GitHub for Atlassian** 앱의 대상은 `tlals0028.atlassian.net`과 `AgriBioLab/AgriBioLab`입니다. 별도 요청 없이 다른 저장소로 연결 범위를 넓히지 않습니다.
2. GitHub 저장소 Settings → Integrations → Autolink references에 `SCRUM-` → `https://tlals0028.atlassian.net/browse/SCRUM-<num>`을 설정합니다. 뒤의 참조는 숫자로 사용합니다.
3. Jira 개발 패널에서 키가 포함된 브랜치·커밋·PR을 확인하고, 실제 병합 후 머지 이벤트도 확인합니다. 현재 PR은 Draft이며 병합되지 않았습니다. 표시되지 않는 이벤트는 앱 설치·저장소 선택·Jira 사이트·키·동기화 상태를 확인합니다.
4. Confluence의 GitHub 링크를 열어 GitHub 계정 인증·접근을 확인합니다. 이는 Jira 개발 패널 수집과 별도의 표시 경로입니다.

Jira의 GitHub 저장소·PR 수집은 확인되었습니다. GitHub의 `SCRUM-` 자동 링크 설정은 현재 계정으로 조회할 수 없어 미확인입니다. 이후 앱 권한 승인·자동 링크 등 저장소 관리 권한이 필요한 설정은 관리자가 수행합니다.

공식 기준: [GitHub Cloud → Jira 연결](https://support.atlassian.com/jira-cloud-administration/docs/integrate-with-github/) · [GitHub 외부 참조 자동 링크](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/configuring-autolinks-to-reference-external-resources).
