<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<div class='container'>
    <h2>간단한 로그인</h2>
    <form action="loginPage.do" method="POST">
        <label for="username">아이디:</label>
        <input type="text" id="user_id" name="user_id" required>
        <br>
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <button type="submit">로그인</button>
    </form>
	
</div>

</body>
</html>