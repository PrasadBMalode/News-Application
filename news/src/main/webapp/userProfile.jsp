<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>Profile</title>

            <link rel="icon" href="https://www.x-workz.in/Logo.png">

            <!-- Bootstrap -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

            <!-- Bootstrap Icons -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

            <!-- Axios -->
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        </head>

        <body style="background: linear-gradient(to right, #eef2f3, #dfe9f3);">

            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg bg-dark shadow-sm">
                <div class="container-fluid">
                    <img src="https://x-workz.com/Logo.png" height="70">
                </div>
            </nav>

            <!-- Profile Section -->
            <div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">

                <div class="card shadow-lg border-0 rounded-4 p-4" style="width: 650px;">

                    <h3 class="text-center text-primary mb-3">My Profile</h3>

                    <form action="updateUserDetails" method="post" enctype="multipart/form-data">

                        <!-- Profile Image -->
                        <div class="text-center mb-4">
                            <img src="getImage/${dto.fileName}"
                                onerror="this.onerror=null;this.src='https://cdn-icons-png.flaticon.com/512/149/149071.png';"
                                class="rounded-circle shadow" style="height:150px;width:150px;object-fit:cover;">
                        </div>

                        <!-- Hidden ID -->
                        <input type="hidden" id="id" name="id" value="${dto.id}">

                        <!-- Name -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-person"></i> First Name</label>
                                <input type="text" class="form-control" id="fName" name="fname"
                                    onchange="fNameValidation()" value="${dto.fname}" required>
                                <span id="firstName"></span>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-person"></i> Last Name</label>
                                <input type="text" class="form-control" id="lName" name="lname"
                                    onchange="lNameValidation()" value="${dto.lname}" required>
                                <span id="lastName"></span>
                            </div>
                        </div>

                        <!-- Email + Phone -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-envelope"></i> Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${dto.email}"
                                    readonly>
                                <span id="emailExists"></span>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-telephone"></i> Contact Number</label>
                                <input type="number" class="form-control" id="phNo" name="phNo" onblur="phone()"
                                    value="${dto.phNo}" required>
                                <span id="ph"></span>
                            </div>
                        </div>

                        <!-- DOB + City -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-calendar"></i> Date Of Birth</label>
                                <input type="date" class="form-control" id="dob" name="dob" value="${dto.dob}" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-geo-alt"></i> City</label>
                                <input type="text" class="form-control" id="city" name="city" onchange="cityName()"
                                    value="${dto.city}" required>
                                <span id="cityName"></span>
                            </div>
                        </div>

                        <!-- Pincode + File -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-pin-map"></i> Pincode</label>
                                <input type="number" class="form-control" id="pinCode" name="pinCode"
                                    onchange="pinCodeValid()" value="${dto.pinCode}" required>
                                <span id="pin"></span>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label"><i class="bi bi-image"></i> Profile Image</label>
                                <input type="file" class="form-control" name="file" id="fileInput"
                                    onchange="validateFileSize()">
                                <span id="fileSizeError" class="text-danger"></span>
                            </div>
                        </div>

                        <!-- Hidden Gender -->
                        <input type="radio" id="male" name="gender" value="male" ${dto.gender=='male' ? 'checked' : '' }
                            hidden>
                        <input type="radio" id="female" name="gender" value="female" ${dto.gender=='female' ? 'checked'
                            : '' } hidden>

                        <!-- Hidden Password -->
                        <input type="password" id="password" name="password" value="${dto.password}" hidden>
                        <input type="password" id="confirmPassword" name="confirmPassword" value="${dto.password}"
                            hidden>

                        <!-- Buttons -->
                        <div class="text-center mt-3">
                            <button id="button" type="submit" class="btn btn-primary px-4">
                                <i class="bi bi-pencil-square"></i> Update
                            </button>

                            <a href="getUserPage?email=${dto.email}" class="btn btn-outline-secondary ms-2">
                                <i class="bi bi-arrow-left"></i> Back
                            </a>
                        </div>

                    </form>
                </div>
            </div>

            <!-- Footer -->
            <footer class="bg-dark text-white text-center py-2">
                <small> Copyright &copy; 2025, All Rights Reserved</small>
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

                const phone = async () => {
                    let phoneNumber = document.getElementById("phNo").value
                    var button = document.getElementById("button");
                    const response = await axios("http://localhost:8080/metro/isPhNoExists?phNo=" + phoneNumber)

                    if (phoneNumber.length < 10 || phoneNumber.length > 10) {
                        document.getElementById("ph").innerHTML = "<span style='color:red;'>invalid phone number</span>";
                        button.setAttribute("disabled", "");
                    } else if (response.data == "phone number not exists" || phoneNumber == "${dto.phNo}") {
                        document.getElementById("ph").innerHTML = "<span style='color:green;'>valid</span>";
                        button.removeAttribute("disabled");
                    } else {
                        document.getElementById("ph").innerHTML = "<span style='color:red;'>phone number already exists</span>";
                        button.setAttribute("disabled", "");
                    }
                }

                const dto = { gender: "${dto.gender}" };
                document.getElementById(dto.gender).checked = true;

                function validateFileSize() {
                    const fileInput = document.getElementById('fileInput');
                    const file = fileInput.files[0];
                    const maxSizeInBytes = 2 * 1024 * 1024;

                    if (file && file.size > maxSizeInBytes) {
                        document.getElementById('fileSizeError').textContent = "file size exceeds 2mb limit.";
                        document.getElementById("button").setAttribute("disabled", "");
                    } else {
                        document.getElementById('fileSizeError').textContent = "";
                        document.getElementById("button").removeAttribute("disabled");
                    }
                }

            </script>

        </body>

        </html>