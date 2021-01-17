
package com.web;
import javax.servlet.*;
import java.sql.Connection;
import javax.servlet.http.*;
import java.io.*;
import com.database.*;
import java.sql.ResultSet;
import java.sql.SQLException;
public class CommentServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        int res;
        //String pID = (String)request.getSession().getAttribute("id");
        String pID = request.getParameter("pID"); // This is for getting the parameter from the form
        String uID = request.getParameter("uID");
        //String uID = (String) request.getSession().getAttribute("userId");
        String comment = request.getParameter("comment");
        String ret = "poems.jsp?id=" + pID +"&userId=" +uID;
        Connection conn = Conn.getConection();
        String user = (String) request.getSession().getAttribute("username");
        System.out.println("poem "+pID +" user "+uID +" comm "+comment +" user added "+user);
        ResultSet rs = SearchRec.selUserId(conn, user);
        try {
            rs.next();
            uID = rs.getString("id");
        } catch (SQLException ex) {
            
        }
        res = AddRec.insCom(conn, comment, pID, uID);
        if(res == -1){
            System.out.println("something went wrong in post insertion");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response); 
        }else{
            System.out.println("insertion complete "+ret);
            RequestDispatcher view = request.getRequestDispatcher(ret);
            view.forward(request, response);
        }
        /*request.getSession().setAttribute("numPage", 0);
        request.getSession().setAttribute("rs", null);
        if(res == 1){//vrike idio name
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            RequestDispatcher view = request.getRequestDispatcher("LogInFound.jsp");
            view.forward(request, response); 
        }else{
            RequestDispatcher view = request.getRequestDispatcher("LogInNotFound.jsp");
            view.forward(request, response); 
        }*/
    }
}
