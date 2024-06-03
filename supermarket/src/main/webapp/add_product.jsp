<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - GREEN Supermarket</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/add_product.css">
    <script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script>

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
    String success = request.getParameter("success");
    if (success != null && success.equals("true")) {
%>
<div class="container mx-auto mt-5">
    <div class="alert alert-success" role="alert">
        Product added successfully!
    </div>
</div>
<%
    }
%>

<div class="container mx-auto mt-5">
    <div class="max-w-lg mx-auto p-6 bg-white rounded shadow-md">
        <h2 class="text-2xl font-semibold mb-6">Add Product</h2>
        <form action="addProduct" method="post" enctype="multipart/form-data">
            <div class="form-group mb-4">
                <label for="name" class="block text-gray-700 text-sm font-bold mb-2">Product Name:</label>
                <input type="text" class="form-control shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="name" name="name" required>
            </div>
            <div class="form-group mb-4">
                <label for="description" class="block text-gray-700 text-sm font-bold mb-2">Description:</label>
                <textarea class="form-control shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="description" name="description" rows="3" required></textarea>
            </div>
            <div class="form-group mb-4">
                <label for="quantity" class="block text-gray-700 text-sm font-bold mb-2">Quantity:</label>
                <input type="number" class="form-control shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="quantity" name="quantity" required>
            </div>
            <div class="form-group mb-4">
                <label for="price" class="block text-gray-700 text-sm font-bold mb-2">Price:</label>
                <input type="number" class="form-control shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="price" name="price" step="0.01" required>
            </div>
            <div class="form-group mb-4">
                <label for="image" class="block text-gray-700 text-sm font-bold mb-2">Image:</label>
                <input type="file" class="form-control shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="image" required>
            </div>
            <button type="submit" class="btn-custom w-full py-2 px-4 rounded focus:outline-none focus:shadow-outline">Submit</button>
        </form>
    </div>
</div>

</body>
</html>
