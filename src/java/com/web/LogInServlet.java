/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web;

import javax.servlet.*;
import java.sql.Connection;
import javax.servlet.http.*;
import java.io.*;
import com.database.*;

public class LogInServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        int res;
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        Connection conn = Conn.getConection();
        res = SearchRec.searchLogIn(conn, username, pass);
        if(res == 1){//vrike idio name
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response); 
        }else{
            RequestDispatcher view = request.getRequestDispatcher("LogInNotFound.html");
            view.forward(request, response); 
        }
    }
}
