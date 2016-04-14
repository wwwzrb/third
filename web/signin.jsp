<%--
  Created by IntelliJ IDEA.
  User: wcy
  Date: 2016/4/8
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>$Title$</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">

    <script src="js/bootstrap.min.js"></script>

  </head>
  <body>
  <div class="container">
  <form class="form-signin" action="signinServlet" method="post">
    <h2 class="form-signin-heading">Please sign in</h2>
    <input type="text" name="Name" class="form-control" placeholder="Name" required autofocus>
    <input type="password" name="Password" class="form-control" placeholder="Password" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

  </form>
  </div> <!-- /container -->

  </body></html>
