package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApproveUserServlet")
public class ApproveUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();
        dao.updateStatus(userId, "ACTIVE");

        response.sendRedirect("manageRequests.jsp");
    }
}
