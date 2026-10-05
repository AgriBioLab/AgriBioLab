현재 저장소에는 QualityOfficerDAOImpl, QualityOfficerDAOTest, Service, Action 구현이 없습니다. 아래 구현 예시는 이후 따라 작성하는 학습용입니다. 현재 커밋 범위는 DAO 인터페이스·빈 VO·Query_min·DBCP 및 DB 스크립트입니다.

현재 실습 준비 상태: DAO는 model.dao_min, VO는 model.vo_min 패키지입니다. 실제 QualityOfficerVO.java는 빈 클래스입니다. 아래 필드·메서드가 있는 코드는 이후 직접 작성할 학습용 완성 예시입니다.

# 업무리스트 SQL과 MVC Model2 로그인 예제 연결

## 먼저 업무리스트 SQL과 현재 코드를 비교합니다

업무리스트에 남아 있는 SQL은 변경 전 버전입니다.

```sql
SELECT officer_id, username, name, department
FROM quality_assurance_officer
WHERE username = 'quality01'
AND password = 'quality1234';
```

SELECT는 로그인 성공 시 가져올 정보, WHERE는 입력한 아이디와 비밀번호가 일치하는 행을 찾는 조건입니다. SELECT에 username을 쓰는 것과 WHERE에서 username으로 검사하는 것은 서로 다른 역할입니다. SELECT에서 username을 빼도 WHERE의 아이디 검사는 그대로 실행됩니다.

오늘 변경한 실제 DB에서는 department를 position으로 바꿨습니다. 화면에는 직책과 이름만 필요하다고 정했으므로 현재 조회 결과는 두 컬럼입니다. officer_id와 username이 DB에서 삭제된 것은 아닙니다.

```java
// DB에서 직접 확인할 때는 'quality01', 'quality1234'를 입력합니다.
// Java에서는 매번 사용자가 입력한 값을 받아야 하므로 그 자리를 ?로 바꿉니다.
// department는 오늘 DDL에서 position으로 변경했습니다.
// 화면 표시 결과 두 개만 VO로 받을 것이므로 SELECT position, name입니다.
String QUALITY_OFFICER_LOGIN = "SELECT position, name FROM quality_assurance_officer WHERE username = ? AND password = ?";
```

업무리스트 SQL 본문은 아직 변경 전입니다. 현재 DB에 그대로 실행하면 department 컬럼이 없어 오류가 납니다. 업무리스트에도 공유할 최종 SQL은 다음과 같습니다.

```sql
SELECT position, name
FROM quality_assurance_officer
WHERE username = 'quality01'
AND password = 'quality1234';
```

로그인 결과에 식별번호·아이디까지 담기로 요구사항을 변경한다면 SELECT officer_id, username, name, position으로 조회하고 VO와 DAO에도 두 필드를 추가합니다. 화면에 없다고 무조건 조회하면 안 되는 것은 아니며, 이번에는 합의한 두 필드 범위에 맞춘 것입니다.

## 실제 확인한 학습자료와 연결

32_MVCModel2_old의 LoginAction.execute에는 다음 코드가 있습니다.

```java
// 학습자료 원본: 로그인 처리 연결 전의 틀입니다.
//나중에 DAO 연결 로그인 처리
//로그인 여부에 따라 url 달라져야 한다.
String url="view/ok.jsp";
return url;
```

이 파일은 DB 인증까지 완성된 관리자 로그인 예제는 아닙니다. 다음 설명은 이 Action 틀에 같은 학습자료 CustomerDAO의 조회 방식과 현재 담당자 DAO를 연결하는 가이드입니다.

## 작성 순서와 실행 순서

작성 순서: VO → DAO 인터페이스 → Query → DAO 구현 → main 테스트. 아래 기존 1~5번의 전체 코드를 순서대로 작성합니다.

화면 연결은 그 다음에 Service → LoginAction → ActionFactory·FrontController 연결 → 로그인 JSP → 결과 JSP 순서로 진행합니다. 아래 화면 연결 코드는 설명용이며 현재 프로젝트에 구현한 상태는 아닙니다.

실행 순서: 로그인 JSP 입력 → FrontController → ActionFactory → LoginAction → Service → DAO → DB → VO 반환 → Action에서 성공/실패 판단 → JSP 표시.

## DAO에서 ?를 채우는 순서

