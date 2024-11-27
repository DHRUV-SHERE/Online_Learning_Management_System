
import jakarta.resource.cci.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Record_021", "root", "root")) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM user_detail WHERE email = ?");
            stmt.setString(1, email);

            int deleted = stmt.executeUpdate();
            if (deleted > 0) {
                session.invalidate();
                response.sendRedirect("signup.jsp");
            } else {
                request.setAttribute("error", "Account deletion failed.");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
