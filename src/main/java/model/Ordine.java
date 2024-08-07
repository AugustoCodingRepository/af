package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Ordine {
    private int orderID;
    private int userID;
    private Date orderDate;
    private Date deliveryDate;
    private double cost;
    private String productList; // Consideriamo di usare una stringa per l'elenco dei prodotti

    // Costruttore
    public Ordine(int orderID, int userID, Date orderDate, Date deliveryDate, double cost, String productList) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.cost = cost;
        this.productList = productList;
    }
    public Ordine(int userID, Date orderDate, Date deliveryDate, double cost, String productList) {
        this.userID = userID;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.cost = cost;
        this.productList = productList;
    }

    // Metodi getter e setter
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getProductList() {
        return productList;
    }

    public void setProductList(String productList) {
        this.productList = productList;
    }
    
    public static List<Integer> convertStringToArrayList(String s){
        // Creiamo un ArrayList per contenere i numeri
        List<Integer> numbersList = new ArrayList<>();
        
        // Dividiamo la stringa usando il trattino come separatore
        String[] numbers = s.split("-");
        
        // Iteriamo attraverso l'array di stringhe risultante
        for (String number : numbers) {
            // Convertiamo ogni stringa in un intero e la aggiungiamo all'ArrayList
            try {
                numbersList.add(Integer.parseInt(number));
            } catch (NumberFormatException e) {
                // Gestiamo il caso in cui la stringa non sia un numero valido
                System.out.println("Errore: '" + number + "' non è un numero valido.");
            }
        }
        
        return numbersList;
    }
}