package entites;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class product {
    @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(length = 3000)
	private String des;
	private String photo1;
	private String photo2;
	private String photo3;
	private int price;
	private int discout;
	private int quantity;
	@ManyToOne
	private category category;
	
	
	

	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public String getPhoto3() {
		return photo3;
	}
	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	public category getCategory() {
		return category;
	}
	public void setCategory(category category) {
		this.category = category;
	}
	
	
	public product(String name, String des, String photo1,String photo2,String photo3, int price, int discout, int quantity,
			category category) {
		super();
		
		this.name = name;
		this.des = des;
		this.photo1 = photo1;
		this.photo2 = photo2;
		this.photo3 = photo3;
		this.price = price;
		this.discout = discout;
		this.quantity = quantity;
		this.category = category;
	}
	public product(int id, String name, String des, String photo1,String photo2,String photo3, int price,int discout, int quantity,
			category category) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.photo1 = photo1;
		this.photo2 = photo2;
		this.photo3 = photo3;
		this.price = price;
		this.discout = discout;
		this.quantity = quantity;
		this.category = category;
	}
	
	public product() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscout() {
		return discout;
	}
	public void setDiscout(int discout) {
		this.discout = discout;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
