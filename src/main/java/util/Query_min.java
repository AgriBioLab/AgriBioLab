package util;

public interface Query_min {
    String QUALITY_OFFICER_LOGIN = "SELECT position, name FROM quality_assurance_officer WHERE username = ? AND password = ?";
}
