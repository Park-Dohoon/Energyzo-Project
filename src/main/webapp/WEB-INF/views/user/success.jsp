<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 확인</title>
</head>
<body>
    <h2>아이디 찾기 성공</h2>
    
      찾은 아이디는 [${userId}] 입니다.<hr>
    
    
 
 
   찾은 아이디는  [       ${sessionScope.verifyAuthCode.userId}     ] 입니다.<hr>
			 <!-- verifyAuthCode 안에있는 userId를 받아오겠다 -->
			 
			 ${resultMessage} --%>
			 
			 
</body>
</html>