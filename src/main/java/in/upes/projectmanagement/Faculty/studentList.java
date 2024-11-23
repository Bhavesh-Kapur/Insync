package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class studentList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = databaseConnection.initializeDatabase();
            HttpSession session = request.getSession();
            int profid = (int) session.getAttribute("profid");
            String facultyProgramQuery = "SELECT program FROM faculty WHERE profid = ?";
            ps = conn.prepareStatement(facultyProgramQuery);
            ps.setInt(1, profid);
            rs = ps.executeQuery();
            String facultyProgram = null;
            if (rs.next()) {
                facultyProgram = rs.getString("program");
            }
            rs.close();
            ps.close();
            ArrayList<Student> studentList = new ArrayList<>();
            if (facultyProgram != null) {
                String studentQuery = "SELECT sapid, name, semester FROM student WHERE program = ?";
                ps = conn.prepareStatement(studentQuery);
                ps.setString(1, facultyProgram);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int studentId = rs.getInt("sapid");
                    String studentName = rs.getString("name");
                    int semester = rs.getInt("semester");

                    Student student = new Student(studentId, studentName, semester);
                    studentList.add(student);
                }
            }

            request.setAttribute("studentList", studentList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("studentList.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}