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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCity Cabs</title>
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
            width: 100%;
            background-image: url("IMG/bgimg.jpg");
            background-attachment: fixed;
            background-size: cover;
            /*background: white;*/
            min-height: 100vh;
        }

        /* Navbar styles */
        .navbar {
            background-color: #2c2c2c;
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            position: relative;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .logo {
            color: #FFF;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
            margin-right: -5.5rem;
            transition: opacity 0.3s ease;
        }

        .sublogo {
            color: #FFD700;
            font-size: 0.7rem;
            font-weight: bold;
            top: calc(50% + 1rem);
            text-decoration: none;
            margin-right: 6rem;
            margin-top: 1.8rem;
            transition: opacity 0.3s ease;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 2rem;
            flex-grow: 1;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
            position: relative;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background-color: rgba(255, 215, 0, 0.1);
            transform: translateY(-2px);
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #FFD700;
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .search-container {
            margin-left: auto;
            display: flex;
            align-items: center;
        }

        .search-container input {
            padding: 0.5rem;
            border: none;
            border-radius: 4px;
            width: 200px;
            transition: all 0.3s ease;
            background-color: #ffeb3b;
            color: black;
        }

        .search-container input:focus {
            background-color: white;
            color: black;
            width: 250px;
            outline: none;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
        }

        .dropdown {
            position: relative;
            height: 100%;
        }

        .dropdown > a {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #2c2c2c;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            top: calc(50% + 1rem);
            left: 50%;
            transform: translateX(-50%) translateY(-10px);
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
            z-index: 1000;
        }

        .dropdown-content::before {
            content: '';
            position: absolute;
            top: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-width: 0 10px 10px 10px;
            border-style: solid;
            border-color: transparent transparent #2c2c2c transparent;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s ease;
        }

        .dropdown-content a:hover {
            background-color: rgba(255, 215, 0, 0.1);
        }

        .dropdown:hover .dropdown-content {
            display: block;
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }

        .menu-btn {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        /* Header Banner */
        .header-banner {
            background: #2c2c2c;
            padding: 2rem;
            text-align: center;
            width: 100%;
        }

        .header-banner h1 {
            color: #FFD700;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .header-banner p {
            color: white;
            font-size: 1.2rem;
            margin-top: 0.5rem;
        }

        /* Checkerboard Pattern */
        .checker-pattern {
            width: 100%;
            height: 20px;
            background: repeating-linear-gradient(
                90deg,
                #FFD700,
                #FFD700 20px,
                #2c2c2c 20px,
                #2c2c2c 40px
            );
        }
        
        .checker-pattern2 {
            width: 100%;
            height: 20px;
            background: repeating-linear-gradient(
                90deg,
                #2c2c2c,
                #2c2c2c 20px,
                #FFD700 20px,
                #FFD700 40px
            );
        }
        
        .lenear-pattern {
            width: 100%;
            height: 7px;
            background: repeating-linear-gradient(
                90deg,
                #FFD700,
                #FFD700 20px,
                #FFD700 20px,
                #FFD700 40px
            );
        }

        /* Main Content */
        .content {
            padding: 4rem 8%;
            max-width: 1800px;
            margin: 0 auto;
        }

        .hero-section {
            text-align: center;
            margin-bottom: 5rem;
            padding: 3rem 0;
        }

        .hero-section h2 {
            color: white; /*#2c2c2c;*/
            margin-bottom: 1rem;
            text-shadow: 0 0 16px #000;
            font-size: 2.6rem;
        }

        .hero-section p {
            font-size: 1.3rem;
            color:  #FFD700;
            text-shadow: 0 0 25px #000;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 3rem;
            margin-bottom: 5rem;
            padding: 0 5%;
        }

        .feature-card {
            background: #FFD700;
            padding: 2rem;
            border-radius: 10px;
            text-align: center;
            border: 4px solid #2c2c2c;
            border-style: dashed;
            transition: transform 0.4s ease, box-shadow 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 14px 20px rgba(0,0,0,1.0);
        }

        .feature-card h3 {
            color: black;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .feature-card p {
            color: #2c2c2c;
            line-height: 1.6;
        }

        .cta-section {
            text-align: center;
            padding: 4rem 2rem;
            background: #2c2c2c;
            color: white;
            border: 5px;
            border-style: dashed;
            border-color: #FFD700;
            width: 100%;
            box-shadow: 0 14px 20px rgba(0,0,0,0.7);
            transition: transform 0.4s ease;
            
        }
        
        .cta-section:hover{
            transform: translateY(-17px);
        }

        .cta-section h2 {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .cta-button {
            display: inline-block;
            padding: 1rem 2rem;
            background: #FFD700;
            color: #2c2c2c;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 1.8rem;
            transition: all 0.3s ease;
        }

        .cta-button:hover {
            background: white;
            color: #2c2c2c;
            transform: translateY(-8px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        /* Footer */
        footer {
            width: 100%;
            background: #2c2c2c;
            color: white;
            text-align: center;
            padding: 1.5rem;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .features {
                gap: 2rem;
                padding: 0 2%;
            }
            
            .content {
                padding: 3rem 4%;
            }
        }

        @media (max-width: 768px) {
            .menu-btn {
                display: block;
                margin-left: auto;
            }

            .nav-links {
                display: none;
                width: 100%;
                position: absolute;
                top: 100%;
                left: 0;
                background-color: #2c2c2c;
                flex-direction: column;
                padding: 1rem;
                gap: 1rem;
                transform: translateY(-10px);
                opacity: 0;
                transition: all 0.3s ease;
                z-index: 1000;
            }

            .nav-links.active {
                display: flex;
                transform: translateY(0);
                opacity: 1;
            }

            .search-container {
                margin: 1rem 0;
                width: 100%;
            }

            .search-container input {
                width: 100%;
            }

            .search-container input:focus {
                width: 100%;
            }

            .dropdown-content {
                position: static;
                box-shadow: none;
                margin-top: 0.5rem;
                transform: none;
                left: 0;
            }

            .dropdown-content::before {
                display: none;
            }

            .features {
                grid-template-columns: 1fr;
                padding: 0 5%;
            }

            .hero-section h2 {
                font-size: 2rem;
            }
        }
        
        .articles-section {
            padding: 4rem 8%;
            background: #eaeded;
            border-radius: 5px;
            transition: transform 0.4s ease;
        }
        
        .articles-section:hover{
            transform: translateY(-17px);
        }

        .articles-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2rem;
            margin-top: 2rem;
        }

        .article-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.4s ease;
        }

        .article-card:hover {
            transform: translateY(-15px);
        }

        .article-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .article-content {
            padding: 1.5rem;
        }

        .article-content h3 {
            color: #2c2c2c;
            margin-bottom: 1rem;
        }

        .article-content p {
            color: #666;
            line-height: 1.6;
        }

        .read-more {
            display: inline-block;
            margin-top: 1rem;
            color: #FFD700;
            text-decoration: none;
            font-weight: bold;
        }

        /* Stats Section */
        .stats-section {
            background: #2c2c2c;
            padding: 3rem 8%;
            margin: 3rem 0;
            border-radius: 5px;
            transition: transform 0.4s ease;
        }
        
        .stats-section:hover {
            transform: translateY(-17px);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            text-align: center;
        }

        .stat-item {
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }    

        .stat-number {
            font-size: 2.5rem;
            color: #FFD700;
            margin-bottom: 1px;
        }
        
        .stat-icon {
            width: 80px;
            height: 80px;
            margin-bottom: 1px;
            transition: all 0.3s ease;
        }
        
        .vehicle-icon{
            width: 200px;
            height: 100%;
        }
        
        
        .customer-icon:hover {
            transform: scale(1.2) rotate(5deg);
            filter: drop-shadow(0 0 10px #FFD700);
        }

        .driver-icon:hover {
            animation: drive 1s;
            animation-iteration-count: infinite;
        }
        
        @keyframes drive{
            50% { transform: rotate(30deg); }
            100% { transform: rotate(-30deg); }
        }

        .vehicle-icon:hover {
            transform: scale(1.1) rotate(-5deg);
            filter: drop-shadow(0 0 12px #2196F3);
        }

        .support-icon:hover {
            transform: scale(1.2);
            filter: drop-shadow(0 0 15px #E91E63);
        }

        /* Enhanced Footer Styles */
        .footer-content {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            padding: 3rem 8%;
            text-align: left;
        }

        .footer-section h4 {
            color: #FFD700;
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 0.8rem;
        }

        .footer-section ul li a {
            color: white;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section ul li a:hover {
            color: #FFD700;
        }

        .footer-section.contact-info p {
            color: white;
            margin-bottom: 0.8rem;
            line-height: 1.6;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-links a {
            color: white;
            text-decoration: none;
            font-size: 1.5rem;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: #FFD700;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.1);
            padding-top: 1.5rem;
            margin-top: 2rem;
            text-align: center;
        }

        @media (max-width: 768px) {
            .articles-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .footer-content {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .stat-icon {
                width: 60px;
                height: 60px;
            }
        }

        @media (max-width: 480px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }

            .footer-content {
                grid-template-columns: 1fr;
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

        <!-- Checker Patterns -->
        <div class="lenear-pattern"></div>
        <div class="checker-pattern"></div>
        <div class="checker-pattern2"></div>
        <div class="lenear-pattern"></div>

        <!-- New Navbar -->
        <nav class="navbar">
            <a href="#" class="logo">MEGACITY</a>
            <a href="#" class="sublogo">CAB SERVICE</a>

            <div class="nav-links">
                <a href="index.jsp" class="nav-link">Home</a>
                <a href="booking.jsp" class="nav-link">Book Now</a>
                
                <div class="dropdown">
                    <a href="#" class="nav-link">Rates ▼</a>
                    <div class="dropdown-content">
                        <a href="vehicles.jsp">Vehicles</a>
                        <a href="pricing.jsp">Packages</a>
                        <a href="#">Offers</a>
                    </div>
                </div>

                <a href="support.jsp" class="nav-link">About</a>
                <a href="profile.jsp" class="nav-link">Profile</a>

                <div class="search-container">
                    <input type="text" placeholder="Search...">
                </div>
            </div>

            <button class="menu-btn">☰</button>
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
                    <p>Available round the clock for your convenience. Our dedicated team ensures you're never left stranded.</p>
                </div>
                <div class="feature-card">
                    <h3>Professional Drivers</h3>
                    <p>Experienced and courteous drivers at your service, trained to provide the best travel experience.</p>
                </div>
                <div class="feature-card">
                    <h3>Fixed Rates</h3>
                    <p>Affordable packages with no hidden charges. Transparent pricing for all your journeys.</p>
                </div>
            </section>
            

            <section class="articles-section">
                <h2>Latest Updates</h2>
                <div class="articles-grid">
                    <article class="article-card">
                        <img src="IMG/article1.png" alt="New Fleet Addition" class="article-image">
                        <div class="article-content">
                            <h3>Expanding Our Premium Fleet</h3>
                            <p>We're excited to announce the addition of the wide range of vehicles to our fleet, providing you with more options for your premium travel needs.</p>
                            <a href="#" class="read-more">Read More →</a>
                        </div>
                    </article>
                    <article class="article-card">
                        <img src="IMG/article2.png" alt="Mobile App Launch" class="article-image">
                        <div class="article-content">
                            <h3>New Website Features</h3>
                            <p>Book rides, find your driver, and manage your reservations with our newly updated web application.</p>
                            <a href="#" class="read-more">Read More →</a>
                        </div>
                    </article>
                </div>
            </section>
            
             <!-- Stats Section -->
                <section class="stats-section">
                <div class="stats-grid">
                    <div class="stat-item">
                        <img src="IMG/customer.png" alt="Customers Icon" class="stat-icon customer-icon">
                        <div class="stat-number">50K+</div>
                        <div>Happy Customers</div>
                    </div>
                    <div class="stat-item">
                        <img src="IMG/wheel.png" alt="Drivers Icon" class="stat-icon driver-icon">
                        <div class="stat-number">1000+</div>
                        <div>Professional Drivers</div>
                    </div>
                    <div class="stat-item">
                        <img src="IMG/vehicle.png" alt="Vehicles Icon" class="stat-icon vehicle-icon">
                        <div class="stat-number">500+</div>
                        <div>Vehicles</div>
                    </div>
                    <div class="stat-item">
                        <img src="IMG/callcent.png" alt="Support Icon" class="stat-icon support-icon">
                        <div class="stat-number">24/7</div>
                        <div>Customer Support</div>
                    </div>
                </div>
            </section>

            <section class="cta-section">
                <h2>Ready to Book your Ride?</h2>
                <p>Reserve your vehicle and experience the best service in town.</p>
                <a href="booking.jsp" class="cta-button">Book Now</a>
            </section>
        </main>

        <!-- Footer -->
        <!-- Enhanced Footer -->
            <div class="lenear-pattern"></div>
            <div class="checker-pattern"></div>
            <div class="checker-pattern2"></div>
            <div class="lenear-pattern"></div>
            <footer>
                <div class="footer-content">
                    <div class="footer-section">
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Book a Ride</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Profile</a></li>
                        </ul>
                    </div>
                    <div class="footer-section">
                        <h4>Services</h4>
                        <ul>
                            <li><a href="#">Airport Transfer</a></li>
                            <li><a href="#">Corporate Travel</a></li>
                            <li><a href="#">Wedding Cars</a></li>
                            <li><a href="#">Budget Packages</a></li>
                            <li><a href="#">Special Offers</a></li>
                        </ul>
                    </div>
                    <div class="footer-section">
                        <h4>Legal</h4>
                        <ul>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Cookie Policy</a></li>
                            <li><a href="#">FAQs</a></li>
                            <li><a href="#">Support</a></li>
                        </ul>
                    </div>
                    <div class="footer-section contact-info">
                        <h4>Contact Us</h4>
                        <p>123, Some Street,<br>
                           Some Building,<br>
                           Colombo, 00700</p>
                        <p>Email: contact@megacity.com<br>
                           Phone: +94 11 234 5678</p>
                        <div class="social-links">
                            <a href="#">📱</a>
                            <a href="#">📘</a>
                            <a href="#">📸</a>
                            <a href="#">🐦</a>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2025 MegaCity. All rights reserved.</p>
                </div>
            </footer>
    </div>

    <script>
        const menuBtn = document.querySelector('.menu-btn');
        const navLinks = document.querySelector('.nav-links');

        menuBtn.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    </script>
</body>
</html>