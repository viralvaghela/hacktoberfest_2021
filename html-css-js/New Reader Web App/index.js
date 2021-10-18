// api key = 02f26e29b65645c5926530f18dd0406a
// url = https://newsapi.org/v2/top-headlines?country=in&apiKey=02f26e29b65645c5926530f18dd0406a


//For India
const xhr = new XMLHttpRequest();

xhr.open('GET', 'https://newsapi.org/v2/top-headlines?country=in&apiKey=02f26e29b65645c5926530f18dd0406a', true);
xhr.getResponseHeader('Content-type', 'application/json');

xhr.onload = function () {
    if (this.status === 200) {
        let html = ``;
        let section = document.createElement('div');
        section.className = 'newsDiv';

        let obj = JSON.parse(this.responseText);
        console.log(obj.articles);
        let articles = obj.articles;
        articles.forEach(article => {
            if (article.author == null) { article.author = 'Anonymous'; }
            html += `<article class="news-container">
                 <a href="${article.url}" class="thumbnail" target="__blank">
                       <img class="thumbnail-image" src="${article.urlToImage}" alt="Click to read More">
                    </a>
                    <div class="news-bottom-section">
                    <div class="news-details">
                        <a href="#" class="news-title">${article.title}</a>
                        <a href="#" class="news-source-name">${article.author}</a>
                        <div class="news-meta">
                            <span>Published at - ${article.publishedAt}</span>
                        </div>
                    </div>
                </div>
            </article>`
        });
        section.innerHTML = html;
        let lastChild = document.getElementById('news').lastElementChild;
        document.getElementById('news').replaceChild(section, lastChild);
    }
    else {
        console.log('Unknow Error occured');
    }
}

xhr.send();


//For America
function usNews() {

    const xhr = new XMLHttpRequest();

    xhr.open('GET', 'https://newsapi.org/v2/top-headlines?country=us&apiKey=02f26e29b65645c5926530f18dd0406a', true);
    xhr.getResponseHeader('Content-type', 'application/json');

    xhr.onload = function () {
        if (this.status === 200) {
            let html = ``;
            let section = document.createElement('div');
            section.className = 'newsDiv';

            let obj = JSON.parse(this.responseText);
            console.log(obj.articles);
            let articles = obj.articles;
            articles.forEach(article => {
                if (article.author == null) { article.author = 'Anonymous'; }
                html += `<article class="news-container">
                 <a href="${article.url}" class="thumbnail" target="__blank">
                       <img class="thumbnail-image" src="${article.urlToImage}" alt="Click to read More">
                    </a>
                    <div class="news-bottom-section">
                    <div class="news-details">
                        <a href="${article.url}" class="news-title" target="__blank">${article.title}</a>
                        <a href="${article.url}" class="news-source-name" target="__blank">${article.author}</a>
                        <div class="news-meta">
                            <span>Published at - ${article.publishedAt}</span>
                        </div>
                    </div>
                </div>
            </article>`
            });
            section.innerHTML = html;
            let lastChild = document.getElementById('news').lastElementChild;
            document.getElementById('news').replaceChild(section, lastChild);
        }
        else {
            console.log('Unknow Error occured');
        }

    }

    xhr.send();
}


//NAVBAR FUNCTIONALITIES
function myFunction(x) {
    x.classList.toggle("change");
    // let navbarUl = document.querySelector('.navbar-nav');
    let navbar = document.querySelector('.navbar');
    let header = document.getElementById('header');
    header.classList.toggle("sticky");
    navbar.classList.toggle("show");
    console.log(navbar.classList);
}

window.addEventListener("scroll", function (e) {
    let header = document.getElementById('header');
    header.classList.toggle("sticky", window.scrollY > 0);
});

