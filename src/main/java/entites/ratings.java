package entites;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ratings {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
int ratid;	
private String ratings;
private String username;
@Column(length = 3000)
private String comments;
private int productID;




public ratings() {
	super();
}
public ratings(String ratings, String username, String comments,int productID) {
	super();
	this.ratings = ratings;
	this.username = username;
	this.comments = comments;
	this.productID = productID;
}
public ratings(int ratid, String ratings, String username, String comments,int productID) {
	
	super();
	this.ratid = ratid;
	this.ratings = ratings;
	this.username = username;
	this.comments = comments;
	this.productID = productID;
}
public int getRatid() {
	return ratid;
}
public void setRatid(int ratid) {
	this.ratid = ratid;
}
public String getRatings() {
	return ratings;
}
public void setRatings(String ratings) {
	this.ratings = ratings;
}
public String getUser_Name() {
	return username;
}
public void setusername(String username) {
	this.username = username;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public int getProduct() {
	return productID;
}
public void setProduct(int productID) {
	this.productID = productID;
}
	


}
