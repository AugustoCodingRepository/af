package model;

public class MetodoDiPagamento {
    private int paymentId;
    private String paymentType;
    private int userId;
    private String paypalEmail;
    private int monthExpiration;
    private int yearExpiration;
    private long cardNumber;
    private int cvv;

    // Constructor without paymentId
    public MetodoDiPagamento(String paymentType, int userId, String paypalEmail, int monthExpiration, int yearExpiration, long cardNumber, int cvv) {
        this.paymentType = paymentType;
        this.userId = userId;
        this.paypalEmail = paypalEmail;
        this.setMonthExpiration(monthExpiration);
        this.cardNumber = cardNumber;
        this.cvv = cvv;
    }

    // Constructor with paymentId
    public MetodoDiPagamento(int paymentId, String paymentType, int userId, String paypalEmail, int monthExpiration, int yearExpiration, long cardNumber, int cvv) {
        this.paymentId = paymentId;
        this.paymentType = paymentType;
        this.userId = userId;
        this.paypalEmail = paypalEmail;
        this.setMonthExpiration(monthExpiration);
        this.setYearExpiration(yearExpiration);
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

	public int getMonthExpiration() {
		return monthExpiration;
	}

	public void setMonthExpiration(int monthExpiration) {
		this.monthExpiration = monthExpiration;
	}

	public int getYearExpiration() {
		return yearExpiration;
	}

	public void setYearExpiration(int yearExpiration) {
		this.yearExpiration = yearExpiration;
	}
}
