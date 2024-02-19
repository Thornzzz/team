<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <h2>아이디 찾기</h2>

    <form id="findIdForm">
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName">
        <br>
        <input type="button" value="확인" onclick="checkUserId()">
    </form>

    <div id="resultContainer"></div>

    <script>
        function checkUserId() {
            var userName = $("#userName").val();
			console.log(userName);
            $.ajax({
                type: "POST",
                url: "${contextPath}/member/Findid.do",
                dataType:"text",
                data: { userName: userName },
                success: function (data) {
                    $("#resultContainer").html("찾은 아이디: " + data);
                },
                error: function () {
                    alert("서버 오류 발생");
                }
            });
        }
    </script>
</body>
</html>