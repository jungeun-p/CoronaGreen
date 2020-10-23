'use strict';

let userBtn = document.querySelector('.menubar__sign');
let userMenu = document.querySelector('.menubar__user');
let menuPar = document.querySelector('.menubar__user__menu');

menuPar.addEventListener('mouseover', () => {
	userMenu.style.visibility = 'visible';
})
menuPar.addEventListener('mouseout', () => {
	userMenu.style.visibility = 'hidden';
})