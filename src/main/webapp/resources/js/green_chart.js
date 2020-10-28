 const svg = d3
        .select(".canvas")
        .append("svg")
        .attr("width", 600)
        .attr("height", 600);

    const margin = { top: 60, right: 20, bottom: 60, left: 100 };
    const graphWidth = 600 - margin.left - margin.right;
    const graphHeight = 600 - margin.top - margin.bottom;

    const graph = svg
        .append("g")
        .attr("width", graphWidth)
        .attr("height", graphHeight)
        .attr("transform", `translate(${margin.left}, ${margin.top})`);

    const xAxisGroup = graph
        .append("g")
        .attr("transform", `translate(0, ${graphHeight})`);
    const yAxisGroup = graph.append("g");

    d3.json("resources/json/menu.json", function (data) {
        const rects = graph.selectAll("rect")
            .data(data);

        const y = d3
            .scaleLinear() // 한계치 설정
            .domain([0, d3.max(data, d => d.persons)])
            .range([graphHeight, 0]);

        const min = d3.min(data, d => d.persons); //가장 작은 수 반환
        const max = d3.max(data, d => d.persons); //가장 큰 수 반환
        const extent = d3.extent(data, d => d.persons); //[min, max] 반환

        const x = d3
            .scaleBand()
            .domain(data.map(item => item.date))//data 이름 설정
            .range([0, 500])
            .paddingInner(0.6)
            .paddingOuter(0.6)

        rects
            .attr("width", x.badnwidth)
            .attr("height", d => graphHeight - y(d.persons)) // data의 persons값 적용
            .attr("fill", "#53e4be")
            .attr("x", d => x(d.date)) // data index값 * 70
            .attr("y", d => y(d.persons));

        //반환되지 못한 나머지 data 가상 DOM으로 생성
        rects
            .enter()
            .append("rect")
            .attr("width", x.bandwidth)
            .attr("height", d => graphHeight - y(d.persons))
            .attr("fill", "#53e4be")
            .attr("x", d => x(d.date))
            .attr("y", graphHeight)
            .transition().duration(900)
            .attr("y", d => y(d.persons)) // 뒤집기!!
            .attr("height", d => graphHeight - y(d.persons));

        // x축 y축(axis)생성
        const xAxis = d3.axisBottom(x);
        const yAxis = d3
            .axisLeft(y)
            .ticks(3) //ticks는 y축 눈금 갯수
            .tickFormat(d => d + " persons");

        //축 적용
        xAxisGroup.call(xAxis);
        yAxisGroup.call(yAxis);

        xAxisGroup
            .selectAll("text") //x축 눈금 값. text 선택
            .attr("transform", "rotate(-40)")
            .attr("text-anchor", "end")
            .attr("fill", "black");
    })
