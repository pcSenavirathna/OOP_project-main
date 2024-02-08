package com.BidingSystem.Pubuth;

public class item {
	//Declare the variable for store the value
	private int id;
	private String Name;
	private String Description;
	private String Type;
	private double startPrice;
	private String eDate;
	private String Condition;
	private double rePrice;
	private String Path;
	private String cusId;
	
	// Constructor method to initialize the item's attributes.
	public item(int id, String Name, String Description, String Type, double startPrice, String eDate, String Condition,
			double rePrice, String Path, String cusId) {
		this.id = id;
		this.Name = Name;
		this.Description = Description;
		this.Type = Type;
		this.startPrice = startPrice;
		this.eDate = eDate;
		this.Condition = Condition;
		this.rePrice = rePrice;
		this.Path = Path;
		this.cusId = cusId;
	}
	
	// Getter methods for retrieving the values of the private fields.
	public int getId() {
		return id;
	}

	public String getName() {
		return Name;
	}

	public String getDescription() {
		return Description;
	}

	public String getType() {
		return Type;
	}

	public double getStartPrice() {
		return startPrice;
	}

	public String geteDate() {
		return eDate;
	}

	public String getCondition() {
		return Condition;
	}

	public double getRePrice() {
		return rePrice;
	}

	public String getPath() {
		return Path;
	}

	public String getCusId() {
		return cusId;
	}
	
	
}
