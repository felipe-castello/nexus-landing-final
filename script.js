function toggleMenu(){document.getElementById('nav').classList.toggle('open')}
document.querySelectorAll('a[href^="#"]').forEach(a=>a.addEventListener('click',()=>document.getElementById('nav').classList.remove('open')));
