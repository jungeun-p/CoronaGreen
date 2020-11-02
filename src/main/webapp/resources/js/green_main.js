function keyword(word) {
	var word = $(word).text();
	location.href = "keywordsearch.do?keyword=" + word;
}