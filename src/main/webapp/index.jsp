<%-- 
    Document   : index
    Created on : Feb 12, 2025, 8:56:09 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to Megacity</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%);
            min-height: 100vh;
        }

        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        /* Header Banner */
        .header-banner {
            background: #2c2c2c;
            padding: 1rem;
            text-align: center;
        }

        .header-banner h1 {
            color: #FFD700;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .header-banner p {
            color: white;
            font-size: 1.2rem;
        }

        /* Checkerboard Pattern */
        .checker-pattern {
            height: 30px;
            background: repeating-linear-gradient(
                135deg,
                #FFD700,
                #FFD700 20px,
                #2c2c2c 20px,
                #2c2c2c 40px
            );
        }

        /* Navigation */
        .nav-bar {
            background: #2c2c2c;
            padding: 1rem 0;
        }

        .nav-bar ul {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 2rem;
        }

        .nav-bar a {
            color: #FFD700;
            text-decoration: none;
            font-weight: bold;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
        }

        .nav-bar a:hover {
            background: #FFD700;
            color: #2c2c2c;
            border-radius: 5px;
        }

        /* Main Content */
        .content {
            padding: 2rem;
        }

        .hero-section {
            text-align: center;
            margin-bottom: 3rem;
        }

        .hero-section h2 {
            color: #2c2c2c;
            margin-bottom: 1rem;
            font-size: 2rem;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .feature-card {
            background: #f5f5f5;
            padding: 1.5rem;
            border-radius: 5px;
            text-align: center;
            border: 2px solid #FFD700;
        }

        .feature-card h3 {
            color: #2c2c2c;
            margin-bottom: 1rem;
        }

        .cta-section {
            text-align: center;
            padding: 2rem;
            background: #2c2c2c;
            color: white;
        }

        .cta-button {
            display: inline-block;
            padding: 1rem 2rem;
            background: #FFD700;
            color: #2c2c2c;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }

        .cta-button:hover {
            background: white;
            color: #2c2c2c;
            transform: translateY(-2px);
        }

        /* Footer */
        footer {
            background: #2c2c2c;
            color: white;
            text-align: center;
            padding: 1rem;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Header Banner -->
        <header class="header-banner">
            <h1>MegaCity</h1>
            <p>Your trusted ride partner</p>
        </header>

        <!-- Checker Pattern -->
        <div class="checker-pattern"></div>

        <!-- Navigation -->
        <nav class="nav-bar">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#rates">Rates</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="content">
            <section class="hero-section">
                <h2>Welcome to the Home of Premium Cab Service</h2>
                <p>Experience safe, reliable, and comfortable rides across the island.</p>
            </section>

            <section class="features">
                <div class="feature-card">
                    <h3>24/7 Service</h3>
                    <p>Available round the clock for your convenience</p>
                </div>
                <div class="feature-card">
                    <h3>Professional Drivers</h3>
                    <p>Experienced and courteous drivers at your service</p>
                </div>
                <div class="feature-card">
                    <h3>Fixed Rates</h3>
                    <p>Affordable packages with no hidden charges</p>
                </div>
            </section>

            <section class="cta-section">
                <h2>Book your Ride?</h2>
                <p>Reserve your vehicle and experience the best service in town.</p>
                <a href="booking.jsp" class="cta-button">Book Now</a>
            </section>
        </main>

        <!-- Footer -->
        <div class="checker-pattern"></div>
        <footer>
            <p>&copy; 2025 MegaCity. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
