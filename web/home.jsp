<%-- 
    Document   : home
    Created on : Nov 15, 2024, 10:34:20 AM
    Author     : SHERE
--%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="static/css/home.css"/>
    </head>
    <body>
        <header class="p-3 text-bg-dark">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href=""/></svg>
                    </a>

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Courses</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Quiz</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Assignments</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Contact Us</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">About</a></li>
                    </ul>

                    <div class="text-end">
                        <%
                            if (session.getAttribute("email") != null) {
                                String userFirstName = (String) session.getAttribute("firstName");
                                String userLastName = (String) session.getAttribute("lastName");
                        %>
                        <span class="text-white me-2">Welcome, <%= userFirstName%> </span>
                        <a href="Profile.jsp" class="btn btn-outline-light me-2"><i class="fa-solid fa-user"></i> Profile</a>
                        <a href="Logout.jsp" class="btn btn-danger">Logout</a>
                        <% } else { %>
                        <a href="Login.jsp" class="btn btn-outline-light me-2">Login</a>
                        <a href="signup.jsp" class="btn btn-warning">Sign-up</a>
                        <% }%>
                    </div>
                </div>
            </div>
        </header>


        <div class="Hero-Cover">
                
        </div>

        <!--Hero Section--> 
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="static/images/Hero-Section/1.png" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>"Empowering Students to Learn Anytime, Anywhere"</h5>
                        <!--<p>Some representative placeholder content for the first slide.</p>-->
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="static/images/Hero-Section/2.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>"Explore 100+ courses in Science, Math, Languages, and more!"</h5>
                        <!--<p>Some representative placeholder content for the second slide.</p>-->
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="static/images/Hero-Section/3.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>"Boost your knowledge with engaging quizzes and live expert guidance"</h5>
                        <!--<p>Some representative placeholder content for the third slide.</p>-->
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="static/images/Hero-Section/4.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>"Tailor your learning experience with personalized plans"</h5>
                        <!--<p>Some representative placeholder content for the third slide.</p>-->
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/js/all.min.js" integrity="sha512-8py0AXTY8pfAroJmBkYfJ+VuKUKMMsUOC1MldW9kkC/k4SZi6AexSDS60QYn41U2rp8KL9IpVHy8FxW2TDmjDA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>

