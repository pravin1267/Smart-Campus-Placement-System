package com.campusplacement.controller;

import java.io.IOException;

import com.campusplacement.dao.RecruiterDAO;
import com.campusplacement.dao.StudentDAO;
import com.campusplacement.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        UserDAO userDAO = new UserDAO();
        int userId = userDAO.registerUser(username, password, role);

        if(userId > 0){

            if(role.equals("STUDENT")){
                StudentDAO studentDAO = new StudentDAO();

                studentDAO.registerStudent(
                    userId,
                    request.getParameter("fullName"),
                    request.getParameter("branch"),
                    Double.parseDouble(request.getParameter("cgpa")),
                    request.getParameter("email"),
                    request.getParameter("phone")
                );

            } else {

                RecruiterDAO recruiterDAO = new RecruiterDAO();

                recruiterDAO.registerRecruiter(
                    userId,
                    request.getParameter("companyName"),
                    request.getParameter("hrName"),
                    request.getParameter("email"),
                    request.getParameter("phone")
                );
            }

            response.getWriter().println("Registered successfully! Wait for admin approval.");
        }
    }
}