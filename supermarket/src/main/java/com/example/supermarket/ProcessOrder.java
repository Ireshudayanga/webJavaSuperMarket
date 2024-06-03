package com.example.supermarket;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.sql.DriverManager;
import java.util.Random;

@WebServlet(name = "processPurchase", value = "/processPurchase")
public class ProcessOrder extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/supermarket";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Iresh542371";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("id");
        String customerName = request.getParameter("name");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");
        System.out.println(productId);

        double price = 0;
        String query = "SELECT price FROM products WHERE id = ?";
        try (Connection conn = java.sql.DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, productId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                price = rs.getDouble("price");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        Random rand = new Random();
        int min = 99999;
        int max = 999999;
        int randomNum = rand.nextInt((max - min) + 1) + min;
         query = "INSERT INTO orders (product_id, customer_name, address, phone_number, payment, order_id, ordered_time, emailaddress) VALUES (?,?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, productId);
            preparedStatement.setString(2, customerName);
            preparedStatement.setString(3, address);
            preparedStatement.setString(4, phoneNumber);
            preparedStatement.setDouble(5, price);
            preparedStatement.setDouble(6, randomNum);
            preparedStatement.setTimestamp(7, new Timestamp(System.currentTimeMillis())); // set the current time
            preparedStatement.setString(8, email);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        String name = customerName.replace(" ", "_");

        Cookie productIdCookie = new Cookie("productId", productId);
        Cookie orderNumber = new Cookie("orderNumber", Integer.toString(randomNum));
        Cookie priceCookie = new Cookie("price", String.valueOf(price));
        Cookie emailAddress = new Cookie("email", String.valueOf(email));
        Cookie clientNameCookie = new Cookie("clientName", name);


        productIdCookie.setMaxAge(1800);
        priceCookie.setMaxAge(1800);
        orderNumber.setMaxAge(1800);
        clientNameCookie.setMaxAge(1800);


        response.addCookie(productIdCookie);
        response.addCookie(priceCookie);
        response.addCookie(orderNumber);
        response.addCookie(emailAddress);
        response.addCookie(clientNameCookie);


        response.sendRedirect("payment.jsp");
    }
}