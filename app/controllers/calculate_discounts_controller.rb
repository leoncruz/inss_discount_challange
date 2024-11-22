class CalculateDiscountsController < ApplicationController
  def index
    @salary = Salary.new(calculate_params)

    render json: { discount: @salary.discount }
  end

  private

  def calculate_params
    params.permit(:salary)
  end
end
