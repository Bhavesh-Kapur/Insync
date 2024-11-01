package in.upes.projectmanagement.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class databaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        String dbDriver = "com.mysql.jdbc.Driver";  // or "com.mysql.cj.jdbc.Driver" depending on your MySQL version
        String dbURL = EnvConfig.get("DB_URL");
        String dbUsername = EnvConfig.get("DB_USER");
        String dbPassword = EnvConfig.get("DB_PASSWORD");

        Class.forName(dbDriver);
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }
}