package com.entity;

public class BookOrder {
	private int id;
	private String orderId;
	private String un;
	private String email;
	private String fullAdd;
	private String phNo;
	private String bookName;
	private String author;
	private String price;
	private String paymentType;

	public BookOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUn() {
		return un;
	}

	public void setUn(String un) {
		this.un = un;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullAdd() {
		return fullAdd;
	}

	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}

	public String getPhNo() {
		return phNo;
	}

	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", orderId=" + orderId + ", un=" + un + ", email=" + email + ", fulladd="
				+ fullAdd + ", phNo=" + phNo + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", paymentType=" + paymentType + "]";
	}
}
