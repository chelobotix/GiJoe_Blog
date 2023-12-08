const menuButton = document.getElementById("menu-button")
const dropdownMenu = document.getElementById("dropdown-menu")

menuButton.addEventListener("click", () => {
  dropdownMenu.classList.toggle("hidden")
})

document.addEventListener("click", function (event) {
  if (!dropdownMenu.contains(event.target) && !menuButton.contains(event.target)) {
    dropdownMenu.classList.add("hidden")
  }
})
