<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Error Page</title>
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
                    </ul>
                </div>
            </center>
            <center>
                <div class="content" style="height: 900px">
                    <h1>Something caused an error to the server</h1>
                    <h2>Exception was: ${pageContext.exception}</h2>
                    <h3><a href="index.jsp">Back to homepage</a></h3>
                </div>
            </center>
        </div>
        
    </body>
</html>
