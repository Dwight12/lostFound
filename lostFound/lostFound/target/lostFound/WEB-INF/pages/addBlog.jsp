<%--
  Created by IntelliJ IDEA.
  User: dwight12
  Date: 2016/3/17
  Time: 18:35
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

    <title>添加blog</title>

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <h1>添加blog</h1>
    <hr/>
    <form:form action="/addBlogPost" method="post" commandName="blog" role="form">
        <div class="form-group">
            <label for="firstName">Title:</label>
            <input type="text" class="form-control" id="firstName" name="title" placeholder="Enter Title:"/>
        </div>
        <div class="form-group">
            <label for="firstName">Content:</label>
            <input type="text" class="form-control" id="content" name="content" placeholder="Enter Content:"/>
        </div>
        <div class="form-group">
            <label for="lastName">PubDate:</label>
            <input type="text" class="form-control" id="lastName" name="pubDate" placeholder="Enter PubDate:"/>
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
