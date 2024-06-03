<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.example.supermarket.PaymentService"%>
<%@ page import="com.paypal.base.rest.PayPalRESTException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Proceed to PayPal Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script>
    <style>
        .header-custom {
            background-color: #2e8b57; /* Dark Green header */
        }
        .btn-custom {
            background-color: #276749; /* Dark Green button */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            background-color: #1F4421;
        } .bg-dark-green {
              background-color: #276749;
          }
          .footer{
              margin-top: 100px;
          }
          .box{
              margin-top: 100px;
          }
    </style>
</head>
<body class="bg-gray-100">

<header class="header-custom text-white py-6">
    <div class="container mx-auto text-center">
        <h1 class="text-3xl font-bold">GREEN Supermarket</h1>
    </div>
</header>

<div class="container mx-auto mt-5 box">
    <div class="max-w-md mx-auto bg-white p-6 rounded shadow-md">
        <h1 class="text-xl font-semibold mb-4">Finalize Your Transaction</h1>
        <p class="mb-4">Tap the button below to finish your payment securely with PayPal.</p>
        <%
            Cookie[] cookies = request.getCookies();
            String productId = null;
            String orderNumber = null;
            String price = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("productId".equals(cookie.getName())) {
                        productId = cookie.getValue();
                    } else if ("orderNumber".equals(cookie.getName())) {
                        orderNumber = cookie.getValue();
                    } else if ("price".equals(cookie.getName())) {
                        price = cookie.getValue();
                    }
                }
            };

            System.out.println(orderNumber);

            PaymentService paymentService = new PaymentService();
            String paypalApprovalLink = null;
            try {
                paypalApprovalLink = paymentService.createPayment(10.00);
            } catch (PayPalRESTException e) {
                throw new RuntimeException(e);
            }
        %>
        <a href="<%= paypalApprovalLink %>" class="btn-custom w-full py-2 px-4 rounded focus:outline-none focus:shadow-outline text-center">Proceed to PayPal</a>
    </div>
</div>

<footer class="bg-dark-green text-white py-8 footer">
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
