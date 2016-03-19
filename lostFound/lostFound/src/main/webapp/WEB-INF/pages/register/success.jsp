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

</head>
<body>
<div class="container">
    <h1>blog</h1>
    <hr/>
    <!--用户列表是空的-->
    <!-- 如果用户列表为空 -->
    <c:if test="${empty blogList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Blog表为空，请<a href="/addBlog" type="button" class="btn btn-primary btn-sm">添加</a>
        </div>
    </c:if>

    <!-- 如果用户列表非空 -->
    <c:if test="${!empty blogList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
                <th>PubDate</th>
            </tr>

            <c:forEach items="${blogList}" var="blog">
                <tr>
                    <td>${blog.id}</td>
                    <td>${blog.title}</td>
                    <td>${blog.content}</td>
                    <td>${blog.pubDate}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

        <!--
        <a href="/showUser/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>
        <a href="/updateUser/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>
        <a href="/deleteUser/${user.id}" type="button" class="btn btn-sm btn-danger">删除</a>
        -->
    <td>
        <a href="/showUser/1" type="button" class="btn btn-sm btn-success">详情</a>
        <a href="/updateUser/1" type="button" class="btn btn-sm btn-warning">修改</a>
        <a href="/deleteUser/1" type="button" class="btn btn-sm btn-danger">删除</a>
    </td>

    <h3>add <a href="/addBlog" type="button" class="btn btn-primary btn-sm">add</a></h3>
</div>


<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>


