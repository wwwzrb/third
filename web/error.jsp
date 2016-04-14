<%--
  Created by IntelliJ IDEA.
  User: wcy
  Date: 2016/4/8
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
    <style>
        h2{
            text-align: center;
            font-size:  25px;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<%
    try{
        if(session.getAttribute("SignIn").equals("SignIn"))
        {
    }
%>
<h2><%=session.getAttribute("SignIn")%>失败<a href="signin.jsp">这里</a>返回登陆界面......</h2>
<%
    session.setAttribute("SignIn","Success");
    }
    catch (Exception e){
        e.printStackTrace();
    }
%>
<%
    try{
    if(session.getAttribute("InsertUser").equals("InsertUser"))
    {
%>
<h2><%=session.getAttribute("InsertUser")%>失败<a href="admin.jsp">这里</a>返回管理界面......</h2>
<%
        session.setAttribute("InsertUser","Success");
    }
    }catch (Exception e){
            e.printStackTrace();
        }
%>
<%
    try{
    if(session.getAttribute("DeleteUser").equals("DeleteUser"))
    {
%>
<h2><%=session.getAttribute("DeleteUser")%>失败<a href="admin.jsp">这里</a>返回管理界面......</h2>
<%
        session.setAttribute("DeleteUser","Success");
    }
    }
    catch (Exception e){
        e.printStackTrace();
    }
%>
<%
    try{
    if(session.getAttribute("InsertProduct").equals("InsertProduct"))
    {
%>
<h2><%=session.getAttribute("InsertProduct")%>失败<a href="admin.jsp">这里</a>返回管理界面......</h2>
<%
        session.setAttribute("InsertProduct","Success");
    }
    }
    catch (Exception e){
        e.printStackTrace();
    }
%>
<%
    try{
    if(session.getAttribute("DeleteProduct").equals("DeleteProduct"))
    {
%>
<h2><%=session.getAttribute("DeleteProduct")%>失败<a href="admin.jsp">这里</a>返回管理界面......</h2>
<%
        session.setAttribute("DeleteProduct","Success");
    }
    }
    catch (Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>
