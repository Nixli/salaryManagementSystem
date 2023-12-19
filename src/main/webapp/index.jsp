<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>工资管理系统登录</title>
    <style>
        body {
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        #login-form {
            border: none;
            background-color: #fff;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0);
            padding: 15px;
            width: 300px;
        }

        #login-form img {
            width: 72px;
            height: 72px;
            margin-bottom: 15px;
        }

        h1 {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }

        label {
            display: none;
        }

        input[type="text"],
        input[type="password"],
        input[type="checkbox"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="text"]:hover,
        input[type="password"]:hover,
        input[type="checkbox"]:hover {
            border-color: #3498db;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            transition: background-color 0.3s;
            width: 100%; /* 设置按钮宽度为100% */
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }


        .checkbox label {
            display: inline-block;
            vertical-align: middle;
        }

        .checkbox input[type="checkbox"] {
            vertical-align: middle;
            margin-right: 5px;
        }

        .language-btn {
            margin-top: 15px;
            display: inline-block;
            margin-right: 5px;
            padding: 5px 10px;
            font-size: 14px;
            text-decoration: none;
            border: 1px solid #ffffff;
            border-radius: 4px;
            color: black;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .language-btn:hover {
            background-color: #ffffff;
            color: black;
        }

        .language-btn:first-child {
            margin-right: 0;
        }


    </style>

</head>
<body>

<form id="login-form" action="login" method="post">
    <img src="img/bootstrap-solid.svg" alt="">
    <h1 class="h1">Please sign in</h1>
    <label for="username">Username</label>
    <input type="text" id="username" name="username" placeholder="Username" pattern=".{1,}" title="Username cannot be empty." required="" autofocus="">
    <label for="password">Password</label>
    <input type="password" id="password" name="pwd" placeholder="Password" pattern=".{1,}" title="Password cannot be empty." required="">
    <button type="submit">Sign in</button>
    <p>© 2022-2023</p>
    <a class="language-btn btn btn-sm">中文</a>
    <a class="language-btn btn btn-sm">English</a>
    <div id="errorMessage" style="color: black;"></div>
</form>

<script>
    // JavaScript 代码
    function showErrorMessage(message) {
        var errorMessageElement = document.getElementById("errorMessage");
        errorMessageElement.innerHTML = message;
        errorMessageElement.style.display = "block";
        // 五秒后隐藏错误消息
        setTimeout(function() {
            errorMessageElement.style.display = "none";
        }, 5000);
    }
</script>

</body>
</html>
