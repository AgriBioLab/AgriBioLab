// 공통 HTML을 불러오는 함수입니다.
function loadHTML(id, url) {
    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                document.getElementById(id).innerHTML = xhr.responseText;
            } else {
                document.getElementById(id).textContent = "공통 화면을 불러오지 못했습니다.";
            }
        }
    };

    xhr.open("get", url, true);
    xhr.send();
}

loadHTML("header", contextPath + "/view/common/header.html");
loadHTML("side", contextPath + "/view/common/side.html");
