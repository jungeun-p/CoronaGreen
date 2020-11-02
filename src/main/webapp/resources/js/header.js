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
    
    /*var MouseEventObj = new Object();




    function addEvent(obj, evt, fn) {
        if (obj.addEventListener) {
            obj.addEventListener(evt, fn, false);
        }
        else if (obj.attachEvent) {
            obj.attachEvent("on" + evt, fn);
        }
    }



    addEvent(document, "mouseout", function(e) {
        e = e ? e : window.event;
        var from = e.relatedTarget || e.toElement;
        if(!from) {
            MouseEventObj.clientX = e.clientX;
            MouseEventObj.clientY = e.clientY;
        }
    });



    addEvent(document, "mouseover", function(e) {
        e = e ? e : window.event;
        var from = e.relatedTarget || e.toElement;
        if(from) {
            MouseEventObj.clientX = e.clientX;
            MouseEventObj.clientY = e.clientY;
        } 
    });




    window.onbeforeunload = function(e) {
     e = e ? e : window.event;
     if(e.clientX && e.clientY) {
         MouseEventObj.clientX = e.clientX;
         MouseEventObj.clientY = e.clientY;
     }
     
     if ((MouseEventObj.clientY <0) ||(e.altKey) ||(e.ctrlKey)||((MouseEventObj.clientY < 129) && (MouseEventObj.clientY>120))) {
     
      $.get( "logout1.do", function( data ) {
    	  alert(MouseEventObj.clientY);
     	 console.log(MouseEventObj);
      });
     } 
    }*/


    
