package in.upes.projectmanagement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class databaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        String dbDriver = "com.mysql.jdbc.Driver";  // or "com.mysql.cj.jdbc.Driver" depending on your MySQL version
        String dbURL = "jdbc:mysql://localhost:3306/insync";
        String dbUsername = "root";
        String dbPassword = "rootbhavesh";

        Class.forName(dbDriver);
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }
}