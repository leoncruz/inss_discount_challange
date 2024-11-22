require "rails_helper"

RSpec.describe Salary do
  describe "#discount" do
    it "calculates INSS discount for a salary of R$ 1,000.00" do
      salary = Salary.new(salary: 1000.00)

      expect(salary.discount).to eq(75.0) # 1000 * 0.075
    end

    it "calculates INSS discount for a salary of R$ 1,500.00" do
      salary = Salary.new(salary: 1500.00)

      expect(salary.discount).to eq(119.32) # (1045.00 * 0.075) + ((1500.00 - 1045.00) * 0.09)
    end

    it "calculates INSS discount for a salary of R$ 3,000.00" do
      salary = Salary.new(salary: 3000.00)

      expect(salary.discount).to eq(281.62) # (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3000.00 - 2089.60) * 0.12)
    end

    it "calculates INSS discount for a salary of R$ 6,000.00" do
      salary = Salary.new(salary: 6000.00)

      expect(salary.discount).to eq(698.93) # (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3134.40 - 2089.60) * 0.12) + ((6000.00 - 3134.40) * 0.14)
    end

    it "calculates INSS discount for a salary above the ceiling (R$ 7,000.00)" do
      salary = Salary.new(salary: 7000.00)

      expect(salary.discount).to eq(713.08) # (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3134.40 - 2089.60) * 0.12) + ((6101.06 - 3134.40) * 0.14)
    end
  end
end
