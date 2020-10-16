/**
 * http://usejsdoc.org/
 */
$(document).ready(function(){	

    $('.header_left').mouseover(function(){
        $('.nav').slideDown();  
        $('.nav_back').slideDown(); 
    });
    
    $('.nav').mouseleave(function(){
        $('.nav').slideUp();  
        $('.nav_back').slideUp();  
    });

 });