```java
// 1. test 또는 Service가 호출할 때 전달한 입력값입니다.
//    username = "quality01", password = "quality1234"인 경우를 생각해 보세요.

// 2. Query의 SQL을 실행할 준비를 합니다.
PreparedStatement pstmt = conn.prepareStatement(Query_min.QUALITY_OFFICER_LOGIN);

// 3. 첫 번째 ?는 WHERE username, 두 번째 ?는 password 자리입니다.
pstmt.setString(1, username);
pstmt.setString(2, password);

// 4. SELECT 결과를 받습니다. INSERT처럼 executeUpdate()를 사용하지 않습니다.
ResultSet rs = pstmt.executeQuery();

// 5. 일치하는 행이 있으면 VO에 조회 결과를 넣습니다.
QualityOfficerVO officer = null;
if (rs.next()) {
    officer = new QualityOfficerVO();
    officer.setPosition(rs.getString("position")); // DB 직책 → VO 직책
    officer.setName(rs.getString("name"));         // DB 표시 이름 → VO 이름
}
// officer == null이면 일치하는 계정이 없습니다.
// 실제 DAO 전체 코드에는 rs와 pstmt를 닫는 finally도 포함됩니다.
```

## 학습자료 LoginAction에 연결할 때 바꾸는 부분

현재 login.jsp의 입력 name은 loginId, loginPassword입니다. 요청 파라미터 이름은 이 값과 정확히 맞춰야 합니다. DB 컬럼 username과 HTML 입력 name이 같은 이름일 필요는 없습니다.

```java
// LoginAction.execute 안에서 입력을 꺼내는 부분입니다.
String username = request.getParameter("loginId");
String password = request.getParameter("loginPassword");

// 다음 단계에 작성할 Service에 두 입력을 전달하는 형태입니다.
// 아직 QualityOfficerService 클래스는 구현하지 않았으므로 지금 복사해서 실행하지 않습니다.
QualityOfficerVO officer = new QualityOfficerService().login(username, password);

// 학습자료의 무조건 성공 페이지 반환 부분을 성공/실패 조건으로 바꿉니다.
if (officer != null) {
    // 페이지가 바뀌어도 로그인 정보를 유지하도록 세션에 VO를 저장합니다.
    // password는 VO에 없으므로 세션에도 저장하지 않습니다.
    request.getSession().setAttribute("loginOfficer", officer);
    return "view/index.jsp";
}

// 계정이 일치하지 않을 때 로그인 페이지에 메시지를 전달합니다.
request.setAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
return "view/login.jsp";
```

Service의 역할은 학습자료 CustomerService처럼 DBCP로 연결을 만들고 DAO 생성자에 전달한 뒤 finally에서 연결을 닫는 것입니다. 현재 main 테스트가 이 연결·호출 역할을 대신하고 있습니다. 로그인 SELECT에는 회원등록 예제의 commit/rollback 처리가 필요하지 않습니다. DB 오류는 로그인 실패와 구분해 처리합니다.

현재 JSP는 form이 index.jsp로 직접 이동합니다. MVC Model2 연결 시 form을 FrontController 경로로 보내고, 학습자료 ActionFactory의 loginAction 분기로 연결해야 합니다. 컨트롤러 경로와 명령 파라미터 이름은 프로젝트의 실제 매핑에 맞춥니다. 비밀번호 입력을 보내는 form은 method="post"로 바꿉니다.

성공 후 JSP 표시 예:

```jsp
<%-- 로그인 Action이 세션에 넣은 VO의 getter를 사용합니다. --%>
<%-- position → getPosition(), name → getName() --%>
${sessionScope.loginOfficer.position} ${sessionScope.loginOfficer.name}님
```

## 지금 직접 실행할 것은 main 테스트입니다

QualityOfficerDAOTest에서 dao.login("quality01", "quality1234")를 실행하면 직책 품질담당자, 이름 이*규가 출력됩니다. 비밀번호를 wrong으로 바꾸면 실패 메시지가 나옵니다. 이 조회가 이해되면 화면 연결 단계로 넘어갑니다.

---

# 학습자료를 복사해서 품질담당자 로그인으로 바꾸기

코드 안의 주석을 위에서 아래로 따라가세요. 작성 순서는 1 → 2 → 3 → 4 → 5입니다.
파일이 이미 있으므로 새로 만들기보다 기존 파일과 비교하면서 변경해도 됩니다.
각 Java 코드 블록은 해당 파일 전체입니다. 학습자료 원본은 그대로 두고 AgriComp에서 연습합니다.

참고한 학습자료:
- `20_JDBCMin/src/kr/swdl/dao/EmployeeVO.java`: 필드, 생성자, getter/setter.
- `32_MVCModel2_old/src/main/java/kr/swdl/model/CustomerDAO.java`: Connection 생성자, getCustomer 조회 흐름.
- 같은 학습 프로젝트의 `Query.java`: SQL 상수 보관.

CustomerDAO 학습자료는 DAO 클래스 하나입니다. 현재 프로젝트는 DAO 인터페이스와 구현 클래스로 나뉘어 있으므로 2번은 메서드 약속, 4번은 실제 조회 코드로 작성합니다.
현재 클래스 이름 QualityOfficer는 품질담당자를 의미하며 DB 테이블명은 quality_assurance_officer입니다.

