package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campusplacement.model.Student;

public class StudentDAO {
	public Student getStudentByUserId(int userId) {
		Student student = null;
		String sql = "Select * from students where user_id = ?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				student = new Student();
				student.setStudentId(rs.getInt("student_id"));
				student.setUserId(rs.getInt("user_id"));
				student.setFullName(rs.getString("full_name"));
				student.setBranch(rs.getString("branch"));
				student.setCgpa(rs.getDouble("cgpa"));
				student.setSkills(rs.getString("skills"));
				student.setEmail(rs.getString("email"));
				student.setPhone(rs.getString("phone"));
				student.setResumePath(rs.getString("resume_path"));
				student.setProfileImage(rs.getString("profile_image"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}

	public boolean updateStudentProfile(int studentId, String branch, double cgpa, String skills, String email,
			String phone, String resume, String proPhoto) {

		String sql = "UPDATE students \r\n" + "SET branch = ?, \r\n" + "    cgpa = ?, \r\n" + "    skills = ?, \r\n"
				+ "    email = ?, \r\n" + "    phone = ?, \r\n" + "    resume_path = ?, \r\n"
				+ "    profile_image = ?\r\n" + "WHERE student_id = ?;";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, branch);
			ps.setDouble(2, cgpa);
			ps.setString(3, skills);
			ps.setString(4, email);
			ps.setString(5, phone);
			ps.setString(6, resume);
			ps.setString(7, proPhoto);
			ps.setInt(8, studentId);

			return ps.executeUpdate() > 0;
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getStudentCount() {
		int count = 0;
		String sql = "SELECT COUNT(*) FROM students";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public List<Student> getAllStudents() {

		List<Student> list = new ArrayList<>();

		String sql = "SELECT * FROM students";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {

				Student s = new Student();

				s.setStudentId(rs.getInt("student_id"));
				s.setUserId(rs.getInt("user_id"));
				s.setFullName(rs.getString("full_name"));
				s.setBranch(rs.getString("branch"));
				s.setCgpa(rs.getDouble("cgpa"));
				s.setSkills(rs.getString("skills"));
				s.setEmail(rs.getString("email"));
				s.setPhone(rs.getString("phone"));
				s.setResumePath(rs.getString("resume_path"));
				s.setProfileImage(rs.getString("profile_image"));

				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteStudent(int studentId) {

		String getUserSql = "SELECT user_id FROM students WHERE student_id = ?";
		String deleteStudentSql = "DELETE FROM students WHERE student_id = ?";
		String deleteUserSql = "DELETE FROM users WHERE user_id = ?";

		try (Connection con = DBConnection.getConnection()) {

			// Step 1: Get user_id
			PreparedStatement ps1 = con.prepareStatement(getUserSql);
			ps1.setInt(1, studentId);
			ResultSet rs = ps1.executeQuery();

			int userId = 0;
			if (rs.next()) {
				userId = rs.getInt("user_id");
			}

			// Step 2: Delete student
			PreparedStatement ps2 = con.prepareStatement(deleteStudentSql);
			ps2.setInt(1, studentId);
			ps2.executeUpdate();

			// Step 3: Delete user
			PreparedStatement ps3 = con.prepareStatement(deleteUserSql);
			ps3.setInt(1, userId);
			ps3.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public void registerStudent(int userId, String fullName, String branch, double cgpa, String email, String phone) {

		String sql = "INSERT INTO students(user_id, full_name, branch, cgpa, email, phone) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, userId);
			ps.setString(2, fullName);
			ps.setString(3, branch);
			ps.setDouble(4, cgpa);
			ps.setString(5, email);
			ps.setString(6, phone);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
