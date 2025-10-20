// script.js - comportamiento mínimo: marcar la ruta activa si coincide
(function(){
  // Añadir clase active al enlace que coincide con el URL actual
  try{
    const links = document.querySelectorAll('.main-nav .nav-link');
    links.forEach(a=>{
      const href = a.getAttribute('href');
      if(!href) return;
      const current = window.location.pathname.split('/').pop();
      if(current === '' && href === 'index.html') a.classList.add('active');
      if(current === href) a.classList.add('active');
    });
  }catch(e){console.warn(e)}
})();