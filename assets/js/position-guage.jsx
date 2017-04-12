import React from 'react';
import ReactDOM from 'react-dom';
import {Doughnut} from 'react-chartjs-2'

function PosisionGuage(props) {
  var data = {
      labels: [
          "Blue",
          "Yellow"
      ],
      datasets: [
          {
              data: [50, 100],
              backgroundColor: [
                  "#36A2EB",
                  "#FFCE56"
              ],
              hoverBackgroundColor: [
                  "#36A2EB",
                  "#FFCE56"
              ]
          }]
  }

  const options = {
    rotation: -Math.PI,
    circumference: Math.PI,
    legend: {
      display: false
    }
  }

  return (
    <div className="position-guage-container">
      <Doughnut data={data} options={options} />
    </div>
  )
}

export default PosisionGuage
