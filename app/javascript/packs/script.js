// For all Toggles

// search icon
const search = document.querySelector("#find");
const search_form = document.querySelector("#search");

// menu icon
const burger = document.querySelector("#burger");
const menu = document.querySelector("#menu");

// my Account icon
const my_account = document.querySelector("#my_account");
const account_options = document.querySelector("#account_options");

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

// my account icon
my_account.addEventListener("click", (e) => {
    if (account_options.classList.contains("hidden")) {
        account_options.classList.remove("hidden");
    } else {
        account_options.classList.add("hidden");
    }
});
