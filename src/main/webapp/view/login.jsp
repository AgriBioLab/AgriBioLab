<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<title>농산물품질 - 담당자 로그인</title>

<!-- 로그인 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
</head>

<body class="login-page">

	<main class="login-wrap">
		<section class="login-panel" aria-labelledby="loginTitle">
			<div class="login-brand">
				<div class="login-logo">로고</div>
				<p class="login-system-name">농산물품질</p>
			</div>

			<h1 id="loginTitle" class="login-title">담당자 로그인</h1>

			<form class="login-form" method="get" action="${pageContext.request.contextPath}/view/index.jsp">
				<div class="login-field">
					<label for="loginId">아이디</label>
					<input type="text" id="loginId" name="loginId" value="quality01" autocomplete="username">
				</div>

				<div class="login-field">
					<label for="loginPassword">비밀번호</label>
					<div class="password-input-wrap">
						<input type="password" id="loginPassword" name="loginPassword" value="quality1234" autocomplete="current-password">
						<button type="button" class="password-toggle" data-target="loginPassword">보이기</button>
					</div>
				</div>

				<button type="submit" class="login-submit">로그인</button>
			</form>
		</section>
	</main>

	<script>
		document.querySelectorAll(".password-toggle").forEach(function(button) {
			button.addEventListener("click", function() {
				var target = document.getElementById(button.dataset.target);

				var isHidden = target.type === "password";
				target.type = isHidden ? "text" : "password";
				button.textContent = isHidden ? "숨기기" : "보이기";
			});
		});
	</script>

</body>
</html>

