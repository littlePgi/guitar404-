package entity;

import java.util.ArrayList;
import java.util.List;

public class Guitar {
	private String id;
	private String brand;
	private String material;
	private String name;
	private Integer size;
	private String color;
	private double price;
	private String type;
	private Integer state;
	private String imgaddr;//Àı¬‘Õº
	private List<GuitarImg> guitarImgs = new ArrayList<GuitarImg>();//œÍ«ÈÕº∆¨
	public String getImgaddr() {
		return imgaddr;
	}
	public void setImgaddr(String imgaddr) {
		this.imgaddr = imgaddr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public List<GuitarImg> getGuitarImgs() {
		return guitarImgs;
	}
	public void setGuitarImgs(List<GuitarImg> guitarImgs) {
		this.guitarImgs = guitarImgs;
	}
	@Override
	public String toString() {
		return "Guitar [id=" + id + ", brand=" + brand + ", material=" + material + ", name=" + name + ", size=" + size
				+ ", color=" + color + ", price=" + price + ", type=" + type + ", state=" + state + ", imgaddr="
				+ imgaddr + ", guitarImgs=" + guitarImgs + "]";
	}
	
}
