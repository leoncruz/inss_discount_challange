require "rails_helper"

RSpec.describe Salary do
  describe "#discount" do
    it "calculates INSS discount for a salary of R$ 1,000.00" do
      salary = Salary.new(1000.00)

      expect(salary.discount).to eq(75.0) # 1000 * 0.075
    end

    it "calculates INSS discount for a salary of R$ 1,500.00" do
      salary = Salary.new(1500.00)

      expected_discount = (1045.00 * 0.075) + ((1500.00 - 1045.00) * 0.09)

      expect(salary.discount).to eq(expected_discount.round(2))
    end

    it "calculates INSS discount for a salary of R$ 3,000.00" do
      salary = Salary.new(3000.00)

      expected_discount = (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3000.00 - 2089.60) * 0.12)

      expect(salary.discount).to eq(expected_discount.round(2))
    end

    it "calculates INSS discount for a salary of R$ 6,000.00" do
      salary = Salary.new(6000.00)

      expected_discount = (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3134.40 - 2089.60) * 0.12) + ((6000.00 - 3134.40) * 0.14)

      expect(salary.discount).to eq(expected_discount.round(2))
    end

    it "calculates INSS discount for a salary above the ceiling (R$ 7,000.00)" do
      salary = Salary.new(7000.00)

      expected_discount = (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3134.40 - 2089.60) * 0.12) + ((6101.06 - 3134.40) * 0.14)

      expect(salary.discount).to eq(expected_discount.round(2))
    end
  end
end
