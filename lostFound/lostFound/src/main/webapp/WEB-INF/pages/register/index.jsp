<%--
  Created by IntelliJ IDEA.
  User: dwight12
  Date: 2016/3/12
  Time: 16:29
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

    <title>index</title>

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        .right{float:right}
    </style>
</head>
<body>
<div class="container">
    <div class="right">
        <h3>
            <a href="/login" type="button" class="btn btn-primary btn-sm">login</a>
            <a href="/addUser" type="button" class="btn btn-primary btn-sm">add</a>
        </h3>
    </div>
    <jsp:include page="/tourists" flush="true"/>
</div>

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
