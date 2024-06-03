<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account - Order History</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp">GREEN Supermarket</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Order History <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="user_logout.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">

    <%
        // User session check for logged in user's email
        String loggedUserEmail = (String) session.getAttribute("userEmail");
        if(loggedUserEmail == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("login.jsp");
            return;
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "Iresh542371");

            String sql = "SELECT * FROM orders WHERE emailaddress = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, loggedUserEmail);

            resultSet = preparedStatement.executeQuery();
    %>

    <div class="container mt-4">
        <h2>Your Order History</h2>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Status</th>
                <th>Total Amount</th>
                <!-- Add other order fields as necessary -->
            </tr>
            </thead>
            <tbody>
            <%
                while(resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getInt("id") %></td>
                <td><%= resultSet.getString("ordered_time") %></td>
                <td><%= resultSet.getString("delivery_status") %></td>
                <td><%= resultSet.getDouble("payment") %></td>
                <!-- Output other order fields here -->
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <%
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions
        } finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { /* Ignored */ }
            if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { /* Ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* Ignored */ }
        }
    %>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
