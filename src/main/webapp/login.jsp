<%-- 
    Document   : login
    Created on : Feb 8, 2025, 12:01:35 PM
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login to MegaCity</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            overflow: hidden;
            border: 4px solid #FFD700;
        }

        .logo {
            text-align: center;
            margin-bottom: 2rem;
            color: #2c2c2c;
        }

        .logo h1 {
            color: #FFD700;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
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
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: none;
        }

        .login-btn {
            width: 100%;
            padding: 1rem;
            background-color: #2c2c2c;
            color: #FFD700;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-btn:hover {
            background-color: #FFD700;
            color: #2c2c2c;
            /*background-color: #2c2c2c;
            color: #FFD700;*/
        }

        .forgot-password {
            text-align: center;
            margin-top: 1rem;
        }

        .forgot-password a {
            color: #2c2c2c;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: #FFD700;
        }

        /* Top checkerboard (existing, yellow and black) */
        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 45px;
            background: repeating-linear-gradient(
                135deg,
                #FFD700,
                #FFD700 20px,
                #2c2c2c 20px,
                #2c2c2c 40px
            );
            border-radius: 10px 10px 0 0;
        }

        /* Bottom checkerboard (new, grey and black) */
        .login-container::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 50px;
            background: repeating-linear-gradient(
                135deg,  /* Notice the negative angle for opposite direction */
                #404040,
                #404040 20px,
                #2c2c2c 20px,
                #2c2c2c 40px
            );
            border-radius: 0 0 10px 10px;
        }
        
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <h1>MegaCity</h1>
            <p>Your trusted ride partner</p>
        </div>
        
        <form id="loginForm" action="loginServlet" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="email">Username</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">
                <div class="error-message" id="emailError"></div>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
                <div class="error-message" id="passwordError"></div>
            </div>
            
            <button type="submit" class="login-btn">Login</button>
            
            <div class="forgot-password">
                <a href="forgot-password.jsp">Forgot Password?</a>
            </div>
            <div class="forgot-password">
                <a href="sign-up.jsp">Don't have an account?</a>
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            let isValid = true;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            // Reset error messages
            document.getElementById('emailError').style.display = 'none';
            document.getElementById('passwordError').style.display = 'none';
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!email) {
                showError('emailError', 'Email is required');
                isValid = false;
            } else if (!emailRegex.test(email)) {
                showError('emailError', 'Please enter a valid email address');
                isValid = false;
            }
            
            // Password validation
            if (!password) {
                showError('passwordError', 'Password is required');
                isValid = false;
            } else if (password.length < 6) {
                showError('passwordError', 'Password must be at least 6 characters long');
                isValid = false;
            }
            
            return isValid;
        }
        
        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        }
        
        // Add input event listeners for real-time validation
        document.getElementById('email').addEventListener('input', function() {
            if (this.value) {
                document.getElementById('emailError').style.display = 'none';
            }
        });
        
        document.getElementById('password').addEventListener('input', function() {
            if (this.value) {
                document.getElementById('passwordError').style.display = 'none';
            }
        });
    </script>
</body>
</html>
