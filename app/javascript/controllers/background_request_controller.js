import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="background-request"
export default class extends Controller {
  static targets = ["input"]

  static values = {
    url: String
  }

  async makeRequest(event) {
    this.inputTarget.setAttribute("value", "Calculando...")

    const salary = event.currentTarget.value

    const url = new URL(this.urlValue)
    url.searchParams.append("salary", salary)

    const request = new FetchRequest('get', url)

    const response = await request.perform()

    if (response.ok) {
      const body = await response.json

      const value = new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" }).format(body.discount)

      this.inputTarget.setAttribute("value", value)
    } else {
      this.inputTarget.setAttribute("value", "")
      alert("Falha ao caluclar o desconto")
    }
  }
}
