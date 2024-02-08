package com.BidingSystem.Pathum;

public class Customer {
	static int idd ;
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String password;
	
	public Customer(int id, String firstName, String lastName, String password, String email, String phone ) {
		super();
		Customer.idd = id;
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}

	public static int getIdd() {
		return idd;
	}

	public int getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getPassword() {
		return password;
	}

	
	
}
