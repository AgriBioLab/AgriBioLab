# AgriBioLab

농산물 품질 담당자가 보상처리, 부적합 조치, 농산물 사건, 품질통계를 확인하는 업무 화면입니다.
현재는 JSP 화면 초안 단계이며, 이후 MVC Model2(FrontController → Action → Service → DAO)로 전환할 예정입니다.

## 화면

| 메뉴 | 목록 | 상세 |
|---|---|---|
| 품질통계 | `view/qualityStatistics.jsp` | - |
| 보상처리 | `view/compensationList.jsp` | `view/compensationDetail.jsp` |
| 부적합 조치 | `view/nonconformityList.jsp` | - |
| 농산물 사건 | `view/agricultureCaseList.jsp` | `view/agricultureCaseDetail.jsp` |

## 개발 환경

| 항목 | 버전 |
|---|---|
| JDK | 17 |
| Apache Tomcat | 9.0 |
| Eclipse | eGovFrame 4.3.1 (Dynamic Web Project, Web Module 4.0) |

## 실행 방법

1. Eclipse → File → Import → **Existing Projects into Workspace** → 저장소 폴더 선택
   - "Copy projects into workspace"는 **체크 해제**
2. Window → Preferences → Server → Runtime Environments → **Apache Tomcat v9.0** 등록
3. 프로젝트 우클릭 → Run As → **Run on Server**
4. 브라우저에서 접속
   ```
   http://localhost:{포트}/AgriBioLab/view/compensationList.jsp
   ```
   포트는 각자 Tomcat 설정(`server.xml`)을 따릅니다. 기본값은 8080입니다.

## 폴더 구조

```
src/main/webapp/
├ view/                  JSP 화면
│  ├ head.jsp            공통 <head>
│  ├ header.jsp          공통 헤더·GNB·전체 메뉴
│  └ side_○○.jsp         메뉴별 사이드메뉴
└ resources/css/         스타일
   ├ common.css          전체 공통
   ├ header.css, sidemenu.css
   ├ searchBox.css       검색영역
   ├ table.css           목록 표
   └ detail.css          상세 정보표
```

## 협업 규칙

브랜치, 커밋, PR 규칙은 [CONTRIBUTING.md](CONTRIBUTING.md)를 참고해 주세요.
