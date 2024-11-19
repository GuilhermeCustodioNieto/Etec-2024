package cadastroApp.entities;

import java.io.Serializable;
import java.math.BigDecimal;
public class Produto implements Serializable {

	private Long id;
	private String nameProduct;
	private BigDecimal price;
	private String category;
	private String productDescription;
	
	public Produto() {
		super();
	}

	public Produto(String name, BigDecimal price, String category, String description) {
		super();
		this.nameProduct = name;
		this.price = price;
		this.category = category;
		this.productDescription = description;
	}

	public String getName() {
		return nameProduct;
	}

	public void setName(String name) {
		this.nameProduct = name;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}


	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return productDescription;
	}

	public void setDescription(String description) {
		this.productDescription = description;
	}

	@Override
	public String toString() {
		return "Produto\n \\tname: \\t " + nameProduct + ", price: \\t " + price + ", category: \\t " + category
				+ ", description: \\t " + productDescription;
	}
	
	

	
	
}
