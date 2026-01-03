<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Golden Yield - Crop Marketplace</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Global Background */
        body {
            background: url('https://t4.ftcdn.net/jpg/01/95/46/95/240_F_195469577_vQPdA2xEBmQuS7T6NCiGiicSCItwLNd6.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        /* Overlay for readability */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        /* Navbar */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(34, 139, 34, 0.9);
            padding: 15px 50px;
            color: white;
        }

        nav .logo {
            font-size: 28px;
            font-weight: bold;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 25px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: 500;
            transition: 0.3s;
        }

        nav ul li a:hover {
            color: #ffeb3b;
        }

        /* Hero Section */
        .hero {
            height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: white;
            text-align: center;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 55px;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.6);
        }

        .hero p {
            font-size: 22px;
            margin-top: 15px;
            max-width: 700px;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.6);
        }

        .hero button {
            margin-top: 25px;
            padding: 12px 30px;
            background-color: #ffd700;
            border: none;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .hero button:hover {
            background-color: #ffeb3b;
        }

        /* Features Section */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            padding: 60px 50px;
            text-align: center;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.85);
            padding: 30px 20px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-card img {
            width: 80px;
            margin-bottom: 15px;
        }

        .feature-card h3 {
            margin-bottom: 10px;
            color: #228B22;
        }

        /* Footer */
        footer {
            background-color: rgba(34, 139, 34, 0.9);
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 30px;
        }

        footer p {
            margin-bottom: 8px;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <div class="logo">Golden Yield</div>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="aboutpage.jsp">About</a></li>
            <li><a href="contactuspage.jsp">Contact</a></li>
            <li><a href="agentregistration.jsp">Apply</a></li>
            <li><a href="loginform.jsp">Login</a></li>
        </ul>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome to Golden Yield</h1>
        <p>From Our Fields to Your Home – Fresh, Fair, and Farmer Direct</p>
        <button>Start Selling</button>
    </div>

    <!-- Features Section -->
<!-- Features Section -->
<section class="features">
    <div class="feature-card">
        <img src="https://cdn-icons-png.flaticon.com/512/1139/1139646.png" alt="Sell Crops">
        <h3>Sell Your Crops</h3>
        <p>Farmers can list their harvest and reach buyers across the region.</p>
    </div>
    <div class="feature-card">
        <img src="https://cdn-icons-png.flaticon.com/512/2331/2331970.png" alt="Buy Crops">
        <h3>Buy Fresh Produce</h3>
        <p>Buyers get farm-fresh crops directly from trusted local farmers.</p>
    </div>
    <div class="feature-card">
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135706.png" alt="Market Updates">
        <h3>Market Updates</h3>
        <p>Stay updated with crop prices, trends, and the best time to sell.</p>
    </div>
</section>


    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Golden Yield. All rights reserved.</p>
        <p>Follow us on Facebook | Instagram | Twitter</p>
    </footer>

</body>
</html>
    