package entites;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class addCart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int proid;
	private String name;
	@Column(length = 3000)
	private String des;
	private int qunitity;
	private int price;
	private int userId;
	
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public addCart() {
		super();
	}
	public addCart(String name, String des, int qunitity, int price,int userId) {
		super();
		this.name = name;
		this.des = des;
		this.qunitity = qunitity;
		this.price = price;
		this.userId=userId;
	}
	public addCart(int id,int proid, String name, String des, int qunitity, int price,int userId) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.qunitity = qunitity;
		this.price = price;
		this.proid=proid;
		this.userId=userId;
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
	public int getQunitity() {
		return qunitity;
	}
	public void setQunitity(int qunitity) {
		this.qunitity = qunitity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
}
