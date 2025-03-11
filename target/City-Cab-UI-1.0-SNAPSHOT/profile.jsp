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
    <title>User Profile - MegaCity</title>
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

        /* Profile Card Styles */
        .content {
            padding: 2rem 5%;
        }

        .profile-container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            margin: 2rem auto;
            max-width: 1200px;
        }

        .profile-card {
            background: white;
            border-radius: 5px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            width: 100%;
            padding: 2rem;
            position: relative;
        }

        .profile-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 10px;
            background: #FFD700;
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #2c2c2c;
            margin-right: 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: #FFD700;
        }

        .profile-info {
            flex: 1;
        }

        .profile-info h2 {
            color: #2c2c2c;
            margin-bottom: 0.5rem;
        }

        .profile-info p {
            color: #666;
            margin-bottom: 0.25rem;
        }

        .profile-sections {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
        }

        .profile-section {
            background: #f9f9f9;
            border-radius: 5px;
            padding: 1.5rem;
        }

        .profile-section h3 {
            color: #2c2c2c;
            margin-bottom: 1rem;
            border-bottom: 2px solid #FFD700;
            padding-bottom: 0.5rem;
        }

        .profile-field {
            margin-bottom: 1.5rem;
        }

        .profile-field label {
            display: block;
            font-weight: bold;
            margin-bottom: 0.5rem;
            color: #555;
        }

        .profile-field input {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e1e1e1;
            border-radius: 5px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .profile-field input:focus {
            outline: none;
            border-color: #FFD700;
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.3);
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            justify-content: flex-end;
        }

        .action-button {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .primary-button {
            background-color: #2c2c2c;
            color: #FFD700;
        }

        .primary-button:hover {
            background-color: #FFD700;
            color: #2c2c2c;
        }

        .secondary-button {
            background-color: #e1e1e1;
            color: #2c2c2c;
        }

        .secondary-button:hover {
            background-color: #d1d1d1;
        }

        .logout-button {
            background-color: #ff3333;
            color: white;
        }

        .logout-button:hover {
            background-color: #e62e2e;
        }

        .ride-history {
            width: 100%;
            margin-top: 2rem;
        }

        .ride-history table {
            width: 100%;
            border-collapse: collapse;
        }

        .ride-history th {
            text-align: left;
            padding: 1rem;
            background-color: #2c2c2c;
            color: #FFD700;
        }

        .ride-history td {
            padding: 1rem;
            border-bottom: 1px solid #e1e1e1;
        }

        .ride-history tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Footer */
        footer {
            width: 100%;
            background: #2c2c2c;
            color: white;
            text-align: center;
            padding: 1.5rem;
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

        /* Responsive styles */
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

            .profile-sections {
                grid-template-columns: 1fr;
            }

            .footer-content {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 480px) {
            .profile-header {
                flex-direction: column;
                text-align: center;
            }

            .profile-avatar {
                margin-right: 0;
                margin-bottom: 1rem;
            }

            .action-buttons {
                flex-direction: column;
            }

            .footer-content {
                grid-template-columns: 1fr;
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

        <!-- Navbar -->
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
            <div class="profile-container">
                <div class="profile-card">
                    <div id="profileContent">
                        <!-- Content will be loaded here by JavaScript -->
                        <div class="loading">Loading user profile...</div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <div class="lenear-pattern"></div>
        <div class="checker-pattern"></div>
        <div class="checker-pattern2"></div>
        <div class="lenear-pattern"></div>
        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="booking.jsp">Book a Ride</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="support.jsp">About Us</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
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
        document.addEventListener('DOMContentLoaded', async function () {
                const loggedInUserJSON = sessionStorage.getItem('loggedInUser');

                if (!loggedInUserJSON) {
                    console.error("User is not logged in. Redirecting to login page.");
                    window.location.href = 'login.jsp';
                    return;
                }

                const loggedInUser = JSON.parse(loggedInUserJSON);
                console.log("User session data:", loggedInUser);

                // Load profile ONLY for customers
                if (loggedInUser.userType === 'customer') {
                    try {
                        await loadUserProfile(loggedInUser);
                    } catch (error) {
                        console.error("Error loading user profile:", error);
                        document.getElementById('profileContent').innerHTML = `
                            <div class="error">
                                <h3>Error Loading Profile</h3>
                                <p>There was an error loading your profile information. Please try again later.</p>
                                <button class="action-button secondary-button" onclick="location.reload()">Retry</button>
                            </div>
                        `;
                    }
                } else {
                    // Admins do not need to load from API, just show their stored session data
                    displayAdminProfile(loggedInUser);
                }
            });

            async function loadUserProfile(userData) {
                console.log("Fetching user data from API...");

                let userDetails = userData;

                try {
                    const response = await fetch(`http://localhost:8080/rest_service/api/users/${userData.userId}`);

                    if (!response.ok) {
                        throw new Error(`HTTP error! Status: ${response.status}`);
                    }

                    const apiUserData = await response.json();
                    userDetails = { ...userData, ...apiUserData };
                    console.log("User details from API:", userDetails);
                } catch (error) {
                    console.warn("Failed to fetch user details from API. Using sessionStorage data.", error);
                }

                displayCustomerProfile(userDetails);
            }

            function displayCustomerProfile(userDetails) {
                document.getElementById('profileContent').innerHTML = `
                    <div class="profile-header">
                        <div class="profile-avatar">${userDetails.username.charAt(0).toUpperCase()}</div>
                        <div class="profile-info">
                            <h2>${userDetails.username}</h2>
                            <p>${userDetails.email}</p>
                            <p>Customer</p>
                        </div>
                    </div>

                    <div class="profile-sections">
                        <div class="profile-section">
                            <h3>Personal Information</h3>
                            <form id="profileForm">
                                <div class="profile-field">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" id="fullName" value="${userDetails.username}">
                                </div>
                                <div class="profile-field">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" value="${userDetails.email}" readonly>
                                </div>
                                <div class="profile-field">
                                    <label for="phone">Phone Number</label>
                                    <input type="tel" id="phone" value="${userDetails.tel || userDetails.phone || ''}">
                                </div>
                                <div class="profile-field">
                                    <label for="identity">Identity/NIC</label>
                                    <input type="text" id="identity" value="${userDetails.identity || ''}">
                                </div>
                                <div class="action-buttons">
                                    <button type="button" class="action-button secondary-button" id="changePasswordBtn">Change Password</button>
                                    <button type="button" class="action-button primary-button" id="saveProfileBtn">Save Changes</button>
                                </div>
                            </form>
                        </div>
                        <div class="profile-section">
                            <h3>Account Settings</h3>
                            <div class="profile-field">
                                <label>User ID</label>
                                <input type="text" value="${userDetails.userId}" readonly>
                            </div>
                            <div class="profile-field">
                                <label>Account Status</label>
                                <input type="text" value="Active" readonly>
                            </div>
                            <div class="action-buttons">
                                <button type="button" class="action-button logout-button" id="logoutBtn">Logout</button>
                            </div>
                        </div>
                    </div>
                `;

                document.getElementById('logoutBtn').addEventListener('click', logout);
                document.getElementById('saveProfileBtn').addEventListener('click', saveProfile);
                document.getElementById('changePasswordBtn').addEventListener('click', showChangePasswordDialog);
            }

            // Function for Admin Profile (No API Fetch)
            function displayAdminProfile(adminData) {
                document.getElementById('profileContent').innerHTML = `
                    <div class="profile-header">
                        <div class="profile-avatar">${adminData.username.charAt(0).toUpperCase()}</div>
                        <div class="profile-info">
                            <h2>${adminData.username}</h2>
                            <p>${adminData.email}</p>
                            <p>Administrator</p>
                        </div>
                    </div>
                    <div class="profile-sections">
                        <div class="profile-section">
                            <h3>Admin Details</h3>
                            <div class="profile-field">
                                <label>Admin Name</label>
                                <input type="text" value="${adminData.username}" readonly>
                            </div>
                            <div class="profile-field">
                                <label>Email</label>
                                <input type="text" value="${adminData.email}" readonly>
                            </div>
                            <div class="action-buttons">
                                <button type="button" class="action-button logout-button" id="logoutBtn">Logout</button>
                            </div>
                        </div>
                    </div>
                `;

                document.getElementById('logoutBtn').addEventListener('click', logout);
            }

            // Save profile changes (Only for Customers)
            async function saveProfile() {
                const loggedInUserJSON = sessionStorage.getItem('loggedInUser');
                if (!loggedInUserJSON) return;

                const userData = JSON.parse(loggedInUserJSON);
                if (userData.userType !== 'customer') return;

                const fullName = document.getElementById('fullName').value;
                const phone = document.getElementById('phone').value;
                const identity = document.getElementById('identity').value;

                try {
                    userData.username = fullName;
                    userData.phone = phone;
                    userData.identity = identity;

                    sessionStorage.setItem('loggedInUser', JSON.stringify(userData));

                    const updatedUser = {
                        id: userData.userId,
                        name: fullName,
                        email: userData.email,
                        pass: "", // Password update should be handled separately
                        tel: phone,
                        identity: identity
                    };

                    const response = await fetch('http://localhost:8080/rest_service/api/users', {
                        method: 'PUT',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify(updatedUser)
                    });

                    if (response.ok) {
                        alert('Profile updated successfully!');
                    } else {
                        throw new Error('Failed to update profile');
                    }
                } catch (error) {
                    console.error("Error saving profile:", error);
                    alert('There was an error updating your profile. Please try again.');
                }
            }

            // Logout function
            function logout() {
                sessionStorage.removeItem('loggedInUser');
                document.cookie = "loggedIn=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";
                window.location.href = 'login.jsp';
            }

            // Change password function placeholder
            function showChangePasswordDialog() {
                alert('Change password functionality would be implemented here');
            }
    </script>    
</body>
</html>