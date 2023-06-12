<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WJ_mail 회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/joinMembership.css">

<script>
function checkDuplicateId() {
    var id = document.getElementById("id").value;
    var idErrorMessage_len = document.getElementById("idErrorMessage_len");
    var idErrorMessage_duplicate = document.getElementById("idErrorMessage_duplicate");
    var idAvailableMessage = document.getElementById("idAvailableMessage");

    // Hide previous error messages
    idErrorMessage_len.style.display = "none";
    idErrorMessage_duplicate.style.display = "none";
    idAvailableMessage.style.display = "none";

    // Implement your code to check duplicate ID using AJAX or form submission
    // You can use the 'id' variable to send the ID value to the server

    // Example code to make an AJAX request to check duplicate ID
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = xhr.responseText;
                if (response === "duplicate") {
                    idErrorMessage_duplicate.style.display = "block";
                } else {
                    idAvailableMessage.style.display = "block";
                }
            } else {
                console.log("Error: " + xhr.status);
            }
        }
    };
    xhr.open("POST", "/CheckDuplicateIdController", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send("id=" + id);
}


    function validateForm() {
        var id = document.getElementById("id").value;
        var password = document.getElementById("password").value;
        var idErrorMessage_len = document.getElementById("idErrorMessage_len");
        var passwordErrorMessage = document.getElementById("passwordErrorMessage");

        // Hide previous error messages
        idErrorMessage_len.style.display = "none";
        passwordErrorMessage.style.display = "none";

        // 아이디 중복 확인
        // Implement your code for duplicate ID check here

        // 아이디 길이 제한 (10자 이하)
        if (id.length > 10) {
            idErrorMessage_len.style.display = "block";
            return false;
        }

        // 비밀번호 길이 제한 (6자 이상 15자 이하)
        if (password.length > 15 || password.length < 6) {
            passwordErrorMessage.style.display = "block";
            return false;
        }

        // 비밀번호에 특수기호 포함 여부 확인
        var specialCharacters = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
        if (!specialCharacters.test(password)) {
            passwordErrorMessage.style.display = "block";
            return false;
        }

        // 비밀번호에 영어 대문자 포함 여부 확인
        var uppercaseLetters = /[A-Z]+/;
        if (!uppercaseLetters.test(password)) {
            passwordErrorMessage.style.display = "block";
            return false;
        }

        return true;
    }
</script>

</head>
<body>
   <a href="main.jsp" id="logo"><img src="../css/wj_logo.jpg"></a>
   <hr>
    <h2>회원가입</h2>
    <form id="signup-form" action="/JoinMembershipController" method="POST" onsubmit="return validateForm()">
        <!-- Form fields -->
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required>
        <span id="idErrorMessage_len" style="color: red; display: none;">아이디는 10자 이하여야 합니다.</span><br>
        <button type="button" onclick="checkDuplicateId()">중복확인</button>
        <span id="idErrorMessage_duplicate" style="color: red; display: none;">아이디가 중복됩니다.</span>
        <span id="idAvailableMessage" style="color: green; display: none;">사용 가능합니다!</span><br>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
        <span id="passwordErrorMessage" style="color: red; display: none;">비밀번호는 6자 이상 15자 이하여야 하며, <br>특수기호와 대문자가 포함되어야 합니다.</span><br>

        <label for="address">주소:</label>
        <input type="text" id="address" name="address" required><br>

        <button type="submit">가입 완료</button>
        <button type="button" onclick="cancel()">취소</button>
    </form>
   <script>
   function cancel()
   {
      event.preventDefault(); // 기본 이벤트 처리 방지 (페이지 이동 막음)
       window.location.href = "main.jsp"; // 회원가입 페이지로 이동
   }
</script>
</body>
</html>