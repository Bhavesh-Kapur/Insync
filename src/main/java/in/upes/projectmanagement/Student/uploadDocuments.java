package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@MultipartConfig
public class uploadDocuments extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        
        // Upload both files with a single method call for simplicity
        uploadFile(request.getPart("srs_report"), studentId, "SRS");
        uploadFile(request.getPart("synopsis_report"), studentId, "Synopsis");
        
        response.getWriter().println("Files uploaded successfully!");
    }

    private void uploadFile(Part filePart, int studentId, String fileType) {
        String dbURL = "jdbc:mysql://localhost:3306/insync";
        String dbUser = "root";
        String dbPassword = "rootbhavesh";

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO student_documents (student_id, file_type, file_content, filename) VALUES (?, ?, ?, ?)")) {
            
            stmt.setInt(1, studentId);
            stmt.setString(2, fileType);
            stmt.setBlob(3, filePart.getInputStream());
            stmt.setString(4, filePart.getSubmittedFileName());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
