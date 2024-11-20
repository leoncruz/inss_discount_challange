class Salary
  INSS_DISCOUNT_RANGES = [
    { limit: 1045.00, aliquot: 0.075 },
    { limit: 2089.60, aliquot: 0.09 },
    { limit: 3134.40, aliquot: 0.12 },
    { limit: 6101.06, aliquot: 0.14 }
  ].freeze

  def initialize(salary)
    @salary = salary
  end

  def discount
    discount_total = 0.0
    rest = @salary

    INSS_DISCOUNT_RANGES.each_with_index do |range, index|
      lower_limit = if index.zero?
        0
      else
        INSS_DISCOUNT_RANGES[index - 1][:limit]
      end

      value_range = [ range[:limit] - lower_limit, rest ].min

      discount_range = value_range * range[:aliquot]
      discount_total += discount_range

      rest -= value_range

      break if rest <= 0
    end

    discount_total.round(2)
  end
end
