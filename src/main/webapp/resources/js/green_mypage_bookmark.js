
function bookmarkDel(del, id) {
	var link = $(del).parent().next().children().children().children('input').val();
	var id = id;
	
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