package model;

import java.sql.Date;

public class Ordine {
    private int Order_ID;
    private int User_ID;
    private Date Order_Data;
    private Date Delivery_Data;

    public Ordine() {
    }

    public Ordine(int Order_ID, int User_ID, Date Order_Data, Date Delivery_Data) {
        this.Order_ID = Order_ID;
        this.User_ID = User_ID;
        this.Order_Data = Order_Data;
        this.Delivery_Data = Delivery_Data;
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
}