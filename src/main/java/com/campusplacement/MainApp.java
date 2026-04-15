package com.campusplacement;

import java.util.Scanner;

import com.campusplacement.dao.UserDAO;
import com.campusplacement.model.User;

public class MainApp {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter username: ");
        String username = sc.nextLine();

        System.out.print("Enter password: ");
        String password = sc.nextLine();

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(username, password);

        if (user != null) {
            System.out.println("Login Successful!");
            System.out.println("Welcome " + user.getUsername());
            System.out.println("Role: " + user.getRole());
        } else {
            System.out.println("Invalid username or password.");
        }

        sc.close();
    }
}