## 1. EmployeeVO를 복사하고 필드·생성자·getter/setter 변경

파일: src/main/java/model/vo_min/QualityOfficerVO.java

```java
// [작성 순서 1] 20_JDBCMin의 EmployeeVO.java를 복사해서 변경합니다.
// package를 model.vo로, 클래스와 생성자 이름을 QualityOfficerVO로 바꿉니다.
package model.vo_min;

public class QualityOfficerVO {
    // 기존 사원번호·급여·이름 필드를 지우고 화면에 필요한 두 필드를 작성합니다.
    // position은 직책(품질담당자), name은 화면 표시 이름(이*규)입니다.
    // 아이디와 비밀번호는 로그인 입력으로만 사용하므로 이 VO에는 담지 않습니다.
    private String position;
    private String name;

    // DAO가 빈 VO를 만들고 setter로 조회 결과를 넣을 때 사용합니다.
    public QualityOfficerVO() {
    }

    // 학습자료처럼 모든 필드를 받는 생성자도 작성합니다.
    public QualityOfficerVO(String position, String name) {
        setPosition(position);
        setName(name);
    }

    // Eclipse: Source → Generate Getters and Setters에서 두 필드를 선택합니다.
    // DAO는 setter로 저장하고 test는 getter로 출력합니다.
    public String getPosition() {
        return position;
    }
    public void setPosition(String position) {
        this.position = position;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}

```

## 2. DAO 인터페이스에 login 메서드 작성

파일: src/main/java/model/dao_min/QualityOfficerDAO.java

```java
package model.dao_min;

import java.sql.SQLException;
import model.vo_min.QualityOfficerVO;

public interface QualityOfficerDAO {
    // CustomerDAO.getCustomer(int customerId)의 조회 역할을 login으로 바꿉니다.
    // 입력: 고객번호 1개 → 아이디와 비밀번호 2개.
    // 반환: 이름 String → 담당자 직책과 이름을 담은 QualityOfficerVO.
    // 성공하면 VO, 조회 결과가 없으면 null. SQLException은 test의 catch에서 처리합니다.
    QualityOfficerVO login(String username, String password) throws SQLException;
}


```

## 3. Query의 SQL 상수를 담당자 로그인 SQL로 변경

파일: src/main/java/util/Query_min.java

```java
// [작성 순서 3] 학습자료 Query 인터페이스의 SQL 상수 패턴입니다.
package util;

public interface Query_min {
    // DB의 position(직책), name(표시 이름) 두 컬럼을 조회합니다.
    // 기존 department 컬럼은 position으로 변경했고 품질담당자를 저장합니다.
    // name에는 샘플데이터의 마스킹된 표시 이름 이*규가 들어 있습니다.
    // ? 순서: 1번 아이디, 2번 비밀번호. 부서는 조회하지 않습니다.
    String QUALITY_OFFICER_LOGIN = "SELECT position, name FROM quality_assurance_officer WHERE username = ? AND password = ?";
}

```

## 4. CustomerDAO의 생성자와 getCustomer를 로그인 조회로 변경

파일: src/main/java/model/dao/QualityOfficerDAOImpl.java

```java
// [작성 순서 4] 32_MVCModel2_old의 CustomerDAO 생성자와 getCustomer 메서드를 참고합니다.
// 클래스 이름: CustomerDAO → QualityOfficerDAOImpl. package와 import도 현재 프로젝트로 바꿉니다.
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.vo_min.QualityOfficerVO;
import util.Query_min;

public class QualityOfficerDAOImpl implements model.dao_min.QualityOfficerDAO {
    private Connection conn;

    // CustomerDAO(Connection conn) 생성자 패턴을 복사합니다.
    // 이번에는 test가 만든 Connection을 받습니다. this.conn은 이 클래스의 필드입니다.
    public QualityOfficerDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public QualityOfficerVO login(String username, String password) throws SQLException {
        // getCustomer의 매개변수 int customerId 대신 로그인 입력값 2개를 받습니다.
        // @Override는 위 인터페이스에서 약속한 login을 구현한다는 표시입니다.
        if (username == null || username.isBlank() || password == null || password.isEmpty()) {
            return null;
        }
        // 학습자료 String name = null → QualityOfficerVO officer = null로 변경합니다.
        // 결과가 없으면 이 null이 그대로 반환되어 test에서 로그인 실패로 판단합니다.
        QualityOfficerVO officer = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            // ① GET_CUSTOMER를 작성 순서 3에서 만든 로그인 SQL 상수로 바꿉니다.
            pstmt = conn.prepareStatement(Query_min.QUALITY_OFFICER_LOGIN);
            // ② 기존 setInt(1, customerId) 대신 String 입력값 2개를 넣습니다.
            // 1과 2는 컬럼 번호가 아니라 SQL 안의 ? 순서입니다.
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            // ③ SELECT이므로 executeQuery()입니다. 조회 결과를 ResultSet으로 받습니다.
            rs = pstmt.executeQuery();
            // ④ rs.next()가 true이면 일치하는 계정이 있습니다.
            if (rs.next()) {
                // 기존 name = rs.getString(1) 대신 VO를 만들고 직책과 이름을 채웁니다.
                // getInt/getString 안은 실제 DB 컬럼명, set...은 VO의 메서드 이름입니다.
                officer = new QualityOfficerVO();
                officer.setPosition(rs.getString("position"));
                officer.setName(rs.getString("name"));
            }
        } finally {
            // ⑤ 학습자료의 rs.close(), pstmt.close()를 finally로 옮겨 오류 때도 정리합니다.
            // 안쪽 finally는 rs.close()에서 오류가 나도 pstmt.close()를 실행하게 합니다.
            // conn은 여기서 닫지 않습니다. 연결을 만든 test가 마지막에 닫습니다.
            try {
                if (rs != null) rs.close();
            } finally {
                if (pstmt != null) pstmt.close();
            }
        }
        // ⑥ 완성한 VO 또는 null을 test로 돌려줍니다.
        return officer;
    }
}


```

