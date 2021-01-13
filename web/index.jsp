<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HomePage</title>
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
                <div class="content">
                    <img src="pics/1.jpg" alt="Gogou">
                    <img src="pics/2.jpg" alt="Leivaditis">
                    <img src="pics/3.jpg" alt="Kavafis">
                    <img src="pics/4.jpg" alt="Kariwtakis">
                    <img src="pics/5.jpg" alt="Polidouri">
                    <hr>
                    <h2>Αυτη ειναι μια σελιδα στα πλαισια του μαθηματος τεχνολογιες παγκοσμιου ιστου του πανεπιστημιου θεσσαλιας</h2>
                    <br>
                    <h3>Ειναι ευκολη στην χρηση κοιταξτε το sidebar να δειτε πληροφοριες ελπιζω να σας αρεσει</h3>
                    <br><br>
                    <p style="font-style:italic;white-space:pre-line;">
                        "Τι νομίζεις, λοιπόν κατά βάθος η ποίηση
                        είναι μια ανθρώπινη καρδιά
                        φορτωμένη όλο τον κόσμο."
                        <span style="font-family:cursive;font-style:italic;">Νικηφόρος Βρεττάκος</span>
                    </p>
                    <br>
                    <p style="font-style:italic;white-space:pre-line;">
                        "Πίσω από την καθημερινή κόλαση των λέξεων
                        Τα ποιήματα ανασαίνουν ζωντανά και το καθαρό
                        τους νόημα καθρεφτίζει παντού μια φανταστική
                        ευτυχία, που ποτέ δε θα πυρποληθεί."
                        <span style="font-family:cursive;font-style:italic;">Τάκης Σινόπουλος</span>
                    </p>
                    <br><br>
                </div>
            </center>
            <div class="footer">Panep Thess 2020</div>
        </div>
    </body>
</html>

