// search icon
const search = document.querySelector("#find");
const search_form = document.querySelector("#search");

// menu icon
const burger = document.querySelector("#burger");
const menu = document.querySelector("#menu");

// search icon
search.addEventListener("click", (e) => {
    if (search_form.classList.contains("hidden")) {
        search_form.classList.remove("hidden");
    } else {
        search_form.classList.add("hidden");
    }
});

// menu icon
burger.addEventListener("click", (e) => {
    if (menu.classList.contains("hidden")) {
        menu.classList.remove("hidden");
    } else {
        menu.classList.add("hidden");
    }
});
