<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>
  <title>Login</title>

  <link rel="icon" href="https://www.x-workz.in/Logo.png">

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

  <!-- Axios -->
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body style="background: linear-gradient(to right, #eef2f3, #dfe9f3);">

  <nav class="navbar navbar-expand-lg bg-dark shadow-sm">
    <div class="container-fluid">

      <!-- LEFT: Logo -->
      <img src="https://x-workz.com/Logo.png" height="70">

      <!-- RIGHT: Buttons -->
      <div class="ms-auto">
        <a href="indexPage" class="btn btn-outline-primary me-2">Home</a>
        <a href="registerPage" class="btn btn-primary">Register</a>
      </div>

    </div>
  </nav>

  <!-- Main Section -->
  <div class="container d-flex align-items-center justify-content-center" style="min-height: 90vh;">

    <div class="row shadow-lg rounded-4 overflow-hidden" style="width: 900px; background: white;">

      <!-- Left Image Section -->
      <div class="col-md-6 d-none d-md-block p-0">
        <img src="https://tse3.mm.bing.net/th?id=OIP.OmzVkphEnjBkUIyGvRPj4gHaD-&pid=Api&P=0&h=180"
             class="img-fluid h-100 w-100" style="object-fit: cover;">
      </div>

      <!-- Login Form Section -->
      <div class="col-md-6 p-5">

        <h3 class="text-center text-primary mb-2">Welcome Back</h3>
        <p class="text-center text-muted mb-4">Login to your account</p>

        <h6 class="text-success text-center">${success}</h6>

        <form action="login" method="post">

          <!-- Email -->
          <div class="mb-3">
            <label class="form-label"><i class="bi bi-envelope"></i> Email</label>
            <input type="email" class="form-control" placeholder="Enter your email"
                   name="email" id="email" onblur="checkEmail()" value="${enteredEmail}">
            <span id="emailExists"></span>
          </div>

          <!-- Password -->
          <div class="mb-3">
            <label class="form-label"><i class="bi bi-lock"></i> Password</label>
            <input type="password" class="form-control" placeholder="Enter your password" name="password">
            <h6 style="color: red;text-align: center;">${loginErrMsg}</h6>
          </div>

          <!-- Login Button -->
          <div class="d-grid mb-3">
            <button type="submit" class="btn btn-primary" id="button">
              <i class="bi bi-box-arrow-in-right"></i> Login
            </button>
          </div>

          <!-- Forgot Password -->
          <div class="text-center">
            <a href="forgotPassword" class="text-decoration-none">Forgot Password?</a>
          </div>

        </form>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="bg-dark text-white text-center py-2">
    <small>© 2025 All Rights Reserved</small>
  </footer>

  <!-- Your Original JS (UNCHANGED) -->
  <script>
    const checkEmail = async () => {
      let emailId = document.getElementById("email").value
      var button = document.getElementById("button");
      const response = await axios("http://localhost:8080/news/isEmailExists?email=" + emailId)

      if (emailId.length < 5) {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
        button.setAttribute("disabled", "");
      } else if (response.data == "email already exists") {
        document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
        button.removeAttribute("disabled");
      } else {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email not exists</span>";
        button.setAttribute("disabled", "");
      }
      console.log(response.data)
    }
  </script>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

</body>
</html>