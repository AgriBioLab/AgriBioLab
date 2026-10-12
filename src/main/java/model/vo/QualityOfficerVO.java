package model.vo;

public class QualityOfficerVO {
	private String username;
	private String password;
	private String name;
	private String position;
	
	public QualityOfficerVO() {}

	public QualityOfficerVO(String username, String password, String name, String position) {
		setUsername(username);
		setPassword(password);
		setName(name);
		setPosition(position);
	}

	public String getUsername() { return username; }
	public void setUsername(String username) { this.username = username;}

	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getPosition() { return position; }
	public void setPosition(String position) { this.position = position; }
	
}
