package com.register;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;

@WebServlet("/VoterRegister")
@MultipartConfig(maxFileSize = 16177215)
public class VoterRegister extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/evoting";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
String state = request.getParameter("state");
String district = request.getParameter("district");
        String vid = request.getParameter("vid");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String aadhar = request.getParameter("aadhar");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String constituency=request.getParameter("constituency");
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {

            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());


            inputStream = filePart.getInputStream();
        }

        Connection conn = null;
        String message = null;

        try {

           Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO voter (state,district,vid,fname,lname,email,mobile,address,gender,aadhar,username,password,constituency,image,status) values (?,?,?, ?, ?, ?,?,?,?,?,?,?,?,?,'waiting')";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, state);
            statement.setString(2, district);
            statement.setString(3, vid); 
      statement.setString(4, fname);
        statement.setString(5, lname);
          statement.setString(6, email);
            statement.setString(7, mobile);
            statement.setString(8,address);
              statement.setString(9, gender);
                statement.setString(10, aadhar);
             statement.setString(11,username);
            statement.setString(12,password);
statement.setString(13,constituency);
            if (inputStream != null) {
                statement.setBlob(14, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("Voter.jsp?reg= Voter Registration success. Your account will be activated within 2 hrs.");
            } else {
                response.sendRedirect("Register.jsp?reg= Voter Registration Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(VoterRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}