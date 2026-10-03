package com.agribiolab.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBUtil {
    private static final String DRIVER = "oracle.jdbc.OracleDriver";

    private DBUtil() {
    }

    public static Connection getConnection() throws SQLException {
        String url = config("agricomp.db.url", "AGRICOMP_DB_URL");
        String user = config("agricomp.db.user", "AGRICOMP_DB_USER");
        String password = config("agricomp.db.password", "AGRICOMP_DB_PASSWORD");

        if (isBlank(url) || isBlank(user)) {
            throw new SQLException("Database connection settings are required: agricomp.db.url/agricomp.db.user or AGRICOMP_DB_URL/AGRICOMP_DB_USER");
        }

        loadOracleDriver();
        return DriverManager.getConnection(url, user, password);
    }

    public static void close(AutoCloseable... resources) {
        if (resources == null) {
            return;
        }

        for (AutoCloseable resource : resources) {
            if (resource == null) {
                continue;
            }
            try {
                resource.close();
            } catch (Exception ignored) {
                // Closing failure should not hide the original JDBC exception.
            }
        }
    }

    private static void loadOracleDriver() throws SQLException {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Oracle JDBC driver is not available on the classpath: " + DRIVER, e);
        }
    }

    private static String config(String propertyName, String envName) {
        String value = System.getProperty(propertyName);
        if (!isBlank(value)) {
            return value;
        }
        return System.getenv(envName);
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
