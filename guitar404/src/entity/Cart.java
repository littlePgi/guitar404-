package entity;

public class Cart {
	private String id;
	private String user_id;
	private String guitar_id;
	private String guitar_name;
	private String guitar_size_color;
	private Integer count;
	private double guitar_price;
	private String guitar_imgaddr;
	
	public String getGuitar_imgaddr() {
		return guitar_imgaddr;
	}
	public void setGuitar_imgaddr(String guitar_imgaddr) {
		this.guitar_imgaddr = guitar_imgaddr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getGuitar_name() {
		return guitar_name;
	}
	public void setGuitar_name(String guitar_name) {
		this.guitar_name = guitar_name;
	}
	public String getGuitar_size_color() {
		return guitar_size_color;
	}
	public void setGuitar_size_color(String guitar_size_color) {
		this.guitar_size_color = guitar_size_color;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public double getGuitar_price() {
		return guitar_price;
	}
	public void setGuitar_price(double guitar_price) {
		this.guitar_price = guitar_price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getGuitar_id() {
		return guitar_id;
	}
	public void setGuitar_id(String guitar_id) {
		this.guitar_id = guitar_id;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", user_id=" + user_id + ", guitar_id=" + guitar_id + ", guitar_name=" + guitar_name
				+ ", guitar_size_color=" + guitar_size_color + ", count=" + count + ", guitar_price=" + guitar_price
				+ ", guitar_imgaddr=" + guitar_imgaddr + "]";
	}
}
