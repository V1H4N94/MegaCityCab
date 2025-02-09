/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package serverlets;

/**
 *
 * @author User
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.loginHandler;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet{
    protected void dopost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        loginHandler login = new loginHandler();
        
        if(login.validateUser(email, pass)){
            
            HttpSession session = request.getSession();
            session.setAttribute("user",email);
            
            response.sendRedirect("index.jsp");
            
        }else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
