/*======== 7. HORIZONTAL BAR CHART2 ========*/
var horBarChart2 = document.querySelector("#horizontal-bar-chart2");



if (horBarChart2 !== null) {
  var options = {
    chart: {
      height: 350,
      type: "bar",
      toolbar: {
        show: false,
      },
    },
    colors: ["#9e6de0", "#faafca"],
    plotOptions: {
      bar: {
        horizontal: true,
        barHeight: "50%",
        dataLabels: {
          position: "top",
        },
      },
    },
    legend: {
      show: true,
      position: "top",
      horizontalAlign: "right",
      markers: {
        width: 20,
        height: 5,
        radius: 0,
      },
    },
    dataLabels: {
      enabled: false,
    },
    stroke: {
      show: true,
      width: 1,
      colors: ["#fff"],
    },
    series: [
      {
        data: [2, 55],
      },
      {
        data: [53, 32],
      },
    ],
    xaxis: {
      categories: [],
    },
    tooltip: {
      theme: "dark",
      x: {
        show: false,
      },
      y: {
        title: {
          formatter: (seriesName) => "점수",
        },
      },
    },
  };
 
 
let test = '${loginUser.id}';
  
let grade = [{testTitle:'자바',testAvg:80}, {testTitle:'타입',testAvg:70}];
					
for (let i in grade){
	console.log(grade[i].testTitle);
	options.xaxis.categories.push(grade[i].testTitle);
}
  var chart = new ApexCharts(horBarChart2, options);

  chart.render();
}