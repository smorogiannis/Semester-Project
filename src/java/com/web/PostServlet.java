package com.web;
import javax.servlet.*;
import java.sql.Connection;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.database.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Sotiris
 */
public class PostServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        int res;
        ResultSet rs;
        String uId = "";
        String title = request.getParameter("title");
        System.out.println("titlos"+title);
        String poem = request.getParameter("poem");
        System.out.println("poiima "+poem);
        String user = (String) request.getSession().getAttribute("username");
        System.out.println("poiitis "+user);
        poem = poem.replace("'","\\"+"'");
        Connection conn = Conn.getConection();
        rs = SearchRec.selUserId(conn, user);
        try {
            rs.next();
            uId = rs.getString("id");
        } catch (SQLException ex) {
            
        }
        res = AddRec.insPoem(conn, title, uId, poem);
        if(res == -1){
            System.out.println("something went wrong in post insertion");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response); 
        }else{
            System.out.println("insertion complete");
            RequestDispatcher view = request.getRequestDispatcher("poems.jsp?pageNum=1");
            view.forward(request, response);
        }
    }
}
