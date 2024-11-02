package in.upes.projectmanagement.Faculty;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class facLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session
        HttpSession session = request.getSession(false); // Get the current session, don't create if it doesn't exist
        if (session != null) {
            session.invalidate();
        }

        // Redirect to login page
        String contextPath = request.getContextPath();
        response.sendRedirect(contextPath + "/");
    }
}