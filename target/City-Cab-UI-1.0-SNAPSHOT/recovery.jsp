<%-- 
    Document   : recovery
    Created on : Feb 12, 2025, 2:02:28 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recover Password</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 0;
            background-color: #1a1a1a;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 50px;
            background: repeating-linear-gradient(
                135deg,
                #FFD700,
                #FFD700 20px,
                #2c2c2c 20px,
                #2c2c2c 40px
            );
            z-index: 1;
        }

        body::after {
            content: '';
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            height: 50px;
            background: repeating-linear-gradient(
                135deg,
                #404040,
                #404040 20px,
                #2c2c2c 20px,
                #2c2c2c 40px
            );
            z-index: 1;
        }

        .forgot-password-container {
            background: white;
            padding: 1.5rem;
            border-radius: 1px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            position: relative;
            overflow: hidden;
            margin: 50px 0;
            z-index: 2;
            animation-name: myAnimation;
            animation-duration: 0.8s;

        }
        
        @keyframes myAnimation{
            from {background-color: #1a1a1a;}
            to {background-color: white;}
        }

        .logo {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #2c2c2c;
        }

        .logo h1 {
            color: #FFD700;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .form-description {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #666;
            font-size: 0.9rem;
            padding: 0 1rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.25rem;
            color: #2c2c2c;
            font-weight: bold;
            font-size: 0.9rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e1e1e1;
            border-radius: 5px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: #FFD700;
            background-color: #FFD700;
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.3);
        }

        .error-message {
            color: #ff3333;
            font-size: 0.75rem;
            margin-top: 0.25rem;
            display: none;
        }

        .recover-btn {
            width: 100%;
            padding: 0.75rem;
            background-color: #2c2c2c;
            color: #FFD700;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
        }

        .recover-btn:hover {
            background-color: #FFD700;
            color: #2c2c2c;
        }

        .login-link {
            text-align: center;
            margin-top: 0.75rem;
            font-size: 0.98rem;
        }

        .login-link a {
            color: #2c2c2c;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #FFD700;
        }

        .company-footer {
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid #5d6d7e;
            text-align: center;
            font-size: 0.8rem;
            color:  #566573;
        }

        .company-footer p {
            margin: 0.25rem 0;
        }

        .company-footer .contact {
            margin-top: 0.5rem;
        }

        .company-footer .contact a {
            color: #2c2c2c;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .company-footer .contact a:hover {
            color: #FFD700;
        }
    </style>
</head>
<body>
    <div class="forgot-password-container">
        <div class="logo">
            <h1>MegaCity</h1>
            <p>Password Recovery</p>
        </div>

        <div class="form-description">
            Enter your email address below and we'll send you instructions to reset your password.
        </div>
        
        <form id="forgotPasswordForm" action="recoverPasswordServlet" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">
                <div class="error-message" id="emailError"></div>
            </div>
            
            <button type="submit" class="recover-btn">Recover Password</button>
            
            <div class="login-link">
                <a href="login.jsp">Back to Login</a>
            </div>
        </form>

        <div class="company-footer">
            <p><strong>MegaCity Cab Service</strong></p>
            <p>Your trusted ride partner since 1996</p>
            <p>123, Some Street, Colombo</p>
            <div class="contact">
                <p>Questions? Contact us:</p>
                <p><a href="tel:+94112345678">+94 11 234 5678</a></p>
                <p><a href="mailto:contact@megacity.com">support@megacity.com</a></p>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            let isValid = true;
            const email = document.getElementById('email').value;
            
            // Reset error message
            document.getElementById('emailError').style.display = 'none';
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!email) {
                showError('emailError', 'Email is required');
                isValid = false;
            } else if (!emailRegex.test(email)) {
                showError('emailError', 'Please enter a valid email address');
                isValid = false;
            }
            
            return isValid;
        }
        
        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        }
        
        // Add input event listener for real-time validation
        document.getElementById('email').addEventListener('input', function() {
            document.getElementById('emailError').style.display = 'none';
        });
    </script>
</body>
</html>
