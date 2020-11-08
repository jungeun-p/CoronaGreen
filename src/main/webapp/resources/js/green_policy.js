$(function() {
	policy();
	var array_title = new Array();
	var array_link = new Array();

	function policy() {
		$.ajax({
			type : "post",
			url : "resources/json/policy.json",
			data : "json",
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.policy.length; i++) {
					var link_url = data.policy[i].link.trim();
					if (i < 9) {
						$(".policy__module__wrap").append(
								"<div class='policy__module' onclick='origin(\""
										+ link_url + "\");'>"
										+ "<p class='module__name'>"
										+ data.policy[i].title + "</p>"
										+ "</div>");
					} else {
						array_title.push(data.policy[i].title);
						array_link.push(link_url);
					}
				}
				//console.log(array_title);
				//console.log(array_link);

			},
			error : function() {
				alert("실패");
			}
		})
	}

	var page = 0;
	var startNum = function() {
		return (page * 9 >= array_title.length) ? array_title.length - 1
				: page * 9;
	}
	var endNum = function() {
		return (startNum() + 8 >= array_title.length) ? array_title.length - 1
				: startNum() + 8;
	}

	$(window).scroll(function(){ // 스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
				if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1) {
					var start = startNum();
					var end = endNum();
					//console.log(start);
					//console.log(end);
					//console.log(page);
					if (start == array_title.length - 1) {
						return;
					} else {
						for (var i = start; i <= end; i++) {
							$(".policy__module__wrap").append(
									"<div class='policy__module' onclick='origin(\""
											+ array_link[i] + "\");'>"
											+ "<p class='module__name'>"
											+ array_title[i] + "</p>"
											+ "</div>");
						}
					}
					page++;
				}
			});

});

function origin(link_url) {
	window.open(link_url);
}