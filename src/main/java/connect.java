import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connect {
    public static void main(String args[]) {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bhavesh", "root", "rootbhavesh");
            
            // Create a statement object to send SQL statements to the database
            Statement stmt = con.createStatement();
            
            // Execute the query
            ResultSet rs = stmt.executeQuery("SELECT * FROM test");
            
            // Process the result set
            while (rs.next()) {
                System.out.println(rs.getInt(1));
            }
            
            // Close the connection after use
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
