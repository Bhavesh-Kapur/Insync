package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;;


public class DownloadFilesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        response.setContentType("text/html");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/insync", "root", "rootbhavesh");
        PreparedStatement stmt = conn.prepareStatement("SELECT id, file_type, filename FROM student_documents WHERE student_id = ?")) {

            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();

            StringBuilder fileLinks = new StringBuilder();
            while (rs.next()) {
                int fileId = rs.getInt("id");
                String fileType = rs.getString("file_type");
                String fileName = rs.getString("filename");
                
                fileLinks.append("<p>").append(fileType).append(": ")
                         .append("<a href='downloadFile?fileId=").append(fileId)
                         .append("'>").append(fileName).append("</a></p>");
            }
            response.getWriter().write(fileLinks.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error fetching files.");
        }
    }
}


