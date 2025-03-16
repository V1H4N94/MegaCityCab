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
        
        <form id="registrationForm" onsubmit="return validateForm()">
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
                <input type="text" id="identity" name="identity" placeholder="Confirm your identity">
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
            const phone = document.getElementById('phone').value;
            const identity = document.getElementById('identity').value;

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

            // Identity validation
            if (!identity) {
                showError('identityError', 'Identity document is required');
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

            if (isValid) {
                // If form is valid, submit via fetch API
                registerUser(fullName, email, password, phone, identity);
                return false; // Prevent the form's default submit action
            }

            return false; // Prevent form submission on validation failure
        }

        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        }

        function registerUser(fullName, email, password, phone, identity) {
            // Create a user object that matches your User class structure
            const user = {
                id: 0, // The ID will likely be assigned by the database
                fullName: fullName,
                pass: password,
                email: email,
                tel: phone,
                identity: identity
            };

            // Show loading state
            const registerBtn = document.querySelector('.register-btn');
            const originalBtnText = registerBtn.textContent;
            registerBtn.textContent = 'Processing...';
            registerBtn.disabled = true;

            // Use the Fetch API to send the data to your service
            fetch('http://localhost:8080/rest_service/api/users', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(user)
            })
            .then(response => {
                // Reset button state
                registerBtn.textContent = originalBtnText;
                registerBtn.disabled = false;

                if (response.status === 201) {
                    // Registration successful
                    showSuccessMessage('Account created successfully! Redirecting to login...');
                    // Redirect to login page after a delay
                    setTimeout(() => {
                        window.location.href = 'login.jsp';
                    }, 2000);
                } else {
                    // Registration failed
                    showErrorMessage('Registration failed. Please try again later.');
                }
            })
            .catch(error => {
                // Reset button state
                registerBtn.textContent = originalBtnText;
                registerBtn.disabled = false;

                console.error('Error:', error);
                showErrorMessage('Connection error. Please check your internet connection and try again.');
            });
        }

        function showSuccessMessage(message) {
            // Create a success message element if it doesn't exist
            let successEl = document.getElementById('successMessage');
            if (!successEl) {
                successEl = document.createElement('div');
                successEl.id = 'successMessage';
                successEl.style.backgroundColor = '#4CAF50';
                successEl.style.color = 'white';
                successEl.style.padding = '10px';
                successEl.style.borderRadius = '5px';
                successEl.style.marginTop = '15px';
                successEl.style.textAlign = 'center';

                const form = document.getElementById('registrationForm');
                form.after(successEl);
            }

            successEl.textContent = message;
            successEl.style.display = 'block';
        }

        function showErrorMessage(message) {
            // Create a global error message element if it doesn't exist
            let errorEl = document.getElementById('globalErrorMessage');
            if (!errorEl) {
                errorEl = document.createElement('div');
                errorEl.id = 'globalErrorMessage';
                errorEl.style.backgroundColor = '#f44336';
                errorEl.style.color = 'white';
                errorEl.style.padding = '10px';
                errorEl.style.borderRadius = '5px';
                errorEl.style.marginTop = '15px';
                errorEl.style.textAlign = 'center';

                const form = document.getElementById('registrationForm');
                form.after(errorEl);
            }

            errorEl.textContent = message;
            errorEl.style.display = 'block';
        }

        // Add input event listeners for real-time validation
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('input').forEach(input => {
                input.addEventListener('input', function() {
                    const errorElement = this.parentElement.querySelector('.error-message');
                    if (errorElement && this.value) {
                        errorElement.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>