/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class loginHandler {
    private static final String URL = "jdbc:mysql://localhost:3306/cmu";
    private static final String USER = "root";
    private static final String PASS = "";
    
    public boolean validateUser(String email, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
                String query = "SELECT * FROM admins WHERE username = ? AND pass = ?";
                PreparedStatement pst = conn.prepareStatement(query);
                pst.setString(1, email);
                pst.setString(2, password);
                
                ResultSet rs = pst.executeQuery();
                return rs.next(); // Returns true if user exists
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
