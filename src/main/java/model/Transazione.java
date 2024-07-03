package model;

import java.util.Date;

public class Transazione {
    private int paymentId;
    private String paymentType;
    private int userId;
    private String paypalEmail;
    private Date cardExpiration;
    private long cardNumber;
    private int cvv;

    // Constructor without paymentId
    public Transazione(String paymentType, int userId, String paypalEmail, Date cardExpiration, long cardNumber, int cvv) {
        this.paymentType = paymentType;
        this.userId = userId;
        this.paypalEmail = paypalEmail;
        this.cardExpiration = cardExpiration;
        this.cardNumber = cardNumber;
        this.cvv = cvv;
    }

    // Constructor with paymentId
    public Transazione(int paymentId, String paymentType, int userId, String paypalEmail, Date cardExpiration, long cardNumber, int cvv) {
        this.paymentId = paymentId;
        this.paymentType = paymentType;
        this.userId = userId;
        this.paypalEmail = paypalEmail;
        this.cardExpiration = cardExpiration;
        this.cardNumber = cardNumber;
        this.cvv = cvv;
    }

    // Getters and setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPaypalEmail() {
        return paypalEmail;
    }

    public void setPaypalEmail(String paypalEmail) {
        this.paypalEmail = paypalEmail;
    }

    public Date getCardExpiration() {
        return cardExpiration;
    }

    public void setCardExpiration(Date cardExpiration) {
        this.cardExpiration = cardExpiration;
    }

    public long getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(long cardNumber) {
        this.cardNumber = cardNumber;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }
}
