async function loadNews() {

    const res = await fetch("/api/news.php");
    const data = await res.json();

    const container = document.getElementById("news");
    container.innerHTML = "";

    data.forEach(item => {
        container.innerHTML += `
            <div class="card">
                <h2>${item.title}</h2>
                <p>${item.text}</p>
            </div>
        `;
    });
}

loadNews();
