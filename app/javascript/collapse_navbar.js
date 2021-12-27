console.log('hello')
const burgerIco = document.querySelector('#navbar-burger');
const navbarMenu = document.querySelector('#nav-links');



burgerIco.addEventListener('click', () => {
  alert("asad");
  navbarMenu.classList.toggle('hidden');
  window.addEventListener('scroll', window.scrollTo(0,0));
});

