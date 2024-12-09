document.addEventListener("DOMContentLoaded", () => {
  const isLoggedIn = false; // true: 로그인, false: 비로그인

  console.log("로그인 상태:", isLoggedIn);

  const loggedInElements = document.querySelectorAll(".logged-in");
  const loggedOutElements = document.querySelectorAll(".logged-out");

  if (isLoggedIn) {
    loggedInElements.forEach((el) => el.classList.remove("d-none"));
    loggedOutElements.forEach((el) => el.classList.add("d-none"));
  } else {
    loggedInElements.forEach((el) => el.classList.add("d-none"));
    loggedOutElements.forEach((el) => el.classList.remove("d-none"));
  }
});
