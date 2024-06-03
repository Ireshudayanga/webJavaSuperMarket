<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Message Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/order.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body class="bg-gray-100">

<header class="header-custom shadow-sm py-4">
    <nav class="container mx-auto flex justify-between items-center">
        <a class="text-white text-xl font-bold" href="#">Supermarket</a>
        <div>
            <a class="text-white px-3 py-2 rounded-md text-sm hover:bg-green-700 transition-colors" href="add_product.jsp">Add Product</a>
            <a class="text-white px-3 py-2 rounded-md text-sm hover:bg-green-700 transition-colors" href="order.jsp">Orders</a>
            <a class="text-white px-3 py-2 rounded-md text-sm hover:bg-green-700 transition-colors" href="view_message.jsp">View Messages</a>

            <a class="text-white px-3 py-2 rounded-md text-sm hover:bg-green-700 transition-colors" href="logout.jsp">Logout</a>
        </div>
    </nav>
</header>

<%


    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String JDBC_URL = "jdbc:mysql://localhost:3306/supermarket";
        String JDBC_USER = "root";
        String JDBC_PASS = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

        String sql = "SELECT * FROM contact_messages ORDER BY submitted_at DESC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>

<div class="container mt-5">
    <h2 class="text-xl font-bold mb-4">Customer Messages</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Submitted At</th>
            </tr>
            </thead>
            <tbody>
            <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getTimestamp("submitted_at") %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<%
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch(SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
