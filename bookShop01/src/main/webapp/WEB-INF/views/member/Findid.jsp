<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>아이디 찾기</title>
    <style>
        body {
            text-align: center;
            margin: 0;
            padding: 0;
        }

        #findIdForm {
            width: 300px;
            margin: 0 auto;
            text-align: left;
        }

        #findIdForm label {
            display: block;
            margin-bottom: 5px;
        }

        #findIdForm input {
            width: calc(100% - 16px); /* Adjusted width to consider padding */
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        #resultContainer {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>아이디 찾기</h2>

    <form id="findIdForm">
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName">
        <br>
        <label for="phoneNumber">전화번호 :</label>
        <input type="text" id="phoneNumber1" name="phoneNumber1" maxlength="3">
        <input type="text" id="phoneNumber2" name="phoneNumber2" maxlength="4">
        <input type="text" id="phoneNumber3" name="phoneNumber3" maxlength="4">
        <input type="button" value="확인" onclick="checkUserId()">
    </form>

    <div id="resultContainer"></div>

    <script>
        function checkUserId() {
            var userName = $("#userName").val();
            var phoneNumber1 = $("#phoneNumber1").val() || "";
            var phoneNumber2 = $("#phoneNumber2").val() || "";
            var phoneNumber3 = $("#phoneNumber3").val() || "";

            if (userName.trim() === "" || phoneNumber1.trim() === "" ||
                phoneNumber2.trim() === "" || phoneNumber3.trim() === "") {
                alert("이름과 전화번호를 모두 입력하세요.");
                return;
            }

            $.ajax({
                type: "POST",
                url: "${contextPath}/member/Findid.do",
                dataType: "text",
                data: {
                    userName: userName,
                    phoneNumber1: phoneNumber1,
                    phoneNumber2: phoneNumber2,
                    phoneNumber3: phoneNumber3
                },
                success: function (data) {
                	var popup = window.open("", "IdPopup", "width=400,height=200");
                    popup.document.write("<html><head><title>Id Found</title></head><body>");
                    popup.document.write("<h2>찾은 아이디: " + data + "</h2>");
                    popup.document.write("<button onclick='window.close();'>닫기</button>");
                    popup.document.write("</body></html>");
                },
                error: function () {
                    alert("서버 오류 발생");
                }
            });
        }
    </script>
</body>
</html>