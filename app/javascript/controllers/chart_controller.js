import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ["chart"]

  static values = {
    labels: Array,
    chartLabels: Object
  }

  connect() {
    this.chart = new Chart(this.chartTarget, {
      type: "bar",
      data: {
        labels: this.labelsValue,
        datasets: [
          {
            label: "Qtd. Proponentes por alíquota",
            backgroundColor: "#0d6efd",
            data: [this.chartLabelsValue["1"], this.chartLabelsValue["2"], this.chartLabelsValue["3"], this.chartLabelsValue["4"]]
          },
        ]
      }
    })
  }
}
