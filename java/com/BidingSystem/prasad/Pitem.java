package com.BidingSystem.prasad;

public class Pitem {
	private int id;
	private String name;
	private String desc;
	private String type;
	private double startBid;
	private String endDate;
	private String condition;
	private double rePrice;
	private String image;
	private int cusid;

	public Pitem(int id, String name, String desc, String type, double startBid, String endDate, String condition,
			double rePrice, String image, int cusid) {
		super();
		this.id = id;
		this.name = name;
		this.desc = desc;
		this.type = type;
		this.startBid = startBid;
		this.endDate = endDate;
		this.condition = condition;
		this.rePrice = rePrice;
		this.image = image;
		this.cusid = cusid;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDesc() {
		return desc;
	}

	public String getType() {
		return type;
	}

	public double getStartBid() {
		return startBid;
	}

	public String getEndDate() {
		return endDate;
	}

	public String getCondition() {
		return condition;
	}

	public double getRePrice() {
		return rePrice;
	}

	public String getImage() {
		return image;
	}


	public int getCusid() {
		return cusid;
	}

	
	
	
	

}
