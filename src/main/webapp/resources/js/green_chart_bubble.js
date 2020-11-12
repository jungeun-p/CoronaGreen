const diameter = 450, //max size of the bubbles
    format = d3.format(",d"),
    //color = d3.scaleOrdinal(d3.schemeCategory10);
    bubblecolor = ['#75ccb9', '#53e4be', '#14cba8', '#00bfa5', '#a7ffeb'];
//more color options: https://github.com/d3/d3-scale-chromatic

const bubble = d3.pack()
    .size([diameter, diameter])
    .padding(1.5);

const svg2 = d3.select("#svg2")
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble");

const simulation = d3.forceSimulation()
    .force("charge", d3.forceManyBody().strength(-20));

//json file을 불러오는 방법 
d3.json("resources/json/corona_patient_total.json", function (data) {

    //convert numerical values from strings to numbers
    data = data.map(function (d) { d.value = +d["num"]; return d; });

    //Sets up a hierarchy of data object
    const root = d3.hierarchy({ children: data })
        .sum(function (d) { return d.value; })
        .sort(function (a, b) { return b.value - a.value; });

    //Once we have hierarchal data, run bubble generator
    bubble(root);

    //setup the chart
    const bubbles = svg2.selectAll(".bubble")
        .data(root.children)
        .enter();

    //create the bubbles
    bubbles.append("circle")
        .attr("class", "circle")
        .attr("r", function (d) { return d.r * 1.1; })
        .attr("cx", function (d) { return d.x; })
        .attr("cy", function (d) { return d.y; })
        .style("fill", (d, i) => { return bubblecolor[i] })
        .attr("");

    //format the text for each bubble
    bubbles.append("text")
        .attr("x", function (d) { return d.x; })
        .attr("y", function (d) { return d.y + 5; })
        .attr("text-anchor", "middle")
        .text(function (d) { return d.data["title"]; })
        .style("fill", "#eeeeee")
        .style("font-family", "Helvetica Neue, Helvetica, Arial, san-serif")
        .style("font-size", "24px");

    bubbles.append("text")
        .attr("x", function (d) { return d.x; })
        .attr("y", function (d) { return d.y + 35; })
        .attr("text-anchor", "middle")
        .text(function (d) { return d.data["num"]; })
        .style("fill", "white")
        .style("font-family", "Helvetica Neue, Helvetica, Arial, san-serif")
        .style("font-size", "28px");
});
