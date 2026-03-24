<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News Official Page</title>

    <link rel="icon" href="https://www.x-workz.in/Logo.png">

    <!-- ✅ Bootstrap FIXED -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>

<body>

    <!-- ✅ HEADER (ONLY LOGO CHANGED) -->
    <header class="bg-dark text-white">
        <div class="container-fluid">
            <div class="row align-items-center">

                <!-- LEFT LOGO -->
                <div class="col-auto">
                    <img src="https://x-workz.com/Logo.png" alt="Logo" height="70px">
                </div>

                <!-- CENTER TEXT -->
                <div class="col text-center">
                    <h1 class="my-0">X-Workz</h1>
                </div>

                <!-- RIGHT BUTTONS -->
                <div class="col-auto text-center">
                    <button type="button" class="btn btn-primary me-2">
                        <a href="registerPage" class="text-decoration-none text-white">Register</a>
                    </button>
                    <button type="button" class="btn btn-success">
                        <a href="loginPage" class="text-decoration-none text-white">Login</a>
                    </button>
                </div>

            </div>
        </div>
    </header>

    <!-- MARQUEE -->
    <div class="container text-center my-4">
        <marquee behavior="scroll" direction="left" scrollamount="10">
            News is what somebody somewhere wants to suppress; all the rest is advertising.
        </marquee>
    </div>

    <!-- IMAGE -->
    <div class="text-center my-4">
        <img src="https://wallpapercave.com/wp/wp7342177.jpg"
             alt="News Image"
             class="img-fluid w-100"
             style="max-height: 80vh; object-fit: cover;">
    </div>

    <!-- FOOTER -->
    <div class="bottom">
        <footer class="bg-dark text-white text-center py-3 mt-auto border-top">
            <p class="mb-0">Copyright &copy; 2025, All Rights Reserved</p>
        </footer>
    </div>

    <!-- ✅ Bootstrap JS (important for proper behavior) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>