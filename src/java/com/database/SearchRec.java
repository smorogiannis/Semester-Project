package com.database;

import java.sql.*;

public class SearchRec {
    public static int search(Connection conn, String username){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT * FROM users WHERE username='" + username + "';";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            if(rs.next()){//vrike
                result = 1;
            }else{
                result = 0;
            }
            return result;
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    public static ResultSet projectPoems(Connection conn){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT * FROM poems;";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public static ResultSet projectPoemsLimit(Connection conn, int limit){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT * FROM poems LIMIT " +limit+", 7;";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            System.out.println(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public static ResultSet selPoem(Connection conn, String id){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT * FROM poems WHERE id='" +id+"';";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            System.out.println(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public static ResultSet selUserName(Connection conn, String id){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT username FROM users WHERE id='" +id+"';";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            System.out.println(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public static ResultSet selUserId(Connection conn, String name){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT id FROM users WHERE username='" +name+"';";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            System.out.println(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public static ResultSet selComs(Connection conn, String pID){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT comment, userId FROM comments where poemId='"+ pID +"' order by id;";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            System.out.println(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public static ResultSet getAvgRatings(Connection conn, String pID){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT avg(rating) as rate FROM review where poem_id='"+ pID +"';";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            System.out.println(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public static ResultSet checkIfRated(Connection conn, String pID, String username){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String uID;
            ResultSet rs = selUserId(conn, username);
            rs.next();
            uID = rs.getString("id");
            String SEARCH_RECORDS_SQL = "SELECT * FROM review where poem_id='"+ pID +"' AND user_id='"+ uID +"' ;";
            System.out.println(SEARCH_RECORDS_SQL);
            rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            System.out.println(SEARCH_RECORDS_SQL);
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public static int searchLogIn(Connection conn, String username, String password){
        int result;
        try{
            Statement stmt = conn.createStatement();
            String SEARCH_RECORDS_SQL = "SELECT * FROM users WHERE username='" + username + "' AND password='" + password + "';";
            ResultSet rs = stmt.executeQuery(SEARCH_RECORDS_SQL);
            if(rs.next()){//vrike
                result = 1;
            }else{
                result = 0;
            }
            return result;
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
}
