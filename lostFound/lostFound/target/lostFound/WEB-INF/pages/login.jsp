<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dwight12
  Date: 2016/3/17
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>登录</title>

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

</head>
<body>
<div class="container">

    <h1>登录</h1>
    <hr/>
    <form:form action="/login" method="post" commandName="user" role="form">
        <div class="form-group">
            <%--@declare id="firstname"--%>
            <label for="firstName">Nickname:</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Enter Nickname:"/>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="text" class="form-control" id="password" name="password" placeholder="Enter Password:"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>



</div>

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
