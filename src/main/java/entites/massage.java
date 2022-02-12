package entites;

public class massage {

	
	private String msg;
	private String type;
	private String css;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCss() {
		return css;
	}
	public void setCss(String css) {
		this.css = css;
	}
	public massage(String msg, String type, String css) {
		super();
		this.msg = msg;
		this.type = type;
		this.css = css;
	}
	
	}
 
