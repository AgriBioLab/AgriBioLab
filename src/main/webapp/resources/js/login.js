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
