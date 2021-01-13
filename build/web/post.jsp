<%-- 
    Document   : post
    Created on : Dec 2, 2020, 5:39:40 PM
    Author     : Sotiris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Post</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css">
        <link rel="icon" href="pics/1.jpg">
    </head>
    <body>
         <div class="page">
            <center>
                <div class="menu">
                    <ul class="men"> 
                        <li class="men">
                            <a href="index.jsp">Home</a>
                        </li> 
                        <li class="men">
                            <a href="post.jsp">Post</a>
                        </li> 
                        <li class="men">
                            <a href="poems.jsp?pageNum=1">All Poems</a>
                        </li> 
                        <li class="men" style="float: right;">
                            <%
                                String username = (String)request.getSession().getAttribute("username");
                                
                                out.print("<p> " + username +" </p>");
                            %> 
                        </li>
                        <li class="men" style="float: right;">
                            <a href="LogOut">Logout</a>
                        </li>
                    </ul>
                </div>
            </center>
            <div class="sidebar">
                <center>
                    Μπορειτε να ανεβασετε το δικο σας ποιημα, να αξιολογησετε ποιηματα και να γραψετε σχολια. Εαν δεν εχετε ακομα γινει μελος της σελιδας μας πατηστε πανω δεξια στο κουμπι sign in και δημιουργησε λογαριασμο 
                </center>
            </div>
             <center>
                 <div class="content" style="height: 900px;">
                     <br><br><br><br><br><br>
                     <form method="POST"  action="PostServlet" accept-charset="UTF-8"> 
                        Title:
                        <input type="text" name="title" class="post">
                        <br><br> 
                        Poem:
                        <textarea name="poem" class="post" style="width: 69%; height: 500px"> </textarea>
                        <br><br>  
                        <center>    
                            <input type="SUBMIT" value="Post">
                        </center>
                    </form>
                 </div>
             </center>
         </div>
        <div class="footer">Panep Thess 2020</div>
    </body>
</html>
