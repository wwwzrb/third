package org.servlet;

/**
 * Created by wcy on 2016/4/9.
 */
import javax.servlet.*;
import javax.servlet.http.*;
import org.model.*;
import org.dao.*;

import java.io.IOException;

public class adminServlet extends javax.servlet.http.HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws  ServletException,
            IOException {
        request.setCharacterEncoding("gb2312");
        SigninDao signinDao=new SigninDao();
        HttpSession session=request.getSession();
        String userId=request.getParameter("userId");
        String userName=request.getParameter("userName");
        String passWord=request.getParameter("passWord");
        String productId=request.getParameter("productId");
        String productCode=request.getParameter("productCode");
        String productName=request.getParameter("productName");
        String ps=request.getParameter("productSource");
        int productSource=0;
        session.setAttribute("InsertUser","Success");
        session.setAttribute("DeleteUser","Success");
        session.setAttribute("InsertProduct","Success");
        session.setAttribute("DeleteProduct","Success");
        if(userId!=null){
            if(userName!=null){
                if(signinDao.insertUser(userId,userName,passWord)){
                    response.sendRedirect("admin.jsp");
                }
                else{
                    session.setAttribute("InsertUser","InsertUser");
                    response.sendRedirect("error.jsp");
                }
            }
            else{
                if(signinDao.deleteUser(userId)){
                    response.sendRedirect("admin.jsp");
                }
                else{
                    session.setAttribute("DeleteUser","DeleteUser");
                    response.sendRedirect("error.jsp");
                }
            }
        }
        if(productId!=null)
        {
            if(productCode!=null){
                if(ps!=null)
                {
                    productSource=Integer.parseInt(ps);
                }
                if(signinDao.insertProduct(productId,productCode,productName,productSource)){
                    response.sendRedirect("admin.jsp");
                }
                else{
                    session.setAttribute("InsertProduct","InsertProduct");
                    response.sendRedirect("error.jsp");
                }
            }
            else{
                if(signinDao.deleteProduct(productId)){
                    response.sendRedirect("admin.jsp");
                }
                else{
                    session.setAttribute("DeleteProduct","DeleteProduct");
                    response.sendRedirect("error.jsp");
                }
            }
        }
    }
}
