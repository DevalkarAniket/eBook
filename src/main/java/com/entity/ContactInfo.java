package com.entity;

public class ContactInfo {
	private int id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String message;

	public ContactInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ContactInfo(String name, String email, String phone, String address, String message) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "ContactInfo [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", address="
				+ address + ", message=" + message + "]";
	}

}
