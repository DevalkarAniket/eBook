package com.DOA;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f = false;

		try {
			String query = "INSERT INTO APPUSER(NAME,EMAIL,PHNO,PASSWORD) VALUES(?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, us.getName());
			pstmt.setString(2, us.getEmail());
			pstmt.setString(3, us.getPhno());
			pstmt.setString(4, us.getPassword());

			int i = pstmt.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;

		try {
			String query = "SELECT * FROM APPUSER WHERE EMAIL=? AND PASSWORD=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		boolean f = false;
		try {
			String query = "SELECT * FROM APPUSER WHERE ID=? AND PASSWORD=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, ps);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		boolean f = false;

		try {
			String query = "UPDATE APPUSER SET NAME=?,EMAIL=?,PHNO=? WHERE ID=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, us.getName());
			pstmt.setString(2, us.getEmail());
			pstmt.setString(3, us.getPhno());
			pstmt.setInt(4, us.getId());

			int i = pstmt.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
		}
		return f;
	}

	@Override
	public boolean checkUser(String em) {
		boolean f = true;
		try {
			String query = "SELECT * FROM APPUSER WHERE EMAIL = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, em);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean addAddress(User u) {
		boolean f = false;
		try {
			String query = "UPDATE APPUSER SET ADDRESS=? , LANDMARK=? , CITY=? , STATE=? , PINCODE=? WHERE EMAIL=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u.getAddress());
			pstmt.setString(2, u.getLandmark());
			pstmt.setString(3, u.getCity());
			pstmt.setString(4, u.getState());
			pstmt.setString(5, u.getPincode());
			pstmt.setString(6, u.getEmail());
			int i = pstmt.executeUpdate();
			System.out.println(u.getAddress());
			System.out.println(u.getLandmark());
			System.out.println(u.getCity());
			System.out.println(u.getPincode());
			System.out.println(u.getEmail());
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
