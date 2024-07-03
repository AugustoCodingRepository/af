package model;

import java.sql.Date;
import java.util.ArrayList;

public class Ordine {
	public static int cont=0;
    private int Order_ID; 
    private int User_ID;
    private Date Order_Data;
    private Date Delivery_Data;
    private double Cost;
    private ArrayList<String> prodottiAcquistati;

    public Ordine(int User_ID, Date Order_Data, Date Delivery_Data, double cost) {
        this.Order_ID = cont++;
        this.User_ID = User_ID;
        this.Order_Data = Order_Data;
        this.Delivery_Data = Delivery_Data;
        this.Cost = cost;
        
    }

	public Ordine(int orderID, int userID, java.util.Date orderDate, java.util.Date deliveryDate, double cost2, ArrayList<String> prodottiAcquistati) {
		this.Order_ID = orderID;
        this.User_ID = userID;
        this.Order_Data = (Date) orderDate;
        this.Delivery_Data = (Date) deliveryDate;
        this.Cost = cost2;
        this.setProdottiAcquistati(prodottiAcquistati);
	}

	public int getOrder_ID() {
        return Order_ID;
    }

    public void setOrder_ID(int Order_ID) {
        this.Order_ID = Order_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int User_ID) {
        this.User_ID = User_ID;
    }

    public Date getOrder_Data() {
        return Order_Data;
    }

    public void setOrder_Data(Date Order_Data) {
        this.Order_Data = Order_Data;
    }

    public Date getDelivery_Data() {
        return Delivery_Data;
    }

    public void setDelivery_Data(Date Delivery_Data) {
        this.Delivery_Data = Delivery_Data;
    }

	public double getCost() {
		return Cost;
	}

	public void setCost(double cost) {
		this.Cost = cost;
	}

	public ArrayList<String> getProdottiAcquistati() {
		return prodottiAcquistati;
	}

	public void setProdottiAcquistati(ArrayList<String> prodottiAcquistati) {
		this.prodottiAcquistati = prodottiAcquistati;
	}
    
    
}