'use strict';

let userBtn = document.querySelector('.menubar__sign');
let userMenu = document.querySelector('.menubar__user');
userBtn.addEventListener('mouseover', () => {
    if(userMenu.style.visibility==='hidden'){
        userMenu.style.visibility='visible';
        
    } else {
        userMenu.style.visibility='hidden';
    }
});