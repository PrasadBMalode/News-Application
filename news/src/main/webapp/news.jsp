<!-- 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>News App</title>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <style>
      .navbar-brand {
        font-weight: bold;
        font-size: 1.5rem;
      }

      .nav-link {
        font-size: 1rem;
      }

      .btn-login {
        font-weight: 500;
      }

      .footer {
        background-color: #6c757d;
        color: white;
        padding: 20px 0;
      }

      .footer a {
        color: #d1e0ff;
        text-decoration: none;
      }

      .footer a:hover {
        text-decoration: underline;
      }

      .card-img-top {
        height: 295px;
        object-fit: cover;
      }

      .news-card {
        margin-top: 20px;
      }

      .card-body {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }

      .card-title {
        font-size: 1.2rem;
      }

      .card-text {
        font-size: 0.9rem;
        color: #555;
      }
    </style>
  </head>

  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">News App</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#newsNavbar"
          aria-controls="newsNavbar"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="newsNavbar">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" href="#" id="showTopHeadlinesBtn"
                >Top Headlines</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="showBitcoinNewsBtn"
                >Bitcoin News</a
              >
            </li>
          </ul>
          <form
            class="d-flex"
            role="search"
            onsubmit="searchNews(event)"
            style="margin-right: 10px"
          >
            <input
              class="form-control me-2"
              type="search"
              id="searchInput"
              placeholder="Search News"
              aria-label="Search"
            />
            <input
              class="btn btn-light btn-login"
              type="submit"
              value="Search"
            />
          </form>

          <button type="button" class="btn btn-success">
                               <a href="home" class="text-decoration-none text-white"
                                 >Home</a></button>

           <button type="button" class="btn btn-success ms-2">
                     <a href="indexPage" class="text-decoration-none text-white"
                       >Logout</a></button>

        </div>
      </div>
    </nav>

    <div class="container my-5 text-center">
      <h1>Welcome to News App</h1>
      <p>Explore the latest news headlines from various sources.</p>
    </div>

    <div class="container my-5">
      <h2 class="text-center mb-4" id="contentTitle">Top Headlines</h2>
      <div class="row" id="content-container"></div>
    </div>

    <footer class="footer mt-auto">
      <div class="container text-center text-md-start">
        <div class="row">
          <div class="col-md-6 mb-3 mb-md-0">
            <h5 class="text-white">News App</h5>
            <p>Your one-stop destination for all trending news.</p>
          </div>
          <div class="col-md-3 mb-3">
            <h6>Quick Links</h6>
            <ul class="list-unstyled">
              <li><a href="#">Home</a></li>
              <li><a href="#">Top Headlines</a></li>
              <li><a href="#">Bitcoin News</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-3">
            <h6>Contact</h6>
            <ul class="list-unstyled">
              <li>Email: support@newsapp.com</li>
              <li>Phone: +1 234 567 8901</li>
            </ul>
          </div>
        </div>
        <hr class="my-3 border-light" />
        <p class="text-center mb-0">
          &copy; 2025 News App. All rights reserved.
        </p>
      </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
      const apiKey = "29ecaa96fb3b4ab6b826c3c780e4a93d";

      const showTopHeadlines = () => {
        const apiUrl = `https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=${apiKey}`;
        fetch(apiUrl)
          .then((response) => response.json())
          .then((data) => {
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = "";

            if (data.articles && data.articles.length) {
              data.articles.forEach((article) => {
                const newsCard = `
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="${article.urlToImage}" class="card-img-top" alt="${article.title}">
                    <div class="card-body">
                      <h5 class="card-title">${article.title}</h5>
                      <p class="card-text">${article.description}</p>
                      <a href="${article.url}" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              `;
                newsContainer.innerHTML += newsCard;
              });
            } else {
              newsContainer.innerHTML =
                '<p class="text-danger text-center">No news found.</p>';
            }
          })
          .catch((error) => {
            console.error("Failed to load news:", error);
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = `<p class="text-danger text-center">Failed to load news data.</p>`;
          });
      };

      const showBitcoinNews = () => {
        const apiUrl = `https://newsapi.org/v2/everything?q=bitcoin&apiKey=${apiKey}`;
        fetch(apiUrl)
          .then((response) => response.json())
          .then((data) => {
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = ""; // Clear previous results

            if (data.articles && data.articles.length) {
              data.articles.forEach((article) => {
                const newsCard = `
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="${article.urlToImage}" class="card-img-top" alt="${article.title}">
                    <div class="card-body">
                      <h5 class="card-title">${article.title}</h5>
                      <p class="card-text">${article.description}</p>
                      <a href="${article.url}" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              `;
                newsContainer.innerHTML += newsCard;
              });
            } else {
              newsContainer.innerHTML =
                '<p class="text-danger text-center">No bitcoin news found.</p>';
            }
          })
          .catch((error) => {
            console.error("Failed to load bitcoin news:", error);
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = `<p class="text-danger text-center">Failed to load bitcoin news data.</p>`;
          });
      };

      const searchNews = (event) => {
        event.preventDefault();

        const searchQuery = document.getElementById("searchInput").value;

        if (searchQuery.trim() === "") {
          alert("Please enter a search query.");
          return;
        }

        const apiUrl = `https://newsapi.org/v2/everything?q=${searchQuery}&apiKey=${apiKey}`;
        fetch(apiUrl)
          .then((response) => response.json())
          .then((data) => {
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = "";

            if (data.articles && data.articles.length) {
              data.articles.forEach((article) => {
                const newsCard = `
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="${article.urlToImage}" class="card-img-top" alt="${article.title}">
                    <div class="card-body">
                      <h5 class="card-title">${article.title}</h5>
                      <p class="card-text">${article.description}</p>
                      <a href="${article.url}" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              `;
                newsContainer.innerHTML += newsCard;
              });
            } else {
              newsContainer.innerHTML =
                '<p class="text-danger text-center">No search results found.</p>';
            }
          })
          .catch((error) => {
            console.error("Failed to load search results:", error);
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = `<p class="text-danger text-center">Failed to load search data.</p>`;
          });
      };

      showTopHeadlines();

      document
        .getElementById("showTopHeadlinesBtn")
        .addEventListener("click", (e) => {
          e.preventDefault();
          showTopHeadlines();
        });

      document
        .getElementById("showBitcoinNewsBtn")
        .addEventListener("click", (e) => {
          e.preventDefault();
          showBitcoinNews();
        });
    </script>
  </body>
