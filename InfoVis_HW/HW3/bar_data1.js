
        // set the dimensions and margins of the graph
        const margin = { top: 50, right: 150, bottom: 200, left: 300 },
            width = 1000 - margin.left - margin.right,
            height = 800 - margin.top - margin.bottom;

        // append the svg object to the body of the page
        const svg = d3.select("#my_dataviz")
            .append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", `translate(${margin.left}, ${margin.top})`);

        let colors = d3.scaleOrdinal(d3.schemeCategory10);

        // Parse the Data
        d3.csv("./bar_data1.csv").then(function (data) {

            // sort data by its value
            data.sort(function (a, b) {
                return d3.descending(parseInt(a.value), parseInt(b.value));
            })

            // Add X axis
            const x = d3.scaleLinear()
                .domain([0, 30])
                .range([0, width]);
            svg.append("g")
                .attr("transform", `translate(0, ${height})`)
                .call(d3.axisBottom(x))
                .selectAll("text")
                .style("font-size", "15px")
                .style("text-anchor", "end");
            svg.append("text")
                .attr("class", "x label")
                .attr("text-anchor", "end")
                .attr("x", width + 100)
                .attr("y", height - 6)
                .style("font-size", "20px")
                .text("投票次數總計");

            // Y axis
            const y = d3.scaleBand()
                .range([0, height])
                .domain(data.map(d => d.item))
                .padding(.1);
            svg.append("g")
                .call(d3.axisLeft(y))
                .selectAll("text")
                .attr("transform", "translate(-10,0)rotate(-45)")
                .style("font-size", "15px")
                .style("text-anchor", "end");
            svg.append("text")
                .attr("class", "x label")
                .attr("text-anchor", "end")
                .attr("x", 0)
                .attr("y", -10)
                .style("font-size", "20px")
                .text("兒少議題");

            //Bars
            svg.selectAll("myRect")
                .data(data)
                .join("rect")
                .attr("x", x(0))
                .attr("y", d => y(d.item))
                .attr("width", d => x(d.value))
                .attr("height", y.bandwidth())
                .attr("fill", (d, i) => { return colors('0.' + i) })


            svg.selectAll('myRect_text')
                .data(data)
                .join("text")
                .attr("class", "barnum")
                .attr('font-size', '20px')
                .attr("x", d => x(d.value) + 10)
                .attr("y", d => y(d.item) + 50)
                .attr("dy", "-0.5em")
                .text(d => d.value)


        })