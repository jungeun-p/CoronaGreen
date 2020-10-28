'use strict';

    const userBtn = document.querySelector('.menubar__sign');
    const userMenu = document.querySelector('.menubar__user');
    const menuPar = document.querySelector('.menubar__user__menu');

    menuPar.addEventListener('mouseover', () => {
        userMenu.style.visibility = 'visible';
    })
    menuPar.addEventListener('mouseout', () => {
        userMenu.style.visibility = 'hidden';
    })
    
function donation() {
    	location.href="donationform.do";
    }
    
