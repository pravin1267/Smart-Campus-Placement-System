package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RejectUserServlet
 */
@WebServlet("/RejectUserServlet")
public class RejectUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();
        dao.updateStatus(userId, "REJECTED");

        response.sendRedirect("manageRequests.jsp");
    }
}