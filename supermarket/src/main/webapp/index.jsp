<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="addcss.css">
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
	
	<!-- ------------ -->
	
	
<style>
	#hero {
    display: flex;
    background-color: rgb(188, 224, 203);
    align-items: center;
    justify-content: space-around;
    padding-bottom: 50px;
    padding-left: 100px;
}

.col-2 {
    flex-basis: 50%;
    min-width: 300px;
    padding: 60px 30px;
}

.col-2 h1 {
    font-size: 2.5em;
    line-height: 1.2;
    margin-bottom: 20px;
}

.col-2 p {
    line-height: 1.6;
    margin-bottom: 20px;
}

.col-2 .btn {
    display: inline-block;
    background: #d73030;
    color: #fff;
    padding: 10px 30px;
    border-radius: 30px;
    text-decoration: none;
}

.carousel {
    width: 80%;
    max-width: 800px;
    height: 400px;
    overflow: hidden;
    position: relative;
}

.carousel-track {
    display: flex;
    transition: transform 0.5s ease-in-out;
    height: 100%;
}

.carousel-item {
    width: 100%;
    flex: 0 0 auto;
}

.carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 18px;
}

.carousel-btn {
    cursor: pointer;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 24px;
    background-color: #ddd;
    border: none;
    padding: 1px;
    color: #333;
    outline: none;
}

.prev {
    left: 30px;
}

.next {
    right: 30px;
}
</style>
	
	
	<section id="hero">
    <div class="col-2">
        <h1>Enjoy Your Life With <br> Healthy Products !!</h1>
        <p>At Green Supermarket, we believe the best moments in life unfold when you feel your best.
            That's why we bring you the freshest, most vibrant 
            array of healthy products, chosen with your well-being at heart.</p>
        <a href="#" class="btn">Explore Now &#8594;</a>
    </div>
    <div class="col-2">
        <div class="carousel">
            <div class="carousel-track">
                <div class="carousel-item"><img src="#" alt="Image 1"></div>
               
            </div>
 
        </div>
    </div>
</section>
	
	
	
	<!-- ------------ -->
	
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
