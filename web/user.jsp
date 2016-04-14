<%--
  Created by IntelliJ IDEA.
  User: wcy
  Date: 2016/4/8
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="org.model.*" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand active" href="user.jsp">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="week.jsp">一周</a></li>
                <li><a href="buy.jsp">已购</a></li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="ProductInfo">
                </div>
                <button type="submit" class="btn btn-default">搜索商品</button>
            </form>
            <div>
                <p class="navbar-text navbar-right"><a href="signin.jsp" class="navbar-link">登出</a></p>
            </div>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<form method="post" action="buyServlet">
    <%
        session.setAttribute("buy",session.getAttribute("user"));
    %>
    <table class="table table-hover table-bordered reference">
        <thead>
        <tr class="active">
            <th>商品号</th>
            <th>商品</th>
            <th>购买</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>0</td>
            <td>Computer</td>
            <td><input type="checkbox" name="item" value="0"/></td>
        </tr>
        <tr>
            <td>1</td>
            <td>Phone</td>
            <td><input type="checkbox" name="item" value="1"/></td>
        </tr>
        <tr>
            <td>2</td>
            <td>Disk</td>
            <td><input type="checkbox" name="item" value="2"/><br/></td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value="购买"/>
</form>

</body></html>
