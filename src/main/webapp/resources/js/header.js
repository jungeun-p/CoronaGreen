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
    
    /*function adminpage() {
    	var obj1 = document.getElementById('role').value;
    	
    	alert(obj1);
    	
    	var form = document.createElement("form");
    	form.setAttribute("charset", "UTF-8");
    	form.setAttribute("method", "Post"); // Get 또는 Post 입력
    	//form.setAttribute("action", "/boot");
    	form.setAttribute("action", "http://3.35.112.5:8081");
    	
    	var hiddenField = document.createElement("input");
    	hiddenField.setAttribute("type", "hidden");
    	hiddenField.setAttribute("name", "role");
    	hiddenField.setAttribute("value", obj1);
    	form.appendChild(hiddenField);
    	
    	document.body.appendChild(form);
    	
    	form.submit();
    }*/
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


    
