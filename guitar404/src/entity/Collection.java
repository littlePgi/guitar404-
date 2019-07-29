package entity;

public class Collection {
	private String id;
	private String user_id;
	private String guitat_id;
	private String guitar_name;
	private Double guitar_price;
	private String guitar_size_color;
	private String guitar_image;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getGuitat_id() {
		return guitat_id;
	}
	public void setGuitat_id(String guitat_id) {
		this.guitat_id = guitat_id;
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
	public Double getGuitar_price() {
		return guitar_price;
	}
	public void setGuitar_price(Double guitar_price) {
		this.guitar_price = guitar_price;
	}
	public String getGuitar_image() {
		return guitar_image;
	}
	public void setGuitar_image(String guitar_image) {
		this.guitar_image = guitar_image;
	}
	@Override
	public String toString() {
		return "Collection [id=" + id + ", user_id=" + user_id + ", guitat_id=" + guitat_id + ", guitar_name="
				+ guitar_name + ", guitar_price=" + guitar_price + ", guitar_size_color=" + guitar_size_color
				+ ", guitar_image=" + guitar_image + "]";
	}
}
