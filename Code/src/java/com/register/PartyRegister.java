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

@WebServlet("/PartyRegister")
@MultipartConfig(maxFileSize = 16177215)
public class PartyRegister extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/evoting";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String pid = request.getParameter("pid");
        String pname = request.getParameter("pname");

        String pemail = request.getParameter("pemail");
        String pmobile = request.getParameter("pmobile");
        String paddress = request.getParameter("paddress");
        
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
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

            String sql = "INSERT INTO party (pid,pname,pemail,pmobile,paddress,username,password,image,status) values (?,?,?, ?, ?, ?,?,?,'waiting')";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, pid);
            statement.setString(2, pname);
            statement.setString(3, pemail); 
      statement.setString(4, pmobile);
        statement.setString(5, paddress);
          statement.setString(6, username);
            statement.setString(7, password);
            

            if (inputStream != null) {
                statement.setBlob(8, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("Party.jsp?reg=Party Registration success. Your account will be activated within 2 hrs.");
            } else {
                response.sendRedirect("PartyReg.jsp?reg= Party Registration Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PartyRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}