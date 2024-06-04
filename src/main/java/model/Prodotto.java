package model;

import java.util.Objects;
import java.util.Arrays;

public class Prodotto {
	private int Product_ID;
	private String Product_Name;
	private String Brand;
	private String Model;
	private int quantity;
	private double price;
	private int IVA;
	private int Categoria_ID;
	private String Descrizione;
	byte[] imgProduct;
	
	public Prodotto(
			int Product_ID,
			String Product_Name,
			String brand,
			String model,
			int quantity,
			double price,
			int iVA,
			int categoria_ID,
			String descrizione,
			byte[] imgProduct
		) {
		this.Product_ID = Product_ID;
		this.Product_Name = Product_Name;
		this.Brand = brand;
		this.Model = model;
		this.quantity = quantity;
		this.price = price;
		this.IVA = iVA;
		this.Categoria_ID = categoria_ID;
		this.Descrizione = descrizione;
		this.imgProduct = imgProduct;
	}
	
	public Prodotto(Prodotto p) {
		this.Product_ID = p.Product_ID;
		this.Product_Name = p.Product_Name;
		this.Brand = p.Brand;
		this.Model = p.Model;
		this.quantity = p.quantity;
		this.price = p.price;
		this.IVA = p.IVA;
		this.Categoria_ID = p.Categoria_ID;
		this.Descrizione = p.Descrizione;
		this.imgProduct = p.imgProduct;
	}

	public byte[] getImgProduct() {
		return imgProduct;
	}

	public void setImgProduct(byte[] imgProduct) {
		this.imgProduct = imgProduct;
	}

	public String getProduct_Name() {
		return Product_Name;
	}

	public void setProduct_Name(String product_Name) {
		Product_Name = product_Name;
	}

	public int getProduct_ID() {
		return Product_ID;
	}

	public void setProduct_ID(int product_ID) {
		Product_ID = product_ID;
	}

	public String getBrand() {
		return Brand;
	}

	public void setBrand(String brand) {
		Brand = brand;
	}

	public String getModel() {
		return Model;
	}

	public void setModel(String model) {
		Model = model;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getIVA() {
		return IVA;
	}

	public void setIVA(int iVA) {
		IVA = iVA;
	}

	public int getCategoria_ID() {
		return Categoria_ID;
	}

	public void setCategoria_ID(int categoria_ID) {
		Categoria_ID = categoria_ID;
	}

	public String getDescrizione() {
		return Descrizione;
	}

	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}
	
	@Override
	public boolean equals(Object obj) {
	    if (this == obj)
	        return true;
	    if (obj == null || getClass() != obj.getClass())
	        return false;
	    Prodotto prodotto = (Prodotto) obj;
	    return Product_ID == prodotto.Product_ID &&
	           Double.compare(prodotto.price, price) == 0 &&
	           IVA == prodotto.IVA &&
	           Categoria_ID == prodotto.Categoria_ID &&
	           quantity == prodotto.quantity &&
	           Objects.equals(Product_Name, prodotto.Product_Name) &&
	           Objects.equals(Brand, prodotto.Brand) &&
	           Objects.equals(Model, prodotto.Model) &&
	           Objects.equals(Descrizione, prodotto.Descrizione) &&
	           Arrays.equals(imgProduct, prodotto.imgProduct);
	}

	@Override
	public int hashCode() {
	    return Objects.hash(Product_ID, Product_Name, Brand, Model, quantity, price, IVA, Categoria_ID, Descrizione, Arrays.hashCode(imgProduct));
	}
	
	@Override
	public String toString() {
	    return "Prodotto{" +
	            "Product_ID=" + Product_ID +
	            ", Product_Name='" + Product_Name + '\'' +
	            ", Brand='" + Brand + '\'' +
	            ", Model='" + Model + '\'' +
	            ", quantity=" + quantity +
	            ", price=" + price +
	            ", IVA=" + IVA +
	            ", Categoria_ID=" + Categoria_ID +
	            ", Descrizione='" + Descrizione + '\'' +
	            '}';
	}
}