package com.test;

public class History{
	private final String floor;
	private final String intime;
	private final String outtime;
	
	public History(String floor, String intime, String outtime) {
		this.floor = floor;
		this.intime = intime;
		this.outtime = outtime;
	}
	public String getFloor() {
		return floor;
	}
	public String getIntime() {
		return intime;
	}
	public String getOuttime() {
		return outtime;
	}
}
