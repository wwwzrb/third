package org.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import org.model.*;
import org.dao.*;

import java.io.IOException;

/**
 * Created by wcy on 2016/4/9.
 */
public class signinServlet extends javax.servlet.http.HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws  ServletException,
            IOException {
        request.setCharacterEncoding("gb2312");
        SigninDao signinDao=new SigninDao();
        user u=signinDao.checkUser(request.getParameter("Name"),request.getParameter("Password"));
        HttpSession session=request.getSession();
        if(u!=null){
            session.setAttribute("SignIn","Success");
            if(u.getUsername().equals("admin")){
                response.sendRedirect("admin.jsp");
            }
            else{
                session.setAttribute("user",u);
                response.sendRedirect("user.jsp");
            }
        }
        else{
            session.setAttribute("SignIn","SignIn");
            response.sendRedirect("error.jsp");
        }
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws  ServletException,
            IOException {
        doGet(request,response);
    }
}
