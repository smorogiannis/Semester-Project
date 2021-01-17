<%@page contentType="text/html" pageEncoding="UTF-8"%><!-- Πρεπει να βαλω κατι για οταν δεν ειναι συνδεδεμενος ο χρηστης*/-->
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="el" xml:lang="en">
    <head>
        <title>Poems</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css">
        <link rel="icon" href="pics/1.jpg">
    </head>
    <body style="background-color: black;">
         <div class="page">
            <center>
                <div class="menu">
                    <ul class="men"> 
                        <li class="men">
                            <a href="index.jsp">Home</a>
                        </li> 
                        <%
                            String username = (String)request.getSession().getAttribute("username");
                            if(username != null){
                        %>
                                <li class="men">
                                    <a href="post.jsp">Post</a>
                                </li>
                        <%
                            }
                        %>
                        <li class="men">
                            <a href="<c:url value="poems.jsp"> <c:param name="pageNum" value="1"/> </c:url>">All Poems</a>
                        </li> 
                        <li class="men" style="float: right;">
                            <%
                                if(username != null){
                                    out.print("<p> " + username +" </p>");
                                }else{
                                     %>
                                        <a href="login.html">Log in</a>
                                     <%
                                }
                            %> 
                        </li>
                        <%
                            if(username == null){
                                %>
                                <li class="men" style="float: right;">
                                    <a href="signin.html">Sign in</a>
                                </li>
                                <%
                            }else{
                            %>
                            <li class="men" style="float: right;">
                                <a href="LogOut">Logout</a>
                            </li>
                            <%
                            }
                        %> 
                    </ul>
                </div>
            </center>
            <div class="sidebar">
                <center>
                    Μπορειτε να ανεβασετε το δικο σας ποιημα, να αξιολογησετε ποιηματα και να γραψετε σχολια. Εαν δεν εχετε ακομα γινει μελος της σελιδας μας πατηστε πανω δεξια στο κουμπι sign in και δημιουργησε λογαριασμο 
                </center>
            </div>
             <center>
                 <div class="content" style="overflow: auto;">
                    <img src="pics/1.jpg" alt="Gogou">
                    <img src="pics/2.jpg" alt="Leivaditis">
                    <img src="pics/3.jpg" alt="Kavafis">
                    <img src="pics/4.jpg" alt="Kariwtakis">
                    <img src="pics/5.jpg" alt="Polidouri">
                    <hr>
                    <%
                        int i=0;
                        ResultSet rs, rn=null;
                        String pageNp = "" , pageP = "";
                        Connection conn = Conn.getConection();
                        String pageN = request.getParameter("pageNum");
                        String pID = request.getParameter("id");
                        String uID = request.getParameter("userId");
                        String userN;
                        String rew= "<a href=\"<c:url value=\"/poems.jsp\"> <c:param name=\"pageNum\" value=\"2\"/> </c:url>\">Next Page</a>";
                        if(pageN != null){
                            rs = SearchRec.projectPoemsLimit(conn, ((Integer.valueOf(pageN) - 1) * 7));
                            pageNp = String.valueOf(Integer.valueOf(pageN) + 1);
                            pageP = String.valueOf(Integer.valueOf(pageN) - 1);
                        }else{
                            rs = SearchRec.selPoem(conn, pID);
                            rn = SearchRec.selUserName(conn, uID);
                        }
                        
                     %>
                        <br>
                    <%
                        while(rs.next()){
                            if(pID != null){
                                out.print("<h2>"+rs.getString("Title")+"</h2><br>");
                                out.print("<h4 style=\"width: 30%;white-space:pre-line;\">"+rs.getString("poem")+"</h4><br>");
                                rn.next();
                                out.print("<h2 align='center'> by "+rn.getString("username")+"</h2>");
                                rn = SearchRec.getAvgRatings(conn, pID);
                                rn.next();
                                if(rn.getString("rate") != null){
                                    out.print("<h3 align='center'>"+rn.getInt("rate")+"/5 <span class=\"star rated\"></span></h3><br>"); 
                                }else{
                                    out.print("<h3 align='center'>There are no ratings for this poem be the first to rate <span class=\"star rated\"></span></h3><br>"); 
                                }
                                if(username != null){
                                    rn = SearchRec.checkIfRated(conn, pID, username);
                                    if(rn.next()){
                                        out.print("<h3 align='center'>Your rating to this poem is "+rn.getInt("rating")+"</h3><br>"); 
                                    }else{
                                
                    %>
                                
                                <form method="POST"  action="ReviewServlet">
                                    <div class="stars" data-rating="0">
                                        <span class="star">&nbsp;</span>
                                        <span class="star">&nbsp;</span>
                                        <span class="star">&nbsp;</span>
                                        <span class="star">&nbsp;</span>
                                        <span class="star">&nbsp;</span>
                                        <input id="getRating" type="text" name="rate" value="0" style="display:none;">
                                    </div>
                                    <input type="hidden" name="pID" value="<%=pID%>" /> <!-- this is for giving the poem ID parameter from the form and not from the  request.getSession().setAttribute-->
                                    <input type="hidden" name="uID" value="<%=uID%>" />
                                    <button type="submit">Rate</button>
                                </form>

                                <script>

                                    //initial setup
                                    document.addEventListener('DOMContentLoaded', function(){
                                        let stars = document.querySelectorAll('.star');
                                        stars.forEach(function(star){
                                            star.addEventListener('click', setRating); 
                                        });

                                        let rating = parseInt(document.querySelector('.stars').getAttribute('data-rating'));
                                        let target = stars[rating - 1];
                                        target.dispatchEvent(new MouseEvent('click'));
                                    });

                                    function setRating(ev){
                                        let span = ev.currentTarget;
                                        let stars = document.querySelectorAll('.star');
                                        let match = false;
                                        let num = 0;
                                        stars.forEach(function(star, index){
                                            if(match){
                                                star.classList.remove('rated');
                                            }else{
                                                star.classList.add('rated');
                                            }
                                            //are we currently looking at the span that was clicked
                                            if(star === span){
                                                match = true;
                                                num = index;
                                            }
                                        });
                                        document.querySelector('.stars').setAttribute('data-rating', num);
                                        document.getElementById('getRating').value = num;
                                    }

                                </script>
                    <%              
                                    }
                                }
                                break;
                            }
                            i++;
                     %>
                     <a href="<c:url value="poems.jsp"> <c:param name="id" value='<%= rs.getString("id")%>'/> <c:param name="userId" value='<%= rs.getString("userId")%>'/> </c:url>"><h3>'<%= rs.getString("Title")%>'</h3></a>
                     <br> <br> <br>
                     <%
                            if(i == 7){
                                rs = SearchRec.projectPoemsLimit(conn, ((Integer.valueOf(pageN)) * 7));
                                if(rs.next()){
                                    %>
                                    <ul class="pager">
                                        <li class="next"><a href="<c:url value="poems.jsp"> <c:param name="pageNum" value='<%= pageNp%>'/> </c:url>">Next</a></li>
                                    <!-- <a href="<c:url value="poems.jsp"> <c:param name="pageNum" value='<%= pageNp%>'/> </c:url>">Next Page</a> -->
                                    <%
                                }else{
                                    i = 0;
                                }
                                break;
                            }
                        }
                        if(uID != null){
                            out.print("<br><br><br><br><br><br><h1 align='center'>Comments</h1><br><br><br>");
                            System.out.println("!!!!!!!usid" + request.getParameter("userId"));
                            //request.getSession().setAttribute("id", pID);
                            rs = SearchRec.selComs(conn, pID);
                            while(rs.next()){
                                    rn = SearchRec.selUserName(conn, rs.getString("userId"));
                                    rn.next();
                                    out.print("<h5>"+rn.getString("username")+" said:</h5>");
                                    out.print("<h2 style=\"width: 30%;white-space:pre-line;\">"+rs.getString("comment")+"</h2><br><br><br>");
                            }
                            if(username != null){
                                %>

                                <div class="comment">
                                    <br><br><br><br><br><br>
                                    <form method="POST"  action="CommentServlet" accept-charset="UTF-8"> 
                                       <br><br> 
                                       <h2>Leave a Comment:</h2>
                                       <textarea name="comment" class="post" style="width: 50%; height: 300px"> </textarea>
                                       <br><br>
                                       <input type="hidden" name="pID" value="<%=pID%>" /> <!-- this is for giving the poem ID parameter from the form and not from the  request.getSession().setAttribute-->
                                       <input type="hidden" name="uID" value="<%=uID%>" />
                                       <center>    
                                           <input type="SUBMIT" value="Comment">
                                       </center>
                                   </form>
                                </div>
                                <%
                            }

                        }else if(!pageN.equals("1")){
                            if(i<7){
                                %>
                                <ul class="pager">
                                    <li class="previous"><a href="<c:url value="poems.jsp"> <c:param name="pageNum" value='<%= pageP%>'/> </c:url>">Previous</a></li>
                                </ul>
                                <%
                            }else{
                             %>

                                    <li class="previous"><a href="<c:url value="poems.jsp"> <c:param name="pageNum" value='<%= pageP%>'/> </c:url>">Previous</a></li>
                                </ul>
                                <%  
                            }
                            %>
                           <!-- <a href="<c:url value="poems.jsp"> <c:param name="pageNum" value='<%= pageP%>'/> </c:url>">Prev Page</a> -->
                            <%
                        }
                        
                        /*
                        if(i%4!=0){
                            System.out.println("if211!!!!!!!!!!!!!!!!!");
                            i = 0;
                            request.getSession().setAttribute("numPage", i); 
                        }*/
                        
                    %>
                 </div>
             </center>
         </div>
        <div class="footer">Panep Thess 2020</div>
    </body>
</html>

