<%--
  Created by IntelliJ IDEA.
  User: wcy
  Date: 2016/4/9
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="org.db.DBconn" %>
<%@ page import="org.model.*" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        div{margin:0;padding:0}
        .container{width:1300px;height:500px}
        .container .box1{width:600px;float: left;}
        .container .box2{margin-left:50px;width:600px;float: left;}
        .input{width: 120px}
    </style>
</head>
<body>
<div class="container">
    <div class="box1">
        <div>
            <table class="table table-hover table-bordered reference">
                <h1 style="text-align: center">用户管理</h1>
                <thead>
                <tr class="active">
                    <th>用户id</th>
                    <th>用户名</th>
                    <th>密码</th>
                </tr>
                </thead>
                <tbody>
                <%
                    Connection conn;
                    try{
                        conn= DBconn.getConn();
                        PreparedStatement ps=conn.prepareStatement("select * from [userInfo]");
                        ResultSet rs=ps.executeQuery();
                        while(rs.next()){
                            user u=new user();
                            u.setId(rs.getString(1));
                            u.setUsername(rs.getString(2));
                            u.setPassword(rs.getString(3));
                        %>
                        <tr>
                        <td><%=u.getId()%></td>
                        <td><%=u.getUsername()%></td>
                        <td><%=u.getPassword()%></td>
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
        </div>
        <form action="adminServlet">
            <div style="display: table">
                <button style="text-align: center" type="submit">增加</button>
                <input name="userId" type="text"  placeholder="userId" required >
                <input name="userName" type="text" placeholder="userName" required >
                <input name="passWord" type="text"  placeholder="passWord" required >
            </div>
        </form>
        <form action="adminServlet">
            <div style="display: table">
                <button style="text-align: center" type="submit">删除</button>
                <input name="userId" type="text"  placeholder="userId" required >
            </div>
        </form>
    </div>
    <div class="box2">
        <div>
            <table class="table table-hover table-bordered reference">
                <h1 style="text-align: center">商品管理</h1>
                <thead>
                <tr class="active">
                    <th>商品id</th>
                    <th>商品编码</th>
                    <th>商品名</th>
                    <th>商品数量</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try{
                        conn= DBconn.getConn();
                        PreparedStatement ps=conn.prepareStatement("select * from [productTable]");
                        ResultSet rs=ps.executeQuery();
                        while(rs.next()){
                            product p=new product();
                            p.setId(rs.getString(1));
                            p.setProductCode(rs.getString(2));
                            p.setProductName(rs.getString(3));
                            p.setProdectSource(rs.getInt(4));
                %>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getProductCode()%></td>
                    <td><%=p.getProductName()%></td>
                    <td><%=p.getProdectSource()%></td>
                </tr>
                <%
                        }
                    }catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </div>
        <form action="adminServlet">
            <div style="display: table">
                <button style="text-align: center" type="submit">增加</button>
                <input class="input" name="productId" type="text"  placeholder="productId" required >
                <input class="input" name="productCode" type="text" placeholder="productCode" required >
                <input class="input" name="productName" type="text"  placeholder="productName" required >
                <input class="input" name="productSource" type="text"  placeholder="productSource" required >
            </div>
        </form>
        <form action="adminServlet">
            <div style="display: table">
                <button style="text-align: center" type="submit">删除</button>
                <input class="input" name="productId" type="text"  placeholder="productId" required >
            </div>
        </form>
    </div>
</div>

</body>
</html>
