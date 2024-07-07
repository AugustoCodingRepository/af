package model;
public class Recensione {
    private int recensioneID;
    private String userName;
    private int valutazione;
    private String descrizione;
    private int userID;
    private int productID;

    // Costruttore senza parametri
    public Recensione() {
    }

    // Costruttore completo
    public Recensione(int recensioneID, String userName, int valutazione, String descrizione, int userID, int productID) {
        this.recensioneID = recensioneID;
        this.userName = userName;
        this.valutazione = valutazione;
        this.descrizione = descrizione;
        this.userID = userID;
        this.productID = productID;
    }

    // Costruttore senza recensioneID (per creare nuove recensioni)
    public Recensione(String userName, int valutazione, String descrizione, int userID, int productID) {
        this.userName = userName;
        this.valutazione = valutazione;
        this.descrizione = descrizione;
        this.userID = userID;
        this.productID = productID;
    }

    // Getter e Setter
    public int getRecensioneID() {
        return recensioneID;
    }

    public void setRecensioneID(int recensioneID) {
        this.recensioneID = recensioneID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getValutazione() {
        return valutazione;
    }

    public void setValutazione(int valutazione) {
        this.valutazione = valutazione;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
}
