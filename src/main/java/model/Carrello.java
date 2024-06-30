package model;

import java.util.Collection;
import java.util.LinkedList;

public class Carrello {
    private Collection<ProdottoCarrello> cart;

    public Carrello() {
        cart = new LinkedList<>();
    }

    public void addProduct(Prodotto p) {
        boolean found = false;
        for (ProdottoCarrello pq : cart) {
            if (pq.getProdotto().equals(p)) {
                pq.incrementQuantity();
                found = true;
                break;
            }
        }
        if (!found) {
            cart.add(new ProdottoCarrello(p, 1));
        }
    }

    public void delProduct(Prodotto p) {
        cart.removeIf(pq -> pq.getProdotto().equals(p));
    }

    public Collection<ProdottoCarrello> getProductsInCart() {
        return cart;
    }
    
    public double getCosto() {
        double totale = 0;
        for (ProdottoCarrello pq : cart) {
            totale += pq.getCosto();
        }
        return totale;
    }
    
    public void delCart() {
        cart.clear();
    }
}