package com.database;

import java.sql.*;

public class AddRec {
    public static int ins(Connection conn, String username, String pass){
        String INSERT_RECORDS_SQL = ("INSERT INTO users VALUES(DEFAULT, '"  + username +"', '" + pass + "');");
        System.out.println(INSERT_RECORDS_SQL);
        int result;
        try{
            PreparedStatement preparedStatement = conn.prepareStatement(INSERT_RECORDS_SQL);
            result = preparedStatement.executeUpdate();
            return result;
        }catch(SQLException e){
            return -1;
        }
    }
    
    public static int insPoem(Connection conn, String title, String id, String poem){
        String INSERT_RECORDS_SQL = ("INSERT INTO poems VALUES (DEFAULT, '" + title +"', '"+ id +"', '" + poem + "');");
        System.out.println(INSERT_RECORDS_SQL);
        int result;
        try{
            PreparedStatement preparedStatement = conn.prepareStatement(INSERT_RECORDS_SQL);
            result = preparedStatement.executeUpdate();
            return result;
        }catch(SQLException e){
            return -1;
        }
    }
    
    public static int insCom(Connection conn, String comment, String pID, String uID){
        String INSERT_RECORDS_SQL = "INSERT INTO `comments` VALUES (DEFAULT, '"+comment+"', '"+pID+"', '"+uID+"');";
        System.out.println(INSERT_RECORDS_SQL);
        int result;
        try{
            PreparedStatement preparedStatement = conn.prepareStatement(INSERT_RECORDS_SQL);
            result = preparedStatement.executeUpdate();
            return result;
        }catch(SQLException e){
            return -1;
        }
    }
    
    public static int insReviw(Connection conn, String rating, String pID, String uID){
        String INSERT_RECORDS_SQL = "INSERT INTO `review` VALUES ('"+pID+"', '" + rating + "', '" + uID + "');";
        System.out.println(INSERT_RECORDS_SQL);
        int result;
        try{
            PreparedStatement preparedStatement = conn.prepareStatement(INSERT_RECORDS_SQL);
            result = preparedStatement.executeUpdate();
            return result;
        }catch(SQLException e){
            return -1;
        }
    }
}
