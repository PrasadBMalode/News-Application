<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>
  <title>Register</title>

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
      <img src="https://x-workz.com/Logo.png" height="70" class="ms-2">

      <!-- RIGHT: Buttons -->
      <div class="ms-auto">
        <a href="indexPage" class="btn btn-outline-primary me-2">Home</a>
        <a href="loginPage" class="btn btn-primary">Login</a>
      </div>

    </div>
  </nav>

  <!-- Main Container -->
  <div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">

    <div class="card shadow-lg border-0 rounded-4 p-4" style="width: 550px;">

      <h3 class="text-center text-primary mb-2">Create Account</h3>
      <p class="text-center text-muted mb-3">Fill the details to register</p>

      <h6 class="text-success text-center">${msg}</h6>

      <form action="register" method="post" onclick="form()">

        <input type="hidden" id="id" name="id">

        <span id="formMessage" class="text-danger"></span>

        <!-- Name -->
        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-person"></i> First Name</label>
            <input type="text" class="form-control" id="fName" name="fname" onchange="fNameValidation()" required>
            <span id="firstName"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-person"></i> Last Name</label>
            <input type="text" class="form-control" id="lName" name="lname" onchange="lNameValidation()" required>
            <span id="lastName"></span>
          </div>
        </div>

        <!-- Email + Phone -->
        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-envelope"></i> Email</label>
            <input type="email" class="form-control" id="email" name="email" onblur="checkEmail()" required>
            <span id="emailExists"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-telephone"></i> Contact Number</label>
            <input type="number" class="form-control" id="phNo" name="phNo" onblur="phone()" required>
            <span id="ph"></span>
          </div>
        </div>

        <!-- DOB + Gender -->
        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-calendar"></i> Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="dob" required>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-gender-ambiguous"></i> Gender</label><br>
            <input type="radio" id="male" name="gender" value="male"> Male
            <input type="radio" id="female" name="gender" value="female" class="ms-3"> Female
            <span id="genderError"></span>
          </div>
        </div>

        <!-- City + Pincode -->
        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-geo-alt"></i> City</label>
            <input type="text" class="form-control" id="city" name="city" onchange="cityName()" required>
            <span id="cityName"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-pin-map"></i> Pincode</label>
            <input type="number" class="form-control" id="pinCode" name="pinCode" onchange="pinCodeValid()" required>
            <span id="pin"></span>
          </div>
        </div>

        <!-- Password -->
        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-lock"></i> Password</label>
            <input type="password" class="form-control" id="password" name="password" onchange="passwordEntry()" required>
            <span id="pass"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label"><i class="bi bi-shield-lock"></i> Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" onblur="confirm()" required>
            <span id="confirmPass"></span>
          </div>
        </div>

        <!-- Buttons -->
        <div class="text-center mt-3">
          <button id="button" type="submit" class="btn btn-primary px-4">
            <i class="bi bi-person-plus"></i> Register
          </button>
          <button type="reset" class="btn btn-outline-secondary ms-2">
            <i class="bi bi-arrow-clockwise"></i> Reset
          </button>

          <p class="mt-3">
            Already have an account?
            <a href="loginPage" class="text-decoration-none fw-bold text-primary">Login</a>
          </p>
        </div>

      </form>
    </div>
  </div>

  <!-- Footer -->
  <footer class="bg-dark text-white text-center py-2">
    <small>© 2025 All Rights Reserved</small>
  </footer>

  <!-- Your Original JS (UNCHANGED) -->
  <script>

    function fNameValidation() {
      var names = document.getElementById("fName").value;
      var button = document.getElementById("button");

      if (names.trim() !== '' && names.length > 3 && names.length <= 25) {
        document.getElementById("firstName").innerHTML = "";
        button.removeAttribute("Disabled");
      } else {
        document.getElementById("firstName").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
        button.setAttribute("Disabled", "");
      }
    }

    function lNameValidation() {
      var names = document.getElementById("lName").value;
      var button = document.getElementById("button");

      if (names.trim() !== '' && names.length > 0 && names.length <= 25) {
        document.getElementById("lastName").innerHTML = "";
        button.removeAttribute("Disabled");
      } else {
        document.getElementById("lastName").innerHTML = "<span style='color:red;'>must be 1 & 25</span>";
        button.setAttribute("Disabled", "");
      }
    }

    function cityName() {
      var names = document.getElementById("city").value;
      var button = document.getElementById("button");

      if (names.trim() !== '' && names.length > 4 && names.length <= 25) {
        document.getElementById("cityName").innerHTML = "";
        button.removeAttribute("Disabled");
      } else {
        document.getElementById("cityName").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
        button.setAttribute("Disabled", "");
      }
    }

    function pinCodeValid() {
      var names = document.getElementById("pinCode").value;
      var button = document.getElementById("button");

      if (names.trim() !== '' && names.length == 6) {
        document.getElementById("pin").innerHTML = "";
        button.removeAttribute("Disabled");
      } else {
        document.getElementById("pin").innerHTML = "<span style='color:red;'>Invalid Pincode</span>";
        button.setAttribute("Disabled", "");
      }
    }

    function passwordEntry() {
      var names = document.getElementById("password").value;
      var button = document.getElementById("button");

      if (names.trim() !== '' && names.length >= 8 && names.length <= 20) {
        document.getElementById("pass").innerHTML = "";
        button.removeAttribute("Disabled");
      } else {
        document.getElementById("pass").innerHTML = "<span style='color:red;'>Password must be 8 characters long</span>";
        button.setAttribute("Disabled", "");
      }
    }

    function confirm() {
      let password = document.getElementById("password").value;
      let checkPassword = document.getElementById("confirmPassword").value;
      var button = document.getElementById("button");

      if (password === checkPassword) {
        document.getElementById("confirmPass").innerHTML = "";
        button.removeAttribute("disabled");
      } else {
        document.getElementById("confirmPass").innerHTML = "<span style='color:red;'>Password doesn't match</span>";
        button.setAttribute("disabled", "");
      }
    }

    const checkEmail = async () => {
      let emailId = document.getElementById("email").value
      var button = document.getElementById("button");
      const response = await axios("http://localhost:8080/news/isEmailExists?email=" + emailId)

      if (emailId.length < 5) {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
        button.setAttribute("disabled", "");
      } else if (response.data == "email already exists") {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email already exists</span>";
        button.setAttribute("disabled", "");
      } else {
        document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
        button.removeAttribute("disabled");
      }
    }

    const phone = async () => {
      let phoneNumber = document.getElementById("phNo").value
      var button = document.getElementById("button");
      const response = await axios("http://localhost:8080/news/isPhNoExists?phNo=" + phoneNumber)

      if (phoneNumber.length != 10) {
        document.getElementById("ph").innerHTML = "<span style='color:red;'>invalid phone number</span>";
        button.setAttribute("disabled", "");
      } else if (response.data == "phone number already exists") {
        document.getElementById("ph").innerHTML = "<span style='color:red;'>phone number already exists</span>";
        button.setAttribute("disabled", "");
      } else {
        document.getElementById("ph").innerHTML = "<span style='color:green;'>valid</span>";
        button.removeAttribute("disabled");
      }
    }

    function form() {
      var fName = document.getElementById("fName").value;
      var lName = document.getElementById("lName").value;
      var city = document.getElementById("city").value;
      var email = document.getElementById("email").value;
      var phNo = document.getElementById("phNo").value;
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirmPassword").value;
      var maleChecked = document.getElementById("male").checked;
      var femaleChecked = document.getElementById("female").checked;
      var button = document.getElementById("button");

      if (
        fName.trim() !== "" && fName.length > 3 && fName.length <= 25 &&
        lName.trim() !== "" && lName.length > 0 &&
        lName.length <= 25 && city.trim() !== "" &&
        city.length > 4 && city.length <= 25 &&
        email.trim() !== "" && phNo.trim() !== "" &&
        phNo.length == 10 && password.trim() !== "" &&
        password.length >= 8 && password === confirmPassword
      ) {
        if (maleChecked || femaleChecked) {
          document.getElementById("formMessage").innerHTML = "";
          button.removeAttribute("disabled");
        } else {
          document.getElementById("formMessage").innerHTML = "<span style='color:red;'>Please fill the form correctly</span>";
          button.setAttribute("disabled", "");
        }
      } else {
        document.getElementById("formMessage").innerHTML = "<span style='color:red;'>Please fill the form correctly</span>";
        button.setAttribute("disabled", "");
      }
    }

    const now = new Date().toISOString().split('T')[0];
    document.getElementById('dob').setAttribute('max', now);

  </script>

</body>
</html>