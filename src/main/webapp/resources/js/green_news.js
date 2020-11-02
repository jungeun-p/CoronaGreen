'use strict';

    const contents = document.querySelectorAll('.news__section1__content');

    contents.forEach((con) => {
        let heart = con.childNodes[3];
        con.addEventListener('mouseover', (event) => {
            heart.style.visibility = 'visible';
        })
        con.addEventListener('mouseout', (event) => {
            heart.style.visibility = 'hidden';
        })
    })