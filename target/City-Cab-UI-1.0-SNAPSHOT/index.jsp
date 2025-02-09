<%-- 
    Document   : index
    Created on : Feb 6, 2025, 8:06:44 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="CSS/loginStyle.css" rel="stylesheet">
    </head>
    <body>
        <div class="center">
            <div class="hcontainer">
                <br>
                <h2>LOGIN</h2>
                <img src="Image/lock1.png" id="lock">
                <br>

            </div>

            <div class="formcontainer">
                <form>
                    <br>
                    <div class="uname">
                        <input type="text" placeholder="Username" style="width: 320px; height: 26px;">

                    </div>
                    <br>

                    <div class="pwd">
                        <input type="password" placeholder="Password" style="width: 320px; height: 26px;">

                    </div>
                    <br>

                    <div class="chkbx">
                        <input type="checkbox">&nbsp;Keep me logged in</br> 

                    </div>
                    <br>

                    <div>
                        <button type="submit" class="btnLog"><img src="Image/Signup.png" class="icoSign">SIGN IN</br>

                    </div>

                </form>
            </div>

            <div class="ftrMargin">
                <span class="opt">Don't have an account? </span><a href="signup.html" class="link">Sign Up</a>

            </div>
            <div>
            <span class="opt">Forgot </span><a href="" class="link">Password?</a>

            </div>

        </div>

    </body>
</html>
