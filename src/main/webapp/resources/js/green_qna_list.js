/**
 * http://usejsdoc.org/
 */

$(document).ready(function(){
	$(".qnalist__section__frequent__title").on('click',function(){
		  $(this).next(".qnalist__section__frequent__content").slideToggle(100);
		});
});