<%-- 
    Document   : register
    Created on : Feb 12, 2025, 12:23:10 PM
    Author     : User
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register for MegaCity</title>
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

        .registration-container {
            background: white;
            padding: 1.5rem;
            border-radius: 2px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 600px;
            position: relative;
            overflow: hidden;
            margin: 50px 0;
            /*border: 1px solid #FFD700;*/
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
            color: #FFBF00;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .form-row {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .form-group {
            flex: 1;
            margin-bottom: 0.75rem;
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

        .register-btn {
            width: 100%;
            padding: 0.85rem;
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

        .register-btn:hover {
            background-color: #FFD700;
            color: #2c2c2c;
        }

        .login-link {
            text-align: center;
            margin-top: 0.75rem;
            font-size: 1rem;
        }

        .login-link a {
            color: #2c2c2c;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #FFD700;
        }

        @media (max-width: 600px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="logo">
            <h1>MegaCity</h1>
            <p>Create your account</p>
        </div>
        
        <form id="registrationForm" action="registerServlet" method="POST" onsubmit="return validateForm()">
            <div class="form-row">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Enter your full name">
                    <div class="error-message" id="nameError"></div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email">
                    <div class="error-message" id="emailError"></div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Create a password">
                    <div class="error-message" id="passwordError"></div>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="Enter your phone number">
                    <div class="error-message" id="phoneError"></div>
                </div>
            </div>

            <div class="form-group">
                <label for="identity">NIC / Driving License / Passport</label>
                <input type="text" id="hometown" name="identity" placeholder="Confirm your identity">
                <div class="error-message" id="identityError"></div>
            </div>
            
            <button type="submit" class="register-btn">Register</button>
            
            <div class="login-link">
                <a href="login.jsp">Already have an account?</a>
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            let isValid = true;
            const fullName = document.getElementById('fullName').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const hometown = document.getElementById('hometown').value;
            const phone = document.getElementById('phone').value;
            
            // Reset error messages
            document.querySelectorAll('.error-message').forEach(error => {
                error.style.display = 'none';
            });
            
            // Full Name validation
            if (!fullName) {
                showError('nameError', 'Full name is required');
                isValid = false;
            }
            
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
            
            // Hometown validation
            if (!hometown) {
                showError('hometownError', 'Hometown is required');
                isValid = false;
            }
            
            // Phone validation
            const phoneRegex = /^\d{10}$/;
            if (!phone) {
                showError('phoneError', 'Phone number is required');
                isValid = false;
            } else if (!phoneRegex.test(phone)) {
                showError('phoneError', 'Please enter a valid 10-digit phone number');
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
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('input', function() {
                const errorElement = this.parentElement.querySelector('.error-message');
                if (this.value) {
                    errorElement.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>