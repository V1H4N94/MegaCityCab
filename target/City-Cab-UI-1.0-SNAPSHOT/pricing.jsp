<%-- 
    Document   : booking
    Created on : Feb 15, 2025, 10:14:36 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pick your plan</title>
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

        /* Footer */
        footer {
            width: 100%;
            background: #2c2c2c;
            color: white;
            text-align: center;
            padding: 1.5rem;
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
        
        
        @media (max-width: 480px) {
            .footer-content {
                grid-template-columns: 1fr;
            }
        }
        
        
        /* Service Plans Section Styles */
        .service-plans {
            padding: 4rem 8%;
            background-color: rgba(255, 255, 255, 0.8);
        }

        .service-heading {
            text-align: center;
            margin-bottom: 3rem;
        }

        .service-heading h2 {
            font-size: 2.5rem;
            color: #2c2c2c;
            margin-bottom: 0.5rem;
            position: relative;
        }

        .service-heading h2:after {
            content: '';
            display: block;
            width: 80px;
            height: 4px;
            background-color: #FFD700;
            margin: 0.5rem auto;
        }

        .service-heading p {
            color: #666;
            font-size: 1.1rem;
        }

        .plans-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .plan-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .plan-card:hover {
            transform: translateY(-20px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .plan-header {
            padding: 1.5rem;
            background: #2c2c2c;
            color: white;
            text-align: center;
            position: relative;
        }

        .plan-header h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .plan-icon {
            font-size: 2rem;
            margin-top: 0.5rem;
        }

        .plan-details {
            padding: 1.5rem;
        }

        .plan-description {
            color: #666;
            margin-bottom: 1.5rem;
            text-align: center;
            font-style: italic;
        }

        .plan-price {
            text-align: center;
            margin-bottom: 0.5rem;
        }

        .price {
            font-size: 2rem;
            font-weight: bold;
            color: #2c2c2c;
            display: block;
        }

        .price-detail {
            font-size: 0.9rem;
            color: #666;
        }

        .additional-rate {
            text-align: center;
            font-size: 1.1rem;
            font-weight: bold;
            color: #FFD700;
            margin-bottom: 1.5rem;
            background: #f9f9f9;
            padding: 0.5rem;
            border-radius: 4px;
        }

        .plan-features {
            list-style: none;
            margin-bottom: 2rem;
        }

        .plan-features li {
            padding: 0.5rem 0;
            border-bottom: 1px solid #eee;
            position: relative;
            padding-left: 1.5rem;
        }

        .plan-features li:before {
            content: '✓';
            color: #FFD700;
            position: absolute;
            left: 0;
        }

        .book-button {
            display: block;
            background: #2c2c2c;
            color: white;
            text-align: center;
            padding: 0.8rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .book-button:hover {
            background: #FFD700;
            color: #2c2c2c;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .plans-container {
                grid-template-columns: 1fr;
                max-width: 400px;
                margin: 0 auto;
            }
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
            <!-- Service Plans Section -->
                <section class="service-plans">
                    <div class="service-heading">
                        <h2>Service Plans</h2>
                        <p>Choose the perfect plan for your journey</p>
                    </div>

                    <div class="plans-container">
                        <!-- Budget Plan -->
                        <div class="plan-card">
                            <div class="plan-header">
                                <h3>Budget</h3>
                                <div class="plan-icon">🚗</div>
                            </div>
                            <div class="plan-details">
                                <p class="plan-description">Affordable rides for daily commutes</p>
                                <div class="plan-price">
                                    <span class="price">Rs. 15,000</span>
                                    <span class="price-detail">Available for 24 hrs</span>
                                </div>
                                <p class="additional-rate">Day can be extended</p>
                                <ul class="plan-features">
                                    <li>Limited vehicle types</li>
                                    <li>Basic amenities</li>

                                </ul>
                                <a href="booking.jsp" class="book-button">Book Now</a>
                            </div>
                        </div>

                        <!-- Economy Plan -->
                        <div class="plan-card">
                            <div class="plan-header">
                                <h3>Economy</h3>
                                <div class="plan-icon">🚕</div>
                            </div>
                            <div class="plan-details">
                                <p class="plan-description">Comfortable rides at reasonable prices</p>
                                <div class="plan-price">
                                    <span class="price">Rs. 25,000</span>
                                    <span class="price-detail">Available for 24 hrs</span>
                                </div>
                                <p class="additional-rate">Extend for additional day</p>
                                <ul class="plan-features">
                                    <li>Wide range of vehicles</li>
                                    <li>Full-day reserve</li>
                                </ul>
                                <a href="booking.jsp" class="book-button">Book Now</a>
                            </div>
                        </div>

                        <!-- Premium Plan -->
                        <div class="plan-card">
                            <div class="plan-header">
                                <h3>Premium</h3>
                                <div class="plan-icon">🚙</div>
                            </div>
                            <div class="plan-details">
                                <p class="plan-description">Luxurious rides for special occasions</p>
                                <div class="plan-price">
                                    <span class="price">Rs. 40,000</span>
                                    <span class="price-detail">Available for 24 hrs</span>
                                </div>
                                <p class="additional-rate">Extend for additional day</p>
                                <ul class="plan-features">
                                    <li>Luxury sedans</li>
                                    <li>Reserve up to two day</li>
                                </ul>
                                <a href="booking.jsp" class="book-button">Book Now</a>
                            </div>
                        </div>

                        <!-- Premium Pro Plan -->
                        <div class="plan-card">
                            <div class="plan-header">
                                <h3>Premium Pro</h3>
                                <div class="plan-icon">🏎️</div>
                            </div>
                            <div class="plan-details">
                                <p class="plan-description">Ultimate luxury experience for VIPs</p>
                                <div class="plan-price">
                                    <span class="price">Rs. 50,000</span>
                                    <span class="price-detail">Available for 24 hrs</span>
                                </div>
                                <p class="additional-rate">Extend for additional day</p>
                                <ul class="plan-features">
                                    <li>All vehicles available</li>
                                    <li>Up to three day</li>
                                    <li>Wi-Fi enabled</li>
                                </ul>
                                <a href="booking.jsp" class="book-button">Book Now</a>
                            </div>
                        </div>
                    </div>
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