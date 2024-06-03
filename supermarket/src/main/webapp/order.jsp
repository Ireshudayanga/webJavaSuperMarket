

<%
    Cookie[] cookies = request.getCookies();
    boolean isAuthenticated = false;

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("user".equals(cookie.getName())) {
                isAuthenticated = true;
                break;
            }
        }
    }

    if (!isAuthenticated) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>



<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Order Management</title>
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
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
        stmt = conn.createStatement();
        String sql = "SELECT * FROM orders where status = 'success'";
        rs = stmt.executeQuery(sql);
%>


<div class="container mt-5">
    <h2>All Orders</h2>
    <form action="updateStatusServlet" method="post">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Product ID</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Payment</th>
                <th>Order ID</th>
                <th>Ordered Time</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("product_id") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getString("phone_number") %></td>
                <td><%= rs.getDouble("payment") %></td>
                <td><%= rs.getInt("order_id") %></td>
                <td><%= rs.getTimestamp("ordered_time") %></td>
                <td>
                    <select name="status_<%= rs.getInt("id") %>" class="form-control">
                        <option <%= "Processing".equals(rs.getString("delivery")) ? "selected" : "" %> value="Processing">Processing</option>
                        <option <%= "Shipped".equals(rs.getString("delivery")) ? "selected" : "" %> value="Shipped">Shipped</option>
                        <option <%= "Delivered".equals(rs.getString("delivery")) ? "selected" : "" %> value="Delivered">Delivered</option>
                    </select>
                </td>
                <td><button type="submit" class="btn btn-primary" name="updateStatus" value="<%= rs.getInt("id") %>">Update Status</button></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </form>
</div>

<%
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>


</body>
</html>
