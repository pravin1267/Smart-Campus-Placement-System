package com.campusplacement.dao;

import com.campusplacement.model.User;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
         UserDAO user= new UserDAO();
         
         User use = user.getUserByEmail("pravinkshirsagar784@gmail.com");
         
         if(use != null) System.out.println("true");
         else System.err.println("false");
	}

}
