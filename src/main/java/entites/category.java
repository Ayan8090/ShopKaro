package entites;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;



@Entity
public class category {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int catId;
	private String title;
	private String description;
	@OneToMany(mappedBy = "category")
	private List<product> prodcut = new ArrayList<product>();
	
	

	public category(String title, String description, List<product> prodcut) {
		super();
		this.title = title;
		this.description = description;
		this.setProdcut(prodcut);
	}
	public category(int catId, String title, String description) {
		super();
		this.catId = catId;
		this.title = title;
		this.description = description;
	}
	

	
	public category() {
		super();
	}
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<product> getProdcut() {
		return prodcut;
	}
	public void setProdcut(List<product> prodcut) {
		this.prodcut = prodcut;
	}
	
	
}
