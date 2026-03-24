<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>
    <title>Dashboard</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <!-- Axios -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body style="background: #f5f7fa;">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm px-3">

        <!-- LEFT: LOGO -->
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="https://x-workz.com/Logo.png" height="70">
        </a>

        <!-- RIGHT: USER DROPDOWN -->
        <div class="ms-auto d-flex align-items-center">

            <img src="getImage/${details.fileName}"
                 class="rounded-circle me-2"
                 alt="img"
                 width="70" height="70"
                 style="object-fit: cover; cursor:pointer;"
                 data-bs-toggle="modal" data-bs-target="#imageModal" />

            <div class="dropdown">
                <a class="btn btn-sm btn-outline-light dropdown-toggle"
                   href="#"
                   role="button"
                   data-bs-toggle="dropdown">
                    ${details.fname}
                </a>

                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="profileUpdate?email=${details.email}">Profile</a></li>
                    <li><a class="dropdown-item" href="news">News</a></li>
                    <li><a class="dropdown-item" href="loginPage">Log out</a></li>
                </ul>
            </div>

        </div>
    </nav>


    <!-- Image Modal -->
    <div class="modal fade" id="imageModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Profile Picture</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body text-center">
                    <img src="getImage/${details.fileName}" class="img-fluid rounded">
                </div>

            </div>
        </div>
    </div>


    <!-- News Section -->
    <div class="container mt-5">
        <div class="row">

            <!-- Card 1 -->
            <div class="col-md-6 mb-4">
                <div class="card h-100 shadow-sm border-0 rounded-4">
                    <img src="https://images.unsplash.com/photo-1518770660439-4636190af475"
                         class="card-img-top"
                         style="height:250px; object-fit:cover;">

                    <div class="card-body">
                        <h5 class="card-title text-primary">Tech Startups Lead AI Innovation</h5>
                        <p class="card-text">
                            Emerging startups are driving the next wave of AI breakthroughs, challenging big tech.
                        </p>
                        <a href="https://www.startupindia.gov.in/content/sih/en/bloglist/blogs/7_leading_AI_startups_in_India.html"
                           target="_blank"
                           class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-md-6 mb-4">
                <div class="card h-100 shadow-sm border-0 rounded-4">
                    <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d"
                         class="card-img-top"
                         style="height:250px; object-fit:cover;">

                    <div class="card-body">
                        <h5 class="card-title text-primary">Climate Action Takes Center Stage</h5>
                        <p class="card-text">
                            Global leaders meet to set new carbon goals and discuss sustainability strategies.
                        </p>
                        <a href="https://www.nationalgeographic.com/environment/article/climate-change"
                           target="_blank"
                           class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-4">
        <div class="container-fluid">
            <p class="mb-0">Copyright &copy; 2025, All Rights Reserved</p>
        </div>
    </footer>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

</body>
</html>