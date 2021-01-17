
package com.web;
import javax.servlet.*;
import java.sql.Connection;
import javax.servlet.http.*;
import java.io.*;
import com.database.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        int res;
        String rating = request.getParameter("rate");
        //String pID = (String)request.getSession().getAttribute("id");
        //String uID = (String) request.getSession().getAttribute("userId");
        String pID = request.getParameter("pID"); // This is for getting the parameter from the form
        String uID = request.getParameter("uID");
        String ret = "poems.jsp?id=" + pID +"&userId=" +uID;
        Connection conn = Conn.getConection();
        String user = (String) request.getSession().getAttribute("username");
        System.out.println("poem "+pID +" rating "+ rating +" user added "+user);
        ResultSet rs = SearchRec.selUserId(conn, user);
        try {
            rs.next();
            uID = rs.getString("id");
        } catch (SQLException ex) {
            
        }
        res = AddRec.insReviw(conn, rating, pID, uID);
        if(res == -1){
            System.out.println("something went wrong in post insertion");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response); 
        }else{
            System.out.println("insertion complete");
            RequestDispatcher view = request.getRequestDispatcher(ret);
            view.forward(request, response);
        }
    }
}
