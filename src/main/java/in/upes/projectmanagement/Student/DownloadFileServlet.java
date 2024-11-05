package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import jakarta.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// @WebServlet("/downloadFile")
public class DownloadFileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int fileId = Integer.parseInt(request.getParameter("fileId"));
        
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/insync", "root", "rootbhavesh");
             PreparedStatement stmt = conn.prepareStatement("SELECT filename, file_content FROM student_documents WHERE id = ?")) {
            
            stmt.setInt(1, fileId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String fileName = rs.getString("filename");
                InputStream fileContent = rs.getBlob("file_content").getBinaryStream();
                
                // Set response headers for download
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

                // Stream the file content to the response output
                OutputStream outStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                outStream.flush();
            } else {
                response.getWriter().write("File not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error retrieving file.");
        }
    }
}
