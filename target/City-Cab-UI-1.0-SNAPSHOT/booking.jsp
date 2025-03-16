<%-- 
    Document   : booking
    Created on : Feb 15, 2025, 10:14:36 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get your cab</title>
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
        
        /*.content {
            padding: 0rem 8%;
            max-width: 1800px;
            margin: 0 auto;
        }*/
        
        .articles-section {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 0.1rem 8% 4rem 8%;
            min-height: 70vh;
            display: flex;
            flex-direction: column;
            gap: 2rem;
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
        
        .service-plans {
            padding: 4rem 8% 1px 8%; /* Reduced bottom padding from 4rem to 2rem */
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
            width: 100px;
            height: 4px;
            background-color: #FFD700;
            margin: 0.5rem auto;
        }

        .service-heading p {
            color: #666;
            font-size: 1.1rem;
            margin-bottom: 2px;
        }
        
        .booking-form {
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 480px;
            margin: auto;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c2c2c;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: #FFD700;
            outline: none;
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.3);
        }

        .submit-btn {
            background-color: #FFD700;
            color: #2c2c2c;
            padding: 1rem 2rem;
            border: none;
            border-radius: 4px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }

        .submit-btn:hover {
            background-color: #2c2c2c;
            color: #FFD700;
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
                        <h2>Get Your Ride</h2>
                        <p>Reserve the desiring vehicle to your moment in need</p>
                    </div>
                </section>    
            

            <section class="articles-section">
                <form class="booking-form" action="processBooking.jsp" method="POST">
                    <div class="form-group">
                        <label for="pkgPlans">Available Plans</label>
                        <select id="pkgPlans" name="pkgPlans" class="form-control" required>
                            <option value="">Select a Plan</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="pickupDate">Pick-up Date</label>
                        <input type="date" id="pickupDate" name="pickupDate" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="pickupLocation">Pick-up Location</label>
                        <input type="text" id="pickupLocation" name="pickupLocation" class="form-control" placeholder="Enter pick-up location" required>
                    </div>

                    <div class="form-group">
                        <label for="vehicleType">Vehicle Type</label>
                        <select id="vehicleType" name="vehicleType" class="form-control" required>
                            <option value="">Select a package first</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <div style="display: flex; align-items: flex-start;">
                            <input type="checkbox" id="agreeTerms" name="agreeTerms" required style="margin-top: 5px; margin-right: 10px;">
                            <label for="agreeTerms">I agree to the <a href="#" style="color: #2c2c2c; text-decoration: underline;">Terms and Conditions</a> and <a href="#" style="color: #2c2c2c; text-decoration: underline;">Privacy Policy</a>.</label>
                        </div>
                    </div>

                    <button type="submit" class="submit-btn">Proceed to Payment</button>
                </form>
                
            </section>
            
             <!-- Stats Section -->
                <section class="stats-section">
                
            </section>

            <section class="cta-section">
                
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
        document.addEventListener('DOMContentLoaded', function() {
                // Function to check login and load user data from cookies
                function loadUserDataFromCookies() {
                    // Get the cookie values
                    const cookies = document.cookie.split(';');
                    const userCookie = cookies.find(cookie => cookie.trim().startsWith('loggedInUser='));

                    if (!userCookie) {
                        // No cookie found, redirect to login
                        window.location.href = 'login.jsp';
                        return false;
                    }

                    // Extract user data from cookies
                    const userEmail = decodeURIComponent(userCookie.split('=')[1].trim());

                    // Get user ID
                    const idCookie = cookies.find(cookie => cookie.trim().startsWith('userId='));
                    const userId = idCookie ? idCookie.split('=')[1].trim() : '';

                    // Get full name
                    const nameCookie = cookies.find(cookie => cookie.trim().startsWith('fullName='));
                    const fullName = nameCookie ? decodeURIComponent(nameCookie.split('=')[1].trim()) : '';

                    // Get telephone
                    const telCookie = cookies.find(cookie => cookie.trim().startsWith('telephone='));
                    const telephone = telCookie ? decodeURIComponent(telCookie.split('=')[1].trim()) : '';

                    // Get identity
                    const identityCookie = cookies.find(cookie => cookie.trim().startsWith('identity='));
                    const identity = identityCookie ? decodeURIComponent(identityCookie.split('=')[1].trim()) : '';

                    // Get user type
                    const typeCookie = cookies.find(cookie => cookie.trim().startsWith('userType='));
                    const userType = typeCookie ? typeCookie.split('=')[1].trim() : 'customer';

                    // User is logged in, you can use all the variables
                    console.log(`Logged in as: ${userEmail} (${userType})`);
                    console.log(`User ID: ${userId}, Name: ${fullName}, Tel: ${telephone}, Identity: ${identity}`);

                    // Store user data in a global variable for use in the booking process
                    window.userData = {
                        userId: userId,
                        fullName: fullName || userEmail.split('@')[0],
                        email: userEmail,
                        telephone: telephone, 
                        identity: identity,
                        userType: userType
                    };

                    // Store user data in sessionStorage for profile page
                    if (userEmail && userId) {
                        const userData = {
                            userId: userId,
                            username: fullName || userEmail.split('@')[0],
                            email: userEmail,
                            tel: telephone,
                            phone: telephone,
                            identity: identity,
                            userType: userType || 'customer'
                        };
                        sessionStorage.setItem('loggedInUser', JSON.stringify(userData));
                    }

                    // Show a popup notification
                    showUserNotification(window.userData.fullName);

                    return true;
                }

                // Function to show user notification popup
                function showUserNotification(fullName) {
                    // Create modal elements
                    const modalOverlay = document.createElement('div');
                    modalOverlay.className = 'modal-overlay';
                    modalOverlay.style.position = 'fixed';
                    modalOverlay.style.top = '0';
                    modalOverlay.style.left = '0';
                    modalOverlay.style.width = '100%';
                    modalOverlay.style.height = '100%';
                    modalOverlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
                    modalOverlay.style.display = 'flex';
                    modalOverlay.style.justifyContent = 'center';
                    modalOverlay.style.alignItems = 'center';
                    modalOverlay.style.zIndex = '9999';

                    const modalContent = document.createElement('div');
                    modalContent.className = 'modal-content';
                    modalContent.style.backgroundColor = '#fff';
                    modalContent.style.padding = '2rem';
                    modalContent.style.borderRadius = '8px';
                    modalContent.style.maxWidth = '450px';
                    modalContent.style.textAlign = 'center';
                    modalContent.style.boxShadow = '0 4px 15px rgba(0, 0, 0, 0.2)';
                    modalContent.style.position = 'relative';

                    const closeButton = document.createElement('button');
                    closeButton.innerHTML = '×';
                    closeButton.style.position = 'absolute';
                    closeButton.style.top = '10px';
                    closeButton.style.right = '15px';
                    closeButton.style.border = 'none';
                    closeButton.style.background = 'none';
                    closeButton.style.fontSize = '1.5rem';
                    closeButton.style.cursor = 'pointer';
                    closeButton.style.color = '#2c2c2c';

                    const title = document.createElement('h3');
                    title.textContent = 'IMPORTANT!';
                    title.style.color = '#2c2c2c';
                    title.style.marginBottom = '1rem';
                    title.style.fontSize = '1.5rem';

                    const message = document.createElement('p');
                    message.innerHTML = `You are booking as <strong>` + fullName + `</strong>`;
                    message.style.marginBottom = '1.5rem';
                    message.style.fontSize = '1.1rem';
                    message.style.color = '#666';

                    const continueButton = document.createElement('button');
                    continueButton.textContent = 'Continue';
                    continueButton.style.backgroundColor = '#FFD700';
                    continueButton.style.color = '#2c2c2c';
                    continueButton.style.border = 'none';
                    continueButton.style.padding = '0.75rem 2rem';
                    continueButton.style.borderRadius = '4px';
                    continueButton.style.fontSize = '1rem';
                    continueButton.style.fontWeight = 'bold';
                    continueButton.style.cursor = 'pointer';
                    continueButton.style.transition = 'all 0.3s ease';

                    // Hover effect for continue button
                    continueButton.onmouseover = function() {
                        this.style.backgroundColor = '#2c2c2c';
                        this.style.color = '#FFD700';
                    };
                    continueButton.onmouseout = function() {
                        this.style.backgroundColor = '#FFD700';
                        this.style.color = '#2c2c2c';
                    };

                    // Close the modal on button click
                    closeButton.onclick = function() {
                        document.body.removeChild(modalOverlay);
                    };
                    continueButton.onclick = function() {
                        document.body.removeChild(modalOverlay);
                    };

                    // Assemble the modal
                    modalContent.appendChild(closeButton);
                    modalContent.appendChild(title);
                    modalContent.appendChild(message);
                    modalContent.appendChild(continueButton);
                    modalOverlay.appendChild(modalContent);

                    // Add to body
                    document.body.appendChild(modalOverlay);

                    // Auto close after 5 seconds
                    setTimeout(function() {
                        if (document.body.contains(modalOverlay)) {
                            document.body.removeChild(modalOverlay);
                        }
                    }, 5000);
                }

                // Function to handle logout
                function logout() {
                    // Clear all cookies
                    document.cookie = "loggedInUser=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    document.cookie = "userType=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    document.cookie = "userId=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    document.cookie = "fullName=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    document.cookie = "telephone=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    document.cookie = "identity=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

                    // Redirect to login page
                    window.location.href = 'login.jsp';
                }

                // Add event listener for booking form submission
                const bookingForm = document.querySelector('.booking-form');
                if (bookingForm) {
                    bookingForm.addEventListener('submit', function(event) {
                        // If you want to add user data to the form before submission
                        if (window.userData) {
                            // Add hidden fields with user data
                            const userId = document.createElement('input');
                            userId.type = 'hidden';
                            userId.name = 'userId';
                            userId.value = window.userData.userId;
                            this.appendChild(userId);

                            const userEmail = document.createElement('input');
                            userEmail.type = 'hidden';
                            userEmail.name = 'userEmail';
                            userEmail.value = window.userData.email;
                            this.appendChild(userEmail);

                            // Add more fields as needed
                        }
                    });
                }

                // Load user data when the page loads
                loadUserDataFromCookies();

                // Add event listener for menu button
                const menuBtn = document.querySelector('.menu-btn');
                const navLinks = document.querySelector('.nav-links');

                if (menuBtn) {
                    menuBtn.addEventListener('click', () => {
                        navLinks.classList.toggle('active');
                    });
                }
            });
        
        
        const menuBtn = document.querySelector('.menu-btn');
        const navLinks = document.querySelector('.nav-links');

        menuBtn.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
        
        // avoiding selection of earlier dates 
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date();

            const formattedToday = today.toISOString().split('T')[0];

            const pickupDateInput = document.getElementById('pickupDate');

            pickupDateInput.setAttribute('min', formattedToday);

            pickupDateInput.value = formattedToday;
        });
        
        document.addEventListener('DOMContentLoaded', function() {
            // Fetch packages
            fetch('http://localhost:8080/rest_service/api/packages')
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Failed to fetch packages");
                    }
                    return response.json();
                })
                .then(data => {
                    const dropdown = document.getElementById('pkgPlans');
                    dropdown.innerHTML = '<option value="">Select a Plan</option>'; // Reset options

                    data.forEach(pkg => {
                        const option = document.createElement('option');
                        option.value = pkg.package_id;
                        option.textContent = pkg.package_name;
                        dropdown.appendChild(option);
                    });
                })
                .catch(error => console.error("Error fetching packages:", error));

            // Add event listener for package selection change
            document.getElementById('pkgPlans').addEventListener('change', function() {
                const packageId = this.value;
                const vehicleDropdown = document.getElementById('vehicleType');

                if (packageId === '') {
                    // Reset vehicle dropdown if no package is selected
                    vehicleDropdown.innerHTML = '<option value="">Select a package first</option>';
                    return;
                }

                // First get the package-vehicle relationships
                fetch('http://localhost:8080/rest_service/api/vehicles')
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Failed to fetch package vehicles");
                        }
                        return response.json();
                    })
                    .then(packageVehicles => {
                        // Filter to get only vehicle types for this package
                        const vehicleIdsForPackage = packageVehicles
                            .filter(pv => pv.package_id == packageId)
                            .map(pv => pv.vehicle_type_id);

                        if (vehicleIdsForPackage.length === 0) {
                            vehicleDropdown.innerHTML = '<option value="">No vehicles available for this package</option>';
                            return;
                        }

                        // Now get all vehicle types
                        return fetch('http://localhost:8080/rest_service/api/carcategories')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error("Failed to fetch vehicle types");
                                }
                                return response.json();
                            })
                            .then(allVehicleTypes => {
                                // Filter to only include vehicles for this package
                                const validVehicles = allVehicleTypes.filter(vehicle => 
                                    vehicleIdsForPackage.includes(vehicle.vehicle_type_id)
                                );

                                vehicleDropdown.innerHTML = '<option value="">Select a Vehicle</option>'; // Reset options

                                validVehicles.forEach(vehicle => {
                                    const option = document.createElement('option');
                                    option.value = vehicle.vehicle_type_id;
                                    option.textContent = vehicle.vehicle_cat;
                                    vehicleDropdown.appendChild(option);
                                });
                            });
                    })
                    .catch(error => {
                        console.error("Error fetching vehicle types:", error);
                        vehicleDropdown.innerHTML = '<option value="">Error loading vehicles</option>';
                    });
            });
        });
                document.addEventListener('DOMContentLoaded', function() {
                    const bookingForm = document.querySelector('.booking-form');

                    if (bookingForm) {
                        bookingForm.addEventListener('submit', function(event) {
                            event.preventDefault(); // Prevent default form submission

                            // Get form values
                            const packageSelect = document.getElementById('pkgPlans');
                            const packageId = packageSelect.value;
                            const packageName = packageSelect.options[packageSelect.selectedIndex].text;

                            const pickupDate = document.getElementById('pickupDate').value;
                            const pickupLocation = document.getElementById('pickupLocation').value;

                            const vehicleSelect = document.getElementById('vehicleType');
                            const vehicleId = vehicleSelect.value;
                            const vehicleName = vehicleSelect.options[vehicleSelect.selectedIndex].text;

                            const agreeTerms = document.getElementById('agreeTerms').checked;

                            // Validate form
                            if (!packageId || !pickupDate || !pickupLocation || !vehicleId || !agreeTerms) {
                                alert('Please fill in all fields and agree to the terms and conditions.');
                                return;
                            }

                            // Get user email from session data
                            let userEmail = '';
                            if (window.userData && window.userData.email) {
                                userEmail = window.userData.email;
                            } else {
                                // Try to get from cookies as fallback
                                const cookies = document.cookie.split(';');
                                const userCookie = cookies.find(cookie => cookie.trim().startsWith('loggedInUser='));
                                if (userCookie) {
                                    userEmail = decodeURIComponent(userCookie.split('=')[1].trim());
                                }
                            }

                            if (!userEmail) {
                                alert('User session not found. Please log in again.');
                                window.location.href = 'login.jsp';
                                return;
                            }

                            // Calculate payment based on package
                            let payment = 0;
                            switch (packageName.toLowerCase()) {
                                case 'basic package':
                                    payment = 15000;
                                    break;
                                case 'economy package':
                                    payment = 25000;
                                    break;
                                case 'premium package':
                                    payment = 40000;
                                    break;
                                case 'premium pro package':
                                    payment = 50000;
                                    break;
                                default:
                                    // Default fallback
                                    payment = 15000;
                            }

                            // Create request object
                            const bookingRequest = {
                                email: userEmail,
                                packageType: packageId,
                                date: pickupDate,
                                location: pickupLocation,
                                carType: vehicleId,
                                status: "pending", // This will be the default in your MySQL table
                                payment: payment
                            };

                            // Show loading indicator
                            const submitBtn = document.querySelector('.submit-btn');
                            const originalBtnText = submitBtn.textContent;
                            submitBtn.textContent = 'Processing...';
                            submitBtn.disabled = true;

                            // Send request to API
                            fetch('http://localhost:8080/rest_service/api/bookingRequests', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'Access-Control-Allow-Origin': '*'
                                },
                                body: JSON.stringify(bookingRequest)
                            })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                // Show success message
                                showBookingNotification('Success', 'Your booking request has been submitted successfully!', true);

                                // Reset form after successful submission
                                setTimeout(() => {
                                    window.location.href = 'index.jsp'; // Redirect to home page or another page
                                }, 2000);
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                showBookingNotification('Error', 'Failed to submit booking request. Please try again.', false);
                            })
                            .finally(() => {
                                // Reset button state
                                submitBtn.textContent = originalBtnText;
                                submitBtn.disabled = false;
                            });
                        });
                    }

                    // Function to show booking notification
                    function showBookingNotification(title, message, isSuccess) {
                        // Create modal elements
                        const modalOverlay = document.createElement('div');
                        modalOverlay.className = 'modal-overlay';
                        modalOverlay.style.position = 'fixed';
                        modalOverlay.style.top = '0';
                        modalOverlay.style.left = '0';
                        modalOverlay.style.width = '100%';
                        modalOverlay.style.height = '100%';
                        modalOverlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
                        modalOverlay.style.display = 'flex';
                        modalOverlay.style.justifyContent = 'center';
                        modalOverlay.style.alignItems = 'center';
                        modalOverlay.style.zIndex = '9999';

                        const modalContent = document.createElement('div');
                        modalContent.className = 'modal-content';
                        modalContent.style.backgroundColor = '#fff';
                        modalContent.style.padding = '2rem';
                        modalContent.style.borderRadius = '8px';
                        modalContent.style.maxWidth = '450px';
                        modalContent.style.textAlign = 'center';
                        modalContent.style.boxShadow = '0 4px 15px rgba(0, 0, 0, 0.2)';
                        modalContent.style.position = 'relative';

                        const closeButton = document.createElement('button');
                        closeButton.innerHTML = '×';
                        closeButton.style.position = 'absolute';
                        closeButton.style.top = '10px';
                        closeButton.style.right = '15px';
                        closeButton.style.border = 'none';
                        closeButton.style.background = 'none';
                        closeButton.style.fontSize = '1.5rem';
                        closeButton.style.cursor = 'pointer';
                        closeButton.style.color = '#2c2c2c';

                        const modalTitle = document.createElement('h3');
                        modalTitle.textContent = title;
                        modalTitle.style.color = isSuccess ? '#2c2c2c' : '#d32f2f';
                        modalTitle.style.marginBottom = '1rem';
                        modalTitle.style.fontSize = '1.5rem';

                        const modalMessage = document.createElement('p');
                        modalMessage.textContent = message;
                        modalMessage.style.marginBottom = '1.5rem';
                        modalMessage.style.fontSize = '1.1rem';
                        modalMessage.style.color = '#666';

                        const continueButton = document.createElement('button');
                        continueButton.textContent = 'OK';
                        continueButton.style.backgroundColor = isSuccess ? '#FFD700' : '#d32f2f';
                        continueButton.style.color = isSuccess ? '#2c2c2c' : '#fff';
                        continueButton.style.border = 'none';
                        continueButton.style.padding = '0.75rem 2rem';
                        continueButton.style.borderRadius = '4px';
                        continueButton.style.fontSize = '1rem';
                        continueButton.style.fontWeight = 'bold';
                        continueButton.style.cursor = 'pointer';
                        continueButton.style.transition = 'all 0.3s ease';

                        // Hover effect for continue button
                        continueButton.onmouseover = function() {
                            if (isSuccess) {
                                this.style.backgroundColor = '#2c2c2c';
                                this.style.color = '#FFD700';
                            } else {
                                this.style.backgroundColor = '#b71c1c';
                            }
                        };
                        continueButton.onmouseout = function() {
                            if (isSuccess) {
                                this.style.backgroundColor = '#FFD700';
                                this.style.color = '#2c2c2c';
                            } else {
                                this.style.backgroundColor = '#d32f2f';
                            }
                        };

                        // Close the modal on button click
                        closeButton.onclick = function() {
                            document.body.removeChild(modalOverlay);
                        };
                        continueButton.onclick = function() {
                            document.body.removeChild(modalOverlay);
                        };

                        // Assemble the modal
                        modalContent.appendChild(closeButton);
                        modalContent.appendChild(modalTitle);
                        modalContent.appendChild(modalMessage);
                        modalContent.appendChild(continueButton);
                        modalOverlay.appendChild(modalContent);

                        // Add to body
                        document.body.appendChild(modalOverlay);

                        // Auto close after 5 seconds
                        setTimeout(function() {
                            if (document.body.contains(modalOverlay)) {
                                document.body.removeChild(modalOverlay);
                            }
                        }, 5000);
                    }
        });
    </script>
</body>
</html>