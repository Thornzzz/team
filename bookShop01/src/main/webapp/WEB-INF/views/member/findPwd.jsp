<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>비밀번호 찾기</title>
    <style>
        body {
            text-align: center;
            margin: 0;
            padding: 0;
        }

        #findPwdForm {
            width: 300px;
            margin: 0 auto;
            text-align: left;
        }

        #findPwdForm label {
            display: block;
            margin-bottom: 5px;
        }

        #findPwdForm input {
            width: 100%;
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
    <h2>비밀번호 찾기</h2>

    <form id="findPwdForm">
        <label for="userId">아이디:</label>
        <input type="text" id="userId" name="userId">
        <br>
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName">
        <br>
        <input type="button" value="확인" onclick="checkUserPwd()">
    </form>

    <div id="resultContainer"></div>

    <script>
        function checkUserPwd() {
            var userId = $("#userId").val();
            var userName = $("#userName").val();

            if(userId.trim()===""){
            	alert("아이디를 입력해주세요")
            	return;
            }
            else if(userName.trim()===""){
            	alert("이름을 입력해주세요")
            	return;
            }
        

            $.ajax({
                type: "POST",
                url: "${contextPath}/member/findPwd.do",
                dataType: "text",
                data: {
                    userId: userId,
                    userName: userName
                },
                success: function (data) {
                    var popup = window.open("", "PasswordPopup", "width=400,height=200");
                    popup.document.write("<html><head><title>Password Found</title></head><body>");
                    popup.document.write("<h2>찾은 비밀번호: " + data + "</h2>");
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