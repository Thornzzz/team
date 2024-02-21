<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .faq-item {
            border-bottom: 1px solid #ccc;
            padding: 10px;
            cursor: pointer;
        }

        .answer {
            display: none;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>고객센터</h1>

        <div class="faq-item" onclick="toggleAnswer('q1')">
            <strong>Q:</strong>배송이 늦어지고 있을때는 어떡하나요?
            <div id="q1" class="answer">
                <strong>A:</strong>배송이 늦어질때애는 경우에 따라 다르긴하지만 최대한 빠르게 배송을 해드리려고 노력하고 있습니다.
                <br>특정한 상황이 아닌경우 미리 연락을 드리니 걱정하지마시고 기다려주시면 감사하겠습니다.
            </div>
        </div>

        <div class="faq-item" onclick="toggleAnswer('q2')">
            <strong>Q:</strong> 회원탈퇴는 어떻게 하나요?
            <div id="q2" class="answer">
                <strong>A:</strong> 회원탈퇴는 회원탈퇴가 따로 가능한 페이지에 들어가셔서 하시면 됩니다.
            </div>
        </div>

        <!-- Add more FAQ items as needed -->

    </div>

    <script>
        function toggleAnswer(questionId) {
            var answer = document.getElementById(questionId);
            if (answer.style.display === "none") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>

</body>
</html>