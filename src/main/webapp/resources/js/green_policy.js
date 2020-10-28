$(function(){
	policy();
});


function policy() {
	$.ajax({
		type: "post",
		url: "resources/json/policy.json",
		data: "json",
		contentType: "application/json",
		dataType: "json",
		success: function(data) {
			for (var i = 0; i < data.policy.length; i++) {
				var link_url = data.policy[i].link.trim();
				console.log(link_url);
				$(".policy__module__wrap").append(
						"<div class='policy__module' onclick='origin(\"" + link_url + "\");'>" +
						"<p class='module__name'>" + data.policy[i].title + "</p>" +
						"</div>"
				);
			}
			
		},
		error: function() {
		alert("실패");
		} 
	})
}

function origin(link_url) {
	window.open(link_url);
}