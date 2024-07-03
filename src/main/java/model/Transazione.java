package model;

public class Transazione {
    private int transactionId;
    private int orderId;
    private int userId;
    private String esito;

    // Constructor without transactionId (for new entries)
    public Transazione(int orderId, int userId, String esito) {
        this.orderId = orderId;
        this.userId = userId;
        this.esito = esito;
    }

    // Constructor with transactionId (for existing entries)
    public Transazione(int transactionId, int orderId, int userId, String esito) {
        this.transactionId = transactionId;
        this.orderId = orderId;
        this.userId = userId;
        this.esito = esito;
    }

    // Getters and setters
    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEsito() {
        return esito;
    }

    public void setEsito(String esito) {
        this.esito = esito;
    }
}

