package model;

public class ProdottoCarrello {
    private Prodotto prodotto;
    private int quantita;

    public ProdottoCarrello(Prodotto prodotto, int quantita) {
        this.prodotto = prodotto;
        this.quantita = quantita;
    }

    public Prodotto getProdotto() {
        return prodotto;
    }

    public int getQuantita() {
        return quantita;
    }

    public void incrementQuantity() {
        quantita++;
    }
}