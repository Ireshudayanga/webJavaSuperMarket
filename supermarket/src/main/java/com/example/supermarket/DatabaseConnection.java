package com.example.supermarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            // Step 1: Load the JDBC driver (MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Define the JDBC URL for the database connection
            String url = "jdbc:mysql://localhost:3306/supermarket";
            String user = "root";
            String password = "Iresh542371";

            // Step 3: Establish the database connection
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the database successfully!");

            // You can now use 'conn' to communicate with the database

        } catch (ClassNotFoundException e) {
            // Handle error for Class.forName
            e.printStackTrace();
        } catch (SQLException e) {
            // Handle errors for JDBC
            e.printStackTrace();
        } finally {
            // Step 4: Clean up and close the connection
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}