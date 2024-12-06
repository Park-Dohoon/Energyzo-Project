<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>옵션 추가</title>
</head>
<body>

<h2>옵션 추가</h2>
<form action="addOptionAction" method="post">
    <div>
        <label for="optName">옵션 이름</label>
        <input type="text" id="optName" name="est_opt_name" required>
    </div>
    <div>
        <button type="submit" class="btn btn-primary">추가</button>
    </div>
</form>

<a href="options">목록으로 돌아가기</a>

</body>
</html>