</html> -->









<html lang="en"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>News App</title>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .navbar-brand {
        font-weight: bold;
        font-size: 1.5rem;
      }

      .nav-link {
        font-size: 1rem;
      }

      .btn-login {
        font-weight: 500;
      }

      .footer {
        background-color: #6c757d;
        color: white;
        padding: 20px 0;
      }

      .footer a {
        color: #d1e0ff;
        text-decoration: none;
      }

      .footer a:hover {
        text-decoration: underline;
      }

      .card-img-top {
        height: 295px;
        object-fit: cover;
      }

      .news-card {
        margin-top: 20px;
      }

      .card-body {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }

      .card-title {
        font-size: 1.2rem;
      }

      .card-text {
        font-size: 0.9rem;
        color: #555;
      }
    </style>
  </head>

  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">News App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#newsNavbar" aria-controls="newsNavbar" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="newsNavbar">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" href="#" id="showTopHeadlinesBtn">Top Headlines</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="showBitcoinNewsBtn">Bitcoin News</a>
            </li>
          </ul>
          <form class="d-flex" role="search" onsubmit="searchNews(event)" style="margin-right: 10px">
            <input class="form-control me-2" type="search" id="searchInput" placeholder="Search News" aria-label="Search">
            <input class="btn btn-light btn-login" type="submit" value="Search">
          </form>

          <button type="button" class="btn btn-success">
                               <a href="home" class="text-decoration-none text-white">Home</a></button>

           <button type="button" class="btn btn-success ms-2">
                     <a href="indexPage" class="text-decoration-none text-white">Logout</a></button>

        </div>
      </div>
    </nav>

    <div class="container my-5 text-center">
      <h1>Welcome to News App</h1>
      <p>Explore the latest news headlines from various sources.</p>
    </div>

    <div class="container my-5">
      <h2 class="text-center mb-4" id="contentTitle">Top Headlines</h2>
      <div class="row" id="content-container">
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/83c3/live/e96960a0-26a6-11f1-934f-036468834728.jpg" class="card-img-top" alt="Smoking ban in Scotland's pubs was a 'PR war' - but has it saved lives?">
                    <div class="card-body">
                      <h5 class="card-title">Smoking ban in Scotland's pubs was a 'PR war' - but has it saved lives?</h5>
                      <p class="card-text">Exactly 20 years ago, Scotland became the first part of the UK to outlaw smoking in bars, restaurants and offices.</p>
                      <a href="https://www.bbc.co.uk/news/articles/c4gjv27xvylo" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/bc6c/live/75d7a8f0-28b7-11f1-a969-25e19bf2e998.jpg" class="card-img-top" alt="Is Trump any closer to an Iran exit strategy?">
                    <div class="card-body">
                      <h5 class="card-title">Is Trump any closer to an Iran exit strategy?</h5>
                      <p class="card-text">The White House insists the president is dictating events, but even some Republicans are frustrated by mixed messaging about his war aims.</p>
                      <a href="https://www.bbc.co.uk/news/articles/c15d980nyw1o" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/cec5/live/d62379b0-28ca-11f1-a79a-77e93010d956.jpg" class="card-img-top" alt="NS&amp;I set to pay millions in compensation to customers">
                    <div class="card-body">
                      <h5 class="card-title">NS&amp;I set to pay millions in compensation to customers</h5>
                      <p class="card-text">The government-backed bank has been accused of a series of errors, including not paying bereaved families money that was rightfully theirs.</p>
                      <a href="https://www.bbc.co.uk/news/articles/c3w3eg4n9zwo" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/a97c/live/3bbc0c40-28b4-11f1-b297-95b0a0a8331e.jpg" class="card-img-top" alt="Newspaper headlines: 'Iran rejects peace plan' and '£400m cost of savings scandal'">
                    <div class="card-body">
                      <h5 class="card-title">Newspaper headlines: 'Iran rejects peace plan' and '£400m cost of savings scandal'</h5>
                      <p class="card-text">Iran's rejection of US talks and Donald Trump's reaction features on Thursday's front pages.</p>
                      <a href="https://www.bbc.co.uk/news/articles/cp8637dnmn7o" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/1543/live/c1c12910-2837-11f1-b297-95b0a0a8331e.jpg" class="card-img-top" alt="How a prolonged Middle East conflict could reshape how we fly">
                    <div class="card-body">
                      <h5 class="card-title">How a prolonged Middle East conflict could reshape how we fly</h5>
                      <p class="card-text">The Gulf's hub airports made long-distance travel cheaper - but now their future looks unclear.</p>
                      <a href="https://www.bbc.co.uk/news/articles/cn08x9lw0pzo" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/95a7/live/d7825c20-2877-11f1-934f-036468834728.jpg" class="card-img-top" alt="Coast to Coast trail: Walking one of England's most spectacular hikes after £5.5m upgrade">
                    <div class="card-body">
                      <h5 class="card-title">Coast to Coast trail: Walking one of England's most spectacular hikes after £5.5m upgrade</h5>
                      <p class="card-text">The long-distance Coast to Coast route which stretches across the Lake District, Yorkshire Dales and North York Moors is now an official National Trail.</p>
                      <a href="https://www.bbc.co.uk/news/articles/crm1zmj1y8no" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/a8a7/live/4ba1f300-2877-11f1-831a-89df8c4bf49f.jpg" class="card-img-top" alt="Parents should monitor children 24/7 on Roblox, says developer">
                    <div class="card-body">
                      <h5 class="card-title">Parents should monitor children 24/7 on Roblox, says developer</h5>
                      <p class="card-text">Roblox said safety was a top priority and it had advanced safeguards in place to keep users safe.</p>
                      <a href="https://www.bbc.co.uk/news/articles/cd6l07wwvlpo" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/dd23/live/f8eccb40-ef22-11f0-b1a3-cfac234d0717.jpg" class="card-img-top" alt="British forces preparing to board Russian shadow fleet ships in UK waters">
                    <div class="card-body">
                      <h5 class="card-title">British forces preparing to board Russian shadow fleet ships in UK waters</h5>
                      <p class="card-text">The move will "starve Putin's war machine", Starmer says as he arrives in Finland for a military summit.</p>
                      <a href="https://www.bbc.co.uk/news/articles/cvg0n9z3jlvo" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/bcd4/live/39d8fe60-2846-11f1-ac61-c943803d2ed3.jpg" class="card-img-top" alt="Harry Potter TV show trailer released: Everything we know so far">
                    <div class="card-body">
                      <h5 class="card-title">Harry Potter TV show trailer released: Everything we know so far</h5>
                      <p class="card-text">The HBO reboot, which is due in 2027, is a spin-off from the original books and the film franchise.</p>
                      <a href="https://www.bbc.co.uk/news/articles/cq6j20zp9n6o" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/a21d/live/fef5c380-1cdf-11f1-b4a6-b1a9fc5003ff.jpg" class="card-img-top" alt="Meta and Google found liable in social media addiction trial">
                    <div class="card-body">
                      <h5 class="card-title">Meta and Google found liable in social media addiction trial</h5>
                      <p class="card-text">The verdict marks the end of a five-week trial on the addictive nature of social media platforms.</p>
                      <a href="https://www.bbc.co.uk/news/articles/c747x7gz249o" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              </div>
    </div>

    <footer class="footer mt-auto">
      <div class="container text-center text-md-start">
        <div class="row">
          <div class="col-md-6 mb-3 mb-md-0">
            <h5 class="text-white">News App</h5>
            <p>Your one-stop destination for all trending news.</p>
          </div>
          <div class="col-md-3 mb-3">
            <h6>Quick Links</h6>
            <ul class="list-unstyled">
              <li><a href="#">Home</a></li>
              <li><a href="#">Top Headlines</a></li>
              <li><a href="#">Bitcoin News</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-3">
            <h6>Contact</h6>
            <ul class="list-unstyled">
              <li>Email: support@newsapp.com</li>
              <li>Phone: +1 234 567 8901</li>
            </ul>
          </div>
        </div>
        <hr class="my-3 border-light">
        <p class="text-center mb-0">
          © 2025 News App. All rights reserved.
        </p>
      </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
      const apiKey = "29ecaa96fb3b4ab6b826c3c780e4a93d";

      const showTopHeadlines = () => {
        const apiUrl = `https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=${apiKey}`;
        fetch(apiUrl)
          .then((response) => response.json())
          .then((data) => {
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = "";

            if (data.articles && data.articles.length) {
              data.articles.forEach((article) => {
                const newsCard = `
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="${article.urlToImage}" class="card-img-top" alt="${article.title}">
                    <div class="card-body">
                      <h5 class="card-title">${article.title}</h5>
                      <p class="card-text">${article.description}</p>
                      <a href="${article.url}" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              `;
                newsContainer.innerHTML += newsCard;
              });
            } else {
              newsContainer.innerHTML =
                '<p class="text-danger text-center">No news found.</p>';
            }
          })
          .catch((error) => {
            console.error("Failed to load news:", error);
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = `<p class="text-danger text-center">Failed to load news data.</p>`;
          });
      };

      const showBitcoinNews = () => {
        const apiUrl = `https://newsapi.org/v2/everything?q=bitcoin&apiKey=${apiKey}`;
        fetch(apiUrl)
          .then((response) => response.json())
          .then((data) => {
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = ""; // Clear previous results

            if (data.articles && data.articles.length) {
              data.articles.forEach((article) => {
                const newsCard = `
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="${article.urlToImage}" class="card-img-top" alt="${article.title}">
                    <div class="card-body">
                      <h5 class="card-title">${article.title}</h5>
                      <p class="card-text">${article.description}</p>
                      <a href="${article.url}" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              `;
                newsContainer.innerHTML += newsCard;
              });
            } else {
              newsContainer.innerHTML =
                '<p class="text-danger text-center">No bitcoin news found.</p>';
            }
          })
          .catch((error) => {
            console.error("Failed to load bitcoin news:", error);
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = `<p class="text-danger text-center">Failed to load bitcoin news data.</p>`;
          });
      };

      const searchNews = (event) => {
        event.preventDefault();

        const searchQuery = document.getElementById("searchInput").value;

        if (searchQuery.trim() === "") {
          alert("Please enter a search query.");
          return;
        }

        const apiUrl = `https://newsapi.org/v2/everything?q=${searchQuery}&apiKey=${apiKey}`;
        fetch(apiUrl)
          .then((response) => response.json())
          .then((data) => {
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = "";

            if (data.articles && data.articles.length) {
              data.articles.forEach((article) => {
                const newsCard = `
                <div class="col-md-4 mb-4 news-card">
                  <div class="card h-100 shadow-sm">
                    <img src="${article.urlToImage}" class="card-img-top" alt="${article.title}">
                    <div class="card-body">
                      <h5 class="card-title">${article.title}</h5>
                      <p class="card-text">${article.description}</p>
                      <a href="${article.url}" class="btn btn-primary" target="_blank">Read More</a>
                    </div>
                  </div>
                </div>
              `;
                newsContainer.innerHTML += newsCard;
              });
            } else {
              newsContainer.innerHTML =
                '<p class="text-danger text-center">No search results found.</p>';
            }
          })
          .catch((error) => {
            console.error("Failed to load search results:", error);
            const newsContainer = document.getElementById("content-container");
            newsContainer.innerHTML = `<p class="text-danger text-center">Failed to load search data.</p>`;
          });
      };

      showTopHeadlines();

      document
        .getElementById("showTopHeadlinesBtn")
        .addEventListener("click", (e) => {
          e.preventDefault();
          showTopHeadlines();
        });

      document
        .getElementById("showBitcoinNewsBtn")
        .addEventListener("click", (e) => {
          e.preventDefault();
          showBitcoinNews();
        });
    </script>
  

</body></html>
