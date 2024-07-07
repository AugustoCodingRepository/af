package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class Ordine {
	public static int cont=0;
    private int Order_ID; 
    private int User_ID;
    private Date Order_Data;
    private Date Delivery_Data;
    private Double Cost;
    private List<Integer> prodottiAcquistati;

	public Ordine(int orderID, int userID, Date orderDate, Date deliveryDate, Double cost, List<Integer> prodottiAcquistati) {
		this.Order_ID = orderID;
        this.User_ID = userID;
        this.Order_Data = (Date) orderDate;
        this.Delivery_Data = (Date) deliveryDate;
        this.Cost = cost;
        this.setProdottiAcquistati(prodottiAcquistati);
	}
	
	public Ordine( int userID, Date orderDate, Date deliveryDate, Double cost, List<Integer> prodottiAcquistati) {
        this.User_ID = userID;
        this.Order_Data = (Date) orderDate;
        this.Delivery_Data = (Date) deliveryDate;
        this.Cost = cost;
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

	public Double getCost() {
		return Cost;
	}

	public void setCost(Double cost) {
		this.Cost = cost;
	}

	public List<Integer> getProdottiAcquistati() {
		return prodottiAcquistati;
	}

	public void setProdottiAcquistati(List<Integer> prodottiAcquistati) {
		this.prodottiAcquistati = prodottiAcquistati;
	}
    
}