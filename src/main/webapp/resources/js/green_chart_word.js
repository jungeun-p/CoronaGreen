 // List of words
    // set the dimensions and margins of the graph
    var mar = { top: 30, right: 30, bottom: 30, left: 30 },
        width = 1200 - mar.left - mar.right,
        height = 800 - mar.top - mar.bottom,
        color = ["#819ca9", "#b0bec5", "#808e95", "#efebe9", "#f5f5f5", "#819ca9", "#546e7a", "#cfd8dc", "#9ea7aa", "#e0e0e0", "#e2f1f8", "#8d8d8d"];
    // append the svg object to the body of the page
    var svg = d3.select("#cloud").append("svg")
        .attr("width", width + mar.left + mar.right)
        .attr("height", height + mar.top + mar.bottom)
        .append("g")
        .attr("transform",
            "translate(" + mar.left + "," + mar.top + ")");

    d3.json("resources/json/corona_wordcloud.json", function (data) {
        // console.log(data);
        // Constructs a new cloud layout instance. It run an algorithm to find the position of words that suits your requirements
        // Wordcloud features that are different from one word to the other must be here

        // This function takes the output of 'layout' above and draw the words
        // Wordcloud features that are THE SAME from one word to the other can be here

        var layout = d3.layout.cloud()
            .size([width, height])
            .words(data.map(function (d) { return { text: d.name, size: d.value }; }))
            .padding(4) //space between words
            .rotate(function () { return ~~(Math.random() * 2) * 90; })
            .fontSize(function (d) { return d.size; })      // font size of words
            .on("end", draw);
        layout.start();

        function draw(words) {
            svg.append("g")
                .attr("transform", "translate(" + layout.size()[0] / 2 + "," + layout.size()[1] / 2 + ")")
                .selectAll("text")
                .data(words)
                .enter().append("text")
                .style("font-size", function (d) { return d.size; })
                .style("fill", (d, i) => { return color[i] })
                .attr("text-anchor", "middle")
                .style("font-family", "NEXON Lv1 Gothic OTF")
                //href
                .on("click", function (d) { return location.href = "keywordsearch.do?keyword=" + d.text; }) //d.text = value
                .style("cursor", "pointer")
                .attr("transform", function (d) {
                    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
                })
                .text(function (d) { return d.text; });

        }
    })