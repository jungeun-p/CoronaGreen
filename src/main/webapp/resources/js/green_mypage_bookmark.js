
function bookmarkDel(del, id) {
	var link = $(del).parent().prev().children().children().children('input').val();
	var id = id;
	console.log(id + " " + link);
	$.ajax({
		url: "bookmarkdelete.do?id=" + id + "&link=" + encodeURIComponent(link),
		type: "get",
		success: function(data) {
			if (data == "SUCCESS") {
				$(del).parent().parent().remove();
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