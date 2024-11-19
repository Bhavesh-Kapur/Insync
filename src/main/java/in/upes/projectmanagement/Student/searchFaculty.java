package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class searchFaculty extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mentorName = request.getParameter("mentorName");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Faculty> facultyList = new ArrayList<>();

        try {
            con = databaseConnection.initializeDatabase();
            String query = "SELECT profid, name, program FROM faculty WHERE name LIKE ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + mentorName + "%"); // Allow partial matches
            rs = ps.executeQuery();

            while (rs.next()) {
                Faculty faculty = new Faculty(rs.getInt("profid"), rs.getString("name"), rs.getString("program"));
                facultyList.add(faculty);
            }

            request.setAttribute("facultyList", facultyList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("invitementor.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(response.getWriter());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(response.getWriter());
            }
        }
    }
}
