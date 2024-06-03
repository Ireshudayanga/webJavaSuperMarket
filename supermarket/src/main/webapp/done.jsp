<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thank You - GREEN Supermarket</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <style>
        .bg-dark-green {
            background-color: #276749;
        }
    </style>
</head>
<body class="bg-gray-100">

<header class="bg-dark-green text-white py-6">
    <div class="container mx-auto text-center">
        <h1 class="text-3xl font-bold">GREEN Supermarket</h1>
    </div>
</header>

<div class="container mx-auto mt-10">
    <div class="max-w-md mx-auto bg-white p-6 rounded shadow-md text-center">
        <h1 class="text-2xl font-bold text-dark-green mb-4">Thank You!</h1>
        <p class="mb-4 text-gray-600">We appreciate your purchase. Your transaction has been completed, and a receipt for your purchase has been emailed to you.</p>
        <a href="index.jsp" class="bg-dark-green text-white py-2 px-4 rounded hover:bg-green-700 transition-colors">Back to Home</a>
    </div>
</div>

<footer class="bg-dark-green text-white py-8 mt-12">
    <div class="container mx-auto text-center">
        <h5 class="text-xl font-semibold mb-4">GREEN Supermarket</h5>
        <p>Address: 123 Green Avenue, Colombo, Sri Lanka</p>
        <p>Email: contact@greensupermarket.lk | Phone: +94 12 345 6789</p>
        <div class="flex justify-center space-x-4">
            <a href="#" class="hover:text-gray-300"><i class="fab fa-facebook-f"></i> Facebook</a>
            <a href="#" class="hover:text-gray-300"><i class="fab fa-twitter"></i> Twitter</a>
            <a href="#" class="hover:text-gray-300"><i class="fab fa-instagram"></i> Instagram</a>
        </div>
    </div>
</footer>

</body>
</html>
