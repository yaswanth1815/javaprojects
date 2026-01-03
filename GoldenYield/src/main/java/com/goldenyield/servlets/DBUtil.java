package com.goldenyield.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        try {
            String url = System.getenv("DB_URL");
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASSWORD");
            if(url==null) {
            	url="jdbc:mysql://localhost:3306/goldenyield";
            	user="root";
            	pass="Blue@1434";
            	
            }
            System.out.println("DB_URL = " + url);
            System.out.println("DB_USER = " + user);
            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

