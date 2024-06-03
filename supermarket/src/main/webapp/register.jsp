<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <title>GREEN Supermarket</title>

</head>
<body class="bg-gray-50">

<nav class="header-bg text-white p-4 flex justify-between items-center shadow-md">
    <a href="/" class="text-2xl font-bold">GREEN Supermarket</a>
    <div>
        <a href="index.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Home</a>
        <a href="index.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Products</a>
        <a href="register.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Register</a>
        <a href="login.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Login</a>

        <a href="contact.jsp" class="text-white px-3 py-2 rounded-md text-sm font-medium hover:bg-green-700 transition-colors duration-300">Contact</a>
    </div>
</nav>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="container">
    <div class="login-container bg-white px-8 pt-6 pb-8 mb-4 rounded">
        <div class="mb-4">
            <h3 class="login-title text-center text-2xl font-bold mb-6">Register</h3>
            <form action="RegisterPage" method="post" name="login">
                <div class="mb-4">
                    <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email:</label>
                    <input type="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="username" name="email" required>
                </div>
                <div class="mb-6">
                    <label for="password" class="block text-gray-700 text-sm font-bold mb-2">Password:</label>
                    <input type="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="password" name="password" required>
                </div>
                <div class="flex items-center justify-between">
                    <button type="submit" class="btn-login w-full py-2 px-4 rounded focus:outline-none focus:shadow-outline font-bold">Register</button>
                </div>
            </form>
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
