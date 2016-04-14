<%--
  Created by IntelliJ IDEA.
  User: wcy
  Date: 2016/4/10
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="org.db.DBconn" %>
<%@ page import="org.model.*" %>
<%@ page import="java.util.Calendar" %>
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
            <a class="navbar-brand" href="user.jsp">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="week.jsp">一周</a></li>
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
<table class="table table-hover table-bordered reference">
    <h1 style="text-align: center">所有购买</h1>
    <thead>
    <tr class="active">
        <th>商品</th>
        <th>数量</th>
        <th>日期</th>
    </tr>
    </thead>
    <tbody>
    <%
        Connection conn;
        try{
            conn= DBconn.getConn();
            PreparedStatement ps=conn.prepareStatement("select productName,productNumber,shopDate from [shopRecords],[productTable]" +
                    "where [shopRecords].productId=[productTable].id and datediff(week,shopDate,getdate())=0");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                records r=new records();
                product p=new product();
                p.setProductName(rs.getString(1));
                r.setNumber(rs.getInt(2));
                r.setShopDate(rs.getTimestamp(3));
    %>
    <tr>
        <td><%=p.getProductName()%></td>
        <td><%=r.getNumber()%></td>
        <td><%=r.getShopDate()%></td>
    </tr>
    <%
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally {
            DBconn.CloseConn();
        }
    %>
    </tbody>
</table>
</body>
</html>

