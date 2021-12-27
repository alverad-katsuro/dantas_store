const burgerIco = document.querySelector('#navbar-burger');
const navbarMenu = document.querySelector('#nav-links');


function hide_navbar(id) {
  id.classList.toggle('hidden');
  window.addEventListener('scroll', window.scrollTo(0,0));
}

burgerIco.addEventListener('click', function(){hide_navbar(navbarMenu)});
