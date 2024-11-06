const swiper = new Swiper(".slider-wrapper", {
  // Optional parameters
  loop: " true",
  grabCursor: true,
  spaceBetween: true,
  direction: "horizontal",

  // If we need pagination
  pagination: {
    el: ".swiper-pagination",
  },

  // Navigation arrows
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },

  breakpoints: {
    0: {
      slidesPerView: 4,
    },

    620: {
      slidesPerView: 2,
    },

    1024: {
      slidesPerView: 3,
    },
  },
});
