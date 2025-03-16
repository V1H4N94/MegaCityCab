<%-- 
    Document   : userProfile
    Created on : Mar 15, 2025, 2:47:32 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - MegaCity Cabs</title>
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

        /* Checker Pattern */
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

        /* Form Container */
        .form-container {
            max-width: 800px;
            margin: 4rem auto;
            padding: 2rem;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-header h2 {
            color: #2c2c2c;
            font-size: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #2c2c2c;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            background-color: #f8f8f8;
        }

        .form-control:disabled {
            background-color: #e9ecef;
            cursor: not-allowed;
        }

        .form-row {
            display: flex;
            gap: 2rem;
        }

        .form-col {
            flex: 1;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #FFD700;
            color: #2c2c2c;
        }

        .btn-secondary {
            background-color: #2c2c2c;
            color: white;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-primary:hover {
            background-color: #f0c800;
        }

        .btn-secondary:hover {
            background-color: #444;
        }

        /* Loading Spinner */
        .loading-spinner {
            display: none;
            text-align: center;
            padding: 2rem;
        }

        .spinner {
            border: 5px solid #f3f3f3;
            border-top: 5px solid #FFD700;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Alert Messages */
        .alert {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 5px;
            text-align: center;
            display: none;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Back to Home Link */
        .back-link {
            display: block;
            text-align: center;
            margin-bottom: 1rem;
            color: #FFD700;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: white;
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

        <!-- Main Content -->
        <main>
            <a href="index.jsp" class="back-link">← Back to Home</a>
            
            <div class="form-container">
                <div id="loadingSpinner" class="loading-spinner">
                    <div class="spinner"></div>
                    <p>Loading your profile...</p>
                </div>
                
                <div id="alertMessage" class="alert"></div>
                
                <div class="form-header">
                    <h2>User Profile</h2>
                    <p>View and manage your account information</p>
                </div>
                
                <form id="userProfileForm">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" class="form-control" readonly>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" name="email" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="telephone">Telephone</label>
                                <input type="tel" id="telephone" name="telephone" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="userId">User ID</label>
                                <input type="text" id="userId" name="userId" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="userType">User Type</label>
                                <input type="text" id="userType" name="userType" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="identity">Identity Number</label>
                        <input type="text" id="identity" name="identity" class="form-control" readonly>
                    </div>
                    
                    <div class="btn-container">
                        <button type="button" id="logoutBtn" class="btn btn-secondary">Logout</button>
                        <button type="button" id="editProfileBtn" class="btn btn-primary">Edit Profile</button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Show loading spinner
            document.getElementById('loadingSpinner').style.display = 'block';
            
            // Load user data after a small delay to simulate loading
            setTimeout(loadUserData, 800);
            
            // Add event listeners
            document.getElementById('logoutBtn').addEventListener('click', logout);
            document.getElementById('editProfileBtn').addEventListener('click', function() {
                showAlert('This feature is coming soon!', 'alert-success');
            });
        });
        
        function loadUserData() {
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
            
            // Fill the form with user data
            document.getElementById('fullName').value = fullName || 'Not provided';
            document.getElementById('email').value = userEmail || 'Not provided';
            document.getElementById('telephone').value = telephone || 'Not provided';
            document.getElementById('userId').value = userId || 'Not provided';
            document.getElementById('userType').value = userType || 'customer';
            document.getElementById('identity').value = identity || 'Not provided';
            
            // Hide loading spinner
            document.getElementById('loadingSpinner').style.display = 'none';
            
            return true;
        }
        
        function logout() {
            // Show loading spinner
            document.getElementById('loadingSpinner').style.display = 'block';
            
            // Clear all cookies
            document.cookie = "loggedInUser=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            document.cookie = "userType=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            document.cookie = "userId=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            document.cookie = "fullName=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            document.cookie = "telephone=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            document.cookie = "identity=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            
            // Clear session storage
            sessionStorage.removeItem('loggedInUser');
            
            // Show logout message
            showAlert('Successfully logged out. Redirecting to login page...', 'alert-success');
            
            // Redirect to login page after a short delay
            setTimeout(function() {
                window.location.href = 'login.jsp';
            }, 2000);
        }
        
        function showAlert(message, type) {
            const alertElement = document.getElementById('alertMessage');
            alertElement.className = 'alert ' + type;
            alertElement.innerText = message;
            alertElement.style.display = 'block';
            
            // Auto hide after 4 seconds
            setTimeout(function() {
                alertElement.style.display = 'none';
            }, 4000);
        }
    </script>
</body>
</html>
