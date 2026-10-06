// HTML 화면 이동을 확인하는 샘플입니다. 실제 인증은 서버 연결 단계에서 처리합니다.
function login() {
    var username = document.getElementById("loginId").value;
    var password = document.getElementById("loginPassword").value;

    if (username == "quality01" && password == "quality1234") {
        location.href = "compensationResultList.html";
    } else {
        alert("아이디 또는 비밀번호가 틀렸습니다.");
    }
    return false;
}

function showPassword() {
    var input = document.getElementById("loginPassword");
    var button = document.getElementsByClassName("password-toggle")[0];
    if (input.type == "password") {
        input.type = "text";
        button.textContent = "숨기기";
    } else {
        input.type = "password";
        button.textContent = "보이기";
    }
}
