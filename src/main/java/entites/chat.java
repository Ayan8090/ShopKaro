package entites;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class chat {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	private String chat;

    
    
    
	public chat(int id, String chat, java.sql.Timestamp timestamp) {
		super();
		this.id = id;
		this.chat = chat;
		
	}
	public chat(String chat, Date date) {
		super();
		this.chat = chat;
	
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}
	
	

}
