<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Purchase - GREEN Supermarket</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/buy.css">

</head>
<body class="bg-gray-50">

<nav class="header-bg text-white p-4 flex justify-between items-center shadow-md">
    <a href="/" class="text-2xl font-bold">GREEN Supermarket</a>
    <div>
        <a href="index.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Home</a>
        <a href="index.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Products</a>
        <a href="contact.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Contact</a>
    </div>
</nav>

<%



    // User session check for logged in user's email
    String loggedUserEmail = (String) session.getAttribute("userEmail");
    if(loggedUserEmail == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
        return;
    }

    String productId = request.getParameter("id");
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    String imageURL = "";
    String name = "";
    String price = "";
    String description = "";
    String JDBC_URL = "jdbc:mysql://localhost:3306/supermarket";
    String JDBC_USER = "root";
    String JDBC_PASSWORD = "Iresh542371";


    try {
        connection = connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        statement = connection.createStatement();
        String query = "SELECT image_url, name, price, description FROM products WHERE id = '" + productId + "'";
        rs = statement.executeQuery(query);

        if (rs.next()) {
            imageURL = rs.getString("image_url");
            name = rs.getString("name");
            price = rs.getString("price");
            description = rs.getString("description");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (statement != null) try { statement.close(); } catch (SQLException ignored) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
    }
%>
<div class="container mx-auto mt-10">
    <div class="flex flex-wrap -mx-4">
        <div class="w-full md:w-1/2 px-4 mb-4 md:mb-0">
            <div class="card-custom">
                <img src="<%= imageURL %>" alt="Product Image" class="product-image">
            </div>
        </div>
        <!-- Product Details and Form -->
        <div class="w-full md:w-1/2 px-4">
            <div class="card-custom p-6">
                <h2 class="text-2xl font-semibold mb-4">Product Details</h2>
                <p> Name: <%= name %> </p>
                <p> Price: <%= price %> </p>
                <p> Description: <%= description %> </p>
                <form action="processPurchase" method="post">
                    <input type="hidden" name="id" value="<%= productId %>">

                    <div class="mb-4">
                        <label for="name" class="block text-gray-700 text-sm font-bold mb-2">Name:</label>
                        <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
                    </div>

                    <div class="mb-4">
                        <label for="phone" class="block text-gray-700 text-sm font-bold mb-2">Phone Number:</label>
                        <input type="tel" id="phone" name="phone" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
                    </div>
                    <div class="mb-6">
                        <label for="address" class="block text-gray-700 text-sm font-bold mb-2">Address:</label>
                        <textarea id="address" name="address" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required></textarea>
                    </div>
                    <button type="submit" class="btn-custom w-full py-2 px-4 rounded focus:outline-none focus:shadow-outline">Buy Now</button>
                </form>

            </div>
            <div class="delivery-details mt-4">
                <h3 class="font-bold mb-2">Free Delivery</h3>
                <p class="mb-2">Enjoy free shipping promotion with minimum spend of Rs. 999 from Lanka storage.</p>
                <h3 class="font-bold mb-2">Cash on Delivery Available</h3>
                <p class="mb-2">Service</p>
                <p>7 Days Returns</p>
                <p>6 Months Seller Warranty</p>
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark-green text-white py-8">
    <div class="container mx-auto text-center">
        <h5 class="text-xl font-semibold mb-4">GREEN Supermarket Sri Lanka</h5>
        <p class="mb-4">Your trusted source for quality products in Sri Lanka</p>

        <div class="mb-4">
            <p>Address: No. 456, Main Street, Colombo, Sri Lanka</p>
            <p>Email: contact@greensupermarket.lk | Phone: +94 12 345 6789</p>
        </div>

        <div class="flex justify-center space-x-4">
            <a href="#" class="hover:text-gray-300">
                <i class="fab fa-facebook-f"></i> Facebook
            </a>
            <a href="#" class="hover:text-gray-300">
                <i class="fab fa-twitter"></i> Twitter
            </a>
            <a href="#" class="hover:text-gray-300">
                <i class="fab fa-instagram"></i> Instagram
            </a>
        </div>

        <div class="mt-4">
            <p>&copy; 2023 GREEN Supermarket. All rights reserved.</p>
        </div>
    </div>
</footer>

</body>
</html>
