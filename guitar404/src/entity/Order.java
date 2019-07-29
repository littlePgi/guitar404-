package entity;

public class Order {
	private String id;
	private String user_id;
	private String guitar_id;
	private String guitar_name;
	private Integer number;
	private String start_date;
	private String end_date;
	private Integer state;
	private String note;
	private double money;
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
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
	public String getGuitar_id() {
		return guitar_id;
	}
	public void setGuitar_id(String guitar_id) {
		this.guitar_id = guitar_id;
	}
	public String getGuitar_name() {
		return guitar_name;
	}
	public void setGuitar_name(String guitar_name) {
		this.guitar_name = guitar_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", user_id=" + user_id + ", guitar_id=" + guitar_id + ", guitar_name=" + guitar_name
				+ ", number=" + number + ", start_date=" + start_date + ", end_date=" + end_date + ", state=" + state
				+ ", note=" + note + ", money=" + money + "]";
	}
}
