package com.web;

import javax.servlet.*;
import java.sql.Connection;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.database.*;
public class SignInServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        int res;
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        Connection conn = Conn.getConection();
        res = SearchRec.search(conn, username);
        if(res == 1){//vrike idio name
            RequestDispatcher view = request.getRequestDispatcher("SignInFound.html");
            view.forward(request, response); 
        }else{
            //request.setAttribute("styles", result);
            res = AddRec.ins(conn, username, pass);
            if(res == -1){
                System.out.println("something went wrong in sign insertion");
                RequestDispatcher view = request.getRequestDispatcher("SignInFault.html");
                view.forward(request, response); 
            }else{
                System.out.println("insertion complete");
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
            }
        }
    } 
}
