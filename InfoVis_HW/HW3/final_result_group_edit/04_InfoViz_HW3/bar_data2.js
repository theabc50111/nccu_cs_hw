function racingBarChart(){
    var svg=d3.selectAll("#david_dataviz")
        .append("svg");

    d3.json("./data_HW3.json")
        .then(function(data){
            //console.log(data['q1'][0]['item'])
            
        var myQuestionList =[
            {question:"q1",
            content:"常使用的申訴管道？" },
            {question:"q2",
            content:"新聞申訴管道可近度？" },
            {question:"q3",
            content:"新聞申訴管道方便與否？" },
            {question:"q4",
            content:"新聞申訴管道的效用度？" },
            {question:"q5",
            content:"最需要自律的新聞媒體？" },
            {question:"q6",
            content:"是否知道各家新聞臺或平面媒體有新聞自律機制？" },
            {question:"q7",
            content:"是否認為媒體新聞自律機制有助於改善媒體亂象？" }
        ];
        
        console.log(myQuestionList[0].content);

        svg
            .attr("width", width+500)
            .attr("height",height+100)
            .attr('viewBox', [-180, -100, width, height+100]);

        data2 = rankData(data['q1'])

        var xScale = d3.scaleLinear()
            .domain([0, d3.max(data2, d=>d.value)])
            .range([0, width]);

        const yScale = d3.scaleBand()
            .paddingOuter(0.1)
            .paddingInner(0.1)
            .domain(data2.map((d,i)=>d.rank))
            .range([0,height]);
        
        var myDomain=[]
        for (var i=0; i<data2.length; i++){
            myDomain.push(data2[i].item)
        }
        const colorScale = d3.scaleOrdinal(d3.schemeTableau10)
            .domain(myDomain);
        
        

        /* xAxis */
        //console.log(height)
        var xAxis = d3.axisTop().scale(xScale)
            .tickFormat(function(d) { return d + '%'; })
        svg
            .append("g")
            .attr("class", "xAxis")
            .attr("transform", `translate(0, 0)`)
            .transition()
            .duration(1000)
            .ease(d3.easeLinear)
            .call(xAxis)
            .selectAll("text")
            .style("font-size", "15px")
            .style("text-anchor", "end")
            .style('font-weight', 'bold');
        
        svg
            .append("text")
            .attr("class", "x label")
            .attr("text-anchor", "end")
            .attr("x", width)
            .attr("y", -30)
            .style("font-size", "20px")
            .text("百分比")
            .attr("font-weight",900)
            .attr("fill", 'blue')
            .style("stroke", 'green')
		    .style("stroke-width", 0.5);

        /* yAxis */
        var yAxis = d3.axisLeft().scale(yScale)
            .tickFormat(function(i) { return data2[i-1].item; })            
        svg
            .append("g")
            .attr("class", "yAxis")
            .attr("transform", `translate(-10, 0)`)            
            .transition()
            .duration(1000)
            .ease(d3.easeLinear)
            .call(yAxis)
            .selectAll("text")
            .style("font-size", "20px")
            .style("text-anchor", "end")
            .style('font-weight', 'bold');  

        svg
            .append("text")
            .attr("class", "x label")
            .attr("text-anchor", "end")
            .attr("x", -100)
            .attr("y", 20)
            .style("font-size", "20px")            
            .text("問卷選項")
            .attr("font-weight",900)
            .attr("fill", 'blue')
            .style("stroke", 'green')
		    .style("stroke-width", 0.5);

        /* racing bar */
        svg
            .selectAll("rect")
            .data(data2, d=>d.item)          
            .join("rect")
            .attr("x",xScale(0))
            .attr("height", yScale.bandwidth())
            .attr("fill",d => colorScale(d.item))
            .transition()
            .ease(d3.easeLinear)
            .duration(1000)
            .attr("y", (d) => yScale(d.rank))
            .attr("width", d => xScale(d.value)-xScale(0))
            .attr('class','rectangle');

        svg
            .selectAll("rect")
            .append("title")
            .text(function(d) {
                return d.value + '%';
            });

        function update(data2) {
            var xScale = d3.scaleLinear()
                .domain([0, d3.max(data2, d=>d.value)])
                .range([0, width]);

            const yScale = d3.scaleBand()
                .paddingOuter(0.1)
                .paddingInner(0.1)
                .domain(data2.map((d,i)=>d.rank))
                .range([0,height]);

            var myDomain=[]
            for (var i=0; i<data2.length; i++){
                myDomain.push(data2[i].item)
            }
            const colorScale = d3.scaleOrdinal(d3.schemeTableau10)
                .domain(myDomain);

            /* xAxis */
            var xAxis = d3.axisTop().scale(xScale)
                .tickFormat(function(d) { return d + '%'; });

            /* yAxis */
            var yAxis = d3.axisLeft().scale(yScale)
                .tickFormat(function(i) { return data2[i-1].item; })             

            /* racing bar */
            svg
                .selectAll("rect")
                .data(data2, d=>d.item)
                .join("rect")
                .attr('class', 'rectangle')
                .attr("x",xScale(0))
                .attr("height", yScale.bandwidth())
                .attr("fill",d => colorScale(d.item))
                .transition()
                .ease(d3.easeLinear)
                .duration(1000)
                .attr("y", (d) => yScale(d.rank))
                .attr("width", d => xScale(d.value)-xScale(0))
                .attr('class','rectangle');

            svg
                .selectAll("rect")
                .append("title")
                .text(function(d) {
                    return d.value + '%';
                });
 
                
            svg
                .selectAll(".xAxis")
                .transition()
                .duration(1000)
                .ease(d3.easeLinear)
                .call(xAxis)
                .selectAll("text")
                .style("font-size", "15px")
                .style("text-anchor", "end");

            svg
                .selectAll(".yAxis")
                .transition()
                .duration(1000)
                .ease(d3.easeLinear)
                .call(yAxis)
                .selectAll("text")
                .style("font-size", "20px")
                .style("text-anchor", "end")
                .style('font-weight', 'bold'); 
        }  

        function rankData(data){
            const sortUpdatedData = data.sort((a,b)=>b.value-a.value);
            const addRankDataset= sortUpdatedData.map((d,i)=>{
                return {...d,rank:i+1};
            });
            return addRankDataset;
        }
        
        var count=1;
        var myQuestion=['q1','q2','q3','q4','q5','q6','q7']

        d3.select("button#dataviz_buttonTriger").on("click", () => {
            let myWhich = count % 7;
            count += 1;
            data2 = rankData(data[myQuestion[myWhich]])
            document.getElementById('myQuestion').innerHTML = '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' + 
                '問卷題目：' + '<span class="text_blue">' + myQuestionList[myWhich].content + '</span>';
                
            document.getElementById("png").src="./png/q" + (myWhich+1) +".png";
            update(data2)
        })
        
        d3.select("button#dataviz_buttonTriger_auto").on("click", () => {
            let i = 1, j = myQuestion.length+1;
            console.log(i)            
            function myLoop(){
                let myWhich = i % 7;
                
                setTimeout(()=>{
                    data2 = rankData(data[myQuestion[myWhich]])
                    document.getElementById('myQuestion').innerHTML = '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' + 
                        '問卷題目：' + '<span class="text_blue">' + myQuestionList[myWhich].content + '</span>';
                
                    document.getElementById("png").src="./png/q" + (myWhich+1) +".png";
                    update(data2)

                    i += 1;
                    if (i< j){
                        myLoop(i);
                    } 
                },2000)
            }
            myLoop()
        })
    })       
}