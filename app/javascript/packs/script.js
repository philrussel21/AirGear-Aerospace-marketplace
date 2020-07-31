const search = document.querySelector("#find");
const search_form = document.querySelector("#search");

search.addEventListener("click", (e) => {
    if (search_form.classList.contains("hidden")) {
        search_form.classList.remove("hidden");
    } else {
        search_form.classList.add("hidden");
    }
});