## 5. main에서 DAO 생성·호출·출력

파일: src/main/java/test/QualityOfficerDAOTest.java

```java
// [작성 순서 5] 학습자료의 main에서 DAO를 만들고 조회 결과를 확인하는 흐름입니다.
// 클래스 이름과 import를 아래처럼 변경합니다. 이 파일을 Java Application으로 실행합니다.
package test;

import java.sql.Connection;
import java.sql.SQLException;

import model.dao.QualityOfficerDAOImpl;
import model.vo_min.QualityOfficerVO;
import util.DBCP;

public class QualityOfficerDAOTest {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            // 1. DB 연결
            conn = DBCP.getConnection();

            // 2. 학습자료 new CustomerDAO(conn) → new QualityOfficerDAOImpl(conn).
            QualityOfficerDAOImpl dao = new QualityOfficerDAOImpl(conn);

            // 3. getCustomer(고객번호) → login(아이디, 비밀번호).
            // 첫 실행은 아래 값 그대로 사용합니다. DB 접속용 HR 비밀번호와는 다릅니다.
            // 두 번째 실행은 "quality1234"만 "wrong"으로 바꿔 실패를 확인합니다.
            // 연습 후 "quality1234"로 돌려놓습니다. 다른 코드는 수정하지 않아도 됩니다.
            QualityOfficerVO officer = dao.login("quality01", "quality1234");

            // 4. 반환값은 String이 아닌 VO입니다. null 여부를 먼저 확인합니다.
            // 성공한 경우 VO getter로 꺼냅니다. null에서 getter를 호출하면 오류가 납니다.
            if (officer != null) {
                System.out.println("로그인 성공");
                System.out.println("직책: " + officer.getPosition());
                System.out.println("이름: " + officer.getName());
            } else {
                System.out.println("아이디 또는 비밀번호가 틀렸습니다.");
            }
        } catch (SQLException e) {
            // 로그인 실패는 위 else입니다. 여기는 DB 연결/SQL 실행 오류를 확인하는 곳입니다.
            e.printStackTrace();
        } finally {
            // DAO를 사용한 뒤 DB 연결 종료
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


```

## 실행하면서 바꿔 보기

1. Eclipse에서 QualityOfficerDAOTest.java를 열고 Run As → Java Application을 실행합니다.
2. quality01 / quality1234 그대로 실행하면 로그인 성공과 직책과 이름이 출력됩니다.
3. test의 dao.login("quality01", "quality1234")에서 비밀번호만 "wrong"으로 바꿉니다.
4. 다시 실행하면 아이디 또는 비밀번호가 틀렸습니다.가 출력됩니다.
5. "quality1234"로 복구합니다.

실행 순서는 test → DBCP 연결 → DAO.login → Query SQL 실행 → VO에 값 저장 → test 출력입니다.
작성 순서와 실행 순서는 다릅니다. 먼저 필요한 클래스들을 작성하고 마지막에 test를 실행합니다.

DBCP와 db.properties는 이미 준비되어 있습니다. 이번 연습에서는 그대로 사용합니다.
파일을 찾을 수 없다는 오류가 나면 Run Configurations → Arguments → Working directory를 AgriComp 프로젝트 루트로 지정합니다.
Oracle 드라이버 오류가 나면 Java Build Path → Libraries에서 src/main/webapp/WEB-INF/lib/ojdbc6.jar를 추가합니다.

이번 화면 기준: VO는 position(품질담당자), name(이*규) 두 필드입니다. DDL과 실제 Oracle의 department 컬럼을 position으로 변경했습니다. 로그인 SQL은 고정 문자열 대신 DB의 position 값을 조회합니다.
