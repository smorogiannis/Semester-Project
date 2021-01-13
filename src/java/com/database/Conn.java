/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sotiris
 */
public class Conn {
    public static Connection getConection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/poems", "root", "5ggHhJAR1H");
            return conn;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("connection failed");
            return null;
        }
    }    
}
