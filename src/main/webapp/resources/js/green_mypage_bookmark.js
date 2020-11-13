
function bookmarkDel(del, id) {
	var link = $(del).parent().prev().children().children().children('input').val();
	var id = id;
	$.ajax({
		url: "bookmarkdelete.do?id=" + id + "&link=" + encodeURIComponent(link),
		type: "get",
		success: function(data) {
			if (data == "SUCCESS") {
				$(del).parent().parent().remove();
				//console.log("태그네임" + $("#bookmark__del").prop('tagName'));
				if ($("#bookmark__del").prop('tagName') == undefined) {
					$(".news__section1__news__section").append("<div class='book__mark__check'><p>NO BOOKMARK</p></div>");
				}
			} else {
				alert("삭제 실패");
			}
		},error: function() {
			alert("실패");
		}
	})
}


	/*$.ajax({
		url: "bookmarklist.do",
		type: "get",
		success: function(data) {
			var list = "${list}";
			alert(list);
		}, error: function(data) {
			alert("실패!");
		}
	})*/


function origin(url) {
	window.open(url);
}