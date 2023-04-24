package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.ContactInfo;

public class ContactUsDAOImpl implements ContactUsDAO {
	private Connection conn;

	public ContactUsDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addMessage(ContactInfo c) {
		boolean f = false;
		try {
			String query = "INSERT INTO CONTACTUS(NAME,EMAIL,PHONE,ADDRESS,MESSAGE) VALUES (?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getEmail());
			pstmt.setString(3, c.getPhone());
			pstmt.setString(4, c.getAddress());
			pstmt.setString(5, c.getMessage());

			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
