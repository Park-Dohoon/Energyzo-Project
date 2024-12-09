<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SMS 전송</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    function sendSMS(pageName) {
        const to = $("input[name='to']").val();
        if (!to) {
            alert("수신 번호를 입력하세요!");
            return;
        }
        console.log("수신 번호:", to);
        $("#smsForm").attr("action", pageName + ".do");
        $("#smsForm").submit();
    }

    </script>
</head>
<body>
    <form id="smsForm" method="post">
        <ul>
            <li>보낼 사람: <input type="text" name="to"></li>
            <li>보내는 사람: <input type="text" name="from"></li>
            <li>내용: <textarea name="text"></textarea></li>
            <li><input type="button" onclick="sendSMS('sendSms')" value="전송하기"></li>
        </ul>
    </form>
</body>
</html>
