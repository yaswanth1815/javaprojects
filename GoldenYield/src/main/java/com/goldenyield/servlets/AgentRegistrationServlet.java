package com.goldenyield.servlets;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/agentregistrationservlet")
public class AgentRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String query1 = "SELECT * FROM addagent WHERE agentsecretid=? AND secretkey=?";
        String query2 = "INSERT INTO agentregistration VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        String agentName = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String adhaar = req.getParameter("adhaar");
        String dob = req.getParameter("dob");
        String state = req.getParameter("state");
        String district = req.getParameter("district");
        String mandal = req.getParameter("mandal");
        String village = req.getParameter("village");
        String secretid = req.getParameter("secretid");
        String secretKey = req.getParameter("secretkey");
        String account = req.getParameter("account");
        String ifscCode = req.getParameter("ifsc");
        String password = req.getParameter("password");

        try(Connection conn=DBUtil.getConnection()) {
            long mobileNumber = Long.parseLong(mobile);
            long adhaarNumber = Long.parseLong(adhaar);
            long bankAccountNumber = Long.parseLong(account);
            long secretId = Long.parseLong(secretid);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateOfBirth = sdf.parse(dob);
            java.sql.Date sqlDate = new java.sql.Date(dateOfBirth.getTime());

            PreparedStatement pstmt1 = conn.prepareStatement(query1);
            pstmt1.setLong(1, secretId);
            pstmt1.setString(2, secretKey);

            ResultSet result = pstmt1.executeQuery();
            if (result.next()==true) {
                PreparedStatement pstmt2 = conn.prepareStatement(query2);
                pstmt2.setString(1, agentName);
                pstmt2.setLong(2, mobileNumber);
                pstmt2.setLong(3, adhaarNumber);
                pstmt2.setDate(4, sqlDate);
                pstmt2.setString(5, state);
                pstmt2.setString(6, district);
                pstmt2.setString(7, mandal);
                pstmt2.setString(8, village);
                pstmt2.setLong(9, secretId);
                pstmt2.setLong(10, bankAccountNumber);
                pstmt2.setString(11, ifscCode);
                pstmt2.setString(12, password);

                int num = pstmt2.executeUpdate();
                if (num > 0) {
                    req.setAttribute("message", "Registration Successful");
                    req.getRequestDispatcher("loginform.jsp").forward(req, resp);
                } else {
                    req.setAttribute("message", "Registration Unsuccessful");
                    req.getRequestDispatcher("sellerregistration.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("message", "You are Not Allowed to Register");
                req.getRequestDispatcher("sellerregistration.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}