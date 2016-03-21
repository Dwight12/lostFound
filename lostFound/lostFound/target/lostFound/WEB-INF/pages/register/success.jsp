<%--
  Created by IntelliJ IDEA.
  User: dwight12
  Date: 2016/3/17
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>blog</title>

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        .right{float:right}
    </style>
</head>
<body>
<div class="container">
    <div class="right">
        <h3>
            <c:if test="${user.id == 1}">
                <a href="/users" type="button" class="btn btn-primary btn-sm">userManagement</a></h3>
            </c:if>
            <a href="/showUser" type="button" class="btn btn-sm btn-success">detail</a>
            <a href="/updateUser" type="button" class="btn btn-sm btn-warning">update</a>
            <a href="/deleteUser" type="button" class="btn btn-sm btn-danger">delete</a>
            <a href="/showBlog" type="button" class="btn btn-sm btn-danger">showBlog</a>
        </h3>
    </div>

</div>

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>


