<%-- 
    Document   : login
    Created on : Nov 15, 2024, 10:30:29 AM
    Author     : SHERE
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
        <link rel="stylesheet" href="static/css/login.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
    </head>
    <body class="text-center">

        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            boolean loginSuccess = false;

            if (email != null && password != null) {
                try {
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Record_021", "root", "root");

                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM user_detail WHERE email=? AND password=?");
                    ps.setString(1, email);
                    ps.setString(2, password);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        loginSuccess = true;
                    }

                    rs.close();
                    ps.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (loginSuccess) {
                response.sendRedirect("home.jsp");
            } else if (email != null && password != null) { %>
        <script>
            alert('Invalid email or password. Please try again.');
        </script>
        <%
            }
        %>

        <main class="form-signin">
            <form method="POST" action="Login.jsp">
                <img class="mb-4 logoimg" src="static/images/Logo_1.jpg" alt="">

                <div class="mainform">
                    <h1 class="h3 mb-3 fw-normal form-elm">Please sign in</h1>

                    <div class="form-floating form-elm">
                        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email" required>
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating form-elm">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" required>
                        <label for="floatingPassword">Password</label>
                    </div>

                    <div class="checkbox mb-3 form-elm">
                        <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label>
                    </div>

                    <button class="w-100 btn btn-lg btn-primary form-elm" type="submit">Login Now</button>
                    <p class="mt-3 form-elm">
                        Doesn't have Account ? <a href="signup.jsp">Signup now</a>
                    </p>
                </div>
            </form>
        </main>

    </body>
</html>
