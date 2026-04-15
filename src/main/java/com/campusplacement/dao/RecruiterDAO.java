package com.campusplacement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusplacement.model.Job;
import com.campusplacement.model.Recruiter;

public class RecruiterDAO {
	public Recruiter getRecruiterByUserId(int usreId) {
		Recruiter recruiter = null;
		String sql = "Select * from recruiters WHERE user_id = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, usreId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				recruiter = new Recruiter();
				recruiter.setUserId(rs.getInt("user_id"));
				recruiter.setRecruiterId(rs.getInt("recruiter_id"));
				recruiter.setHrName(rs.getString("hr_name"));
				recruiter.setEmail(rs.getString("email"));
				recruiter.setCompanyName(rs.getString("company_name"));
				recruiter.setPhone(rs.getString("phone"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recruiter;
	}
	
	
	
	public int getRecruiterCount() {
		int count = 0;
		String sql = "SELECT COUNT(*) FROM recruiters";

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

	public boolean deleteRecruiter(int recruiterId) {

		String getUserSql = "SELECT user_id FROM recruiters WHERE recruiter_id = ?";
		String deleteRecruiterSql = "DELETE FROM recruiters WHERE recruiter_id = ?";
		String deleteUserSql = "DELETE FROM users WHERE user_id = ?";

		try (Connection con = DBConnection.getConnection()) {

			// Step 1: Get user_id
			PreparedStatement ps1 = con.prepareStatement(getUserSql);
			ps1.setInt(1, recruiterId);
			ResultSet rs = ps1.executeQuery();

			int userId = 0;
			if (rs.next()) {
				userId = rs.getInt("user_id");
			}

			// Step 2: Delete recruiter
			PreparedStatement ps2 = con.prepareStatement(deleteRecruiterSql);
			ps2.setInt(1, recruiterId);
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

	public List<Recruiter> getAllRecruiters() {

		List<Recruiter> list = new ArrayList<>();

		String sql = "SELECT * FROM recruiters";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {

				Recruiter r = new Recruiter();

				r.setRecruiterId(rs.getInt("recruiter_id"));
				r.setUserId(rs.getInt("user_id"));
				r.setCompanyName(rs.getString("company_name"));
				r.setHrName(rs.getString("hr_name"));
				r.setEmail(rs.getString("email"));
				r.setPhone(rs.getString("phone"));

				list.add(r);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void registerRecruiter(int userId, String companyName, String hrName, String email, String phone) {

		String sql = "INSERT INTO recruiters(user_id, company_name, hr_name, email, phone) VALUES (?, ?, ?, ?, ?)";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, userId);
			ps.setString(2, companyName);
			ps.setString(3, hrName);
			ps.setString(4, email);
			ps.setString(5, phone);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
