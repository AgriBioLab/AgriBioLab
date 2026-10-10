package util;

public class PrivacyMaskingUtil {
	
    public static String maskName(String name) {
        if (name == null || name.isBlank()) { return name; }

        if (name.length() == 2) { return name.charAt(0) + "*"; }

        if (name.length() >= 3) {
            return name.charAt(0)
                    + "*".repeat(name.length() - 2)
                    + name.charAt(name.length() - 1);
        }

        return name;
    }


}
