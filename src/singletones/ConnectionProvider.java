package singletones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    private static final String userName = "postgres";
    private static final String password = "Maracineanu371";
    private static final String url = "jdbc:postgresql://localhost:5432/postgres";
    private static final String driverClassName = "org.postgresql.Driver";
    private static Connection instance;

    private ConnectionProvider() {

    }

    public static Connection getConnection() throws ClassNotFoundException{
        if (instance == null) {
            Class.forName(driverClassName);
            try {
                instance = DriverManager.getConnection(url, userName, password);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return instance;
    }
}

