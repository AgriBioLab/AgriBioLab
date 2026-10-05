package util;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/** Common JDBC connection following the learning project; no connection pool yet. */
public class DBCP {
    private static DBCP dbcp;

    private DBCP() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Check Oracle JDBC driver", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        if (dbcp == null) dbcp = new DBCP();
        // Keep database credentials in the Git-ignored configuration file.
        Properties properties = new Properties();
        FileInputStream input = null;
        try {
            String path = System.getProperty("agricomp.db.config", "db.properties");
            input = new FileInputStream(path);
            properties.load(input);
        } catch (IOException e) {
            throw new SQLException("Check db.properties", e);
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    throw new SQLException("Cannot close DB configuration file", e);
                }
            }
        }
        String url = properties.getProperty("db.url");
        String user = properties.getProperty("db.user");
        String password = properties.getProperty("db.password");
        if (url == null || user == null || password == null) {
            throw new SQLException("Configure db.url, db.user and db.password");
        }
        return DriverManager.getConnection(url, user, password);
    }
}
