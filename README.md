# Semester-Project
Semester-Project for www in university of thessaly
Java Code is into src/java/com/database and src/java/com/web
What needed to be uploaded in server is the files into folder build/web/
The sql database is the file poems.sql. In order to run the webapp succesfully everything on mysql should have utf8 encoding.
You need to create in mysql server a database named poems. In order to import tables into poems schema you need to run the following command.
mysql -u your_username -p poems < /The_Full_Path_That_poems.sql_Is_In/poems.sql. Also go to the /src/java/com/database/Conn.java java file and change the password and the username on line 21 so that they correspond with yours. DriverManager.getConnection("jdbc:mysql://localhost:3306/name_of_the_database", "your_username", "password");.
