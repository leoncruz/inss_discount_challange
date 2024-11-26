class Salary
  include ActiveModel::Model
  include ActiveModel::Attributes

  INSS_DISCOUNT_RANGES = [
    { limit: 1045.00, aliquot: 0.075 },
    { limit: 2089.60, aliquot: 0.09 },
    { limit: 3134.40, aliquot: 0.12 },
    { limit: 6101.06, aliquot: 0.14 }
  ].freeze

  attribute :salary, :decimal

  def discount
    discount_total = 0.0
    rest = salary

    INSS_DISCOUNT_RANGES.each_with_index do |range, index|
      lower_limit = if index.zero?
        0
      else
        INSS_DISCOUNT_RANGES[index - 1][:limit]
      end

      value_range = [ (range[:limit] - lower_limit).floor(2), rest ].min

      discount_range = (value_range * range[:aliquot]).floor(2)
      discount_total = (discount_total + discount_range).floor(2)

      rest = (rest - value_range).floor(2)

      break if rest <= 0
    end

    discount_total.floor(2)
  end

  # Retorna a faixa de aliquota em que o salário se encontra
  # Podendo ser:
  # 1: até 1045.00
  # 2: até 2089.60
  # 3: até 3134.50
  # 4: até 6101.06
  # Se o valor do salário for superior a faixa 4, será retornado 4.
  def aliquot_range
    limits = INSS_DISCOUNT_RANGES.pluck(:limit)

    ranges = limits.map.with_index do |limit, index|
      start = index.zero? ? 0 : (limits[index-1] + 0.1)

      start..limit
    end

    range = ranges.find_index { |range| range.cover?(salary) }

    { 0 => 1, 1 => 2, 2 => 3, 3 => 4, nil => 4 }[range]
  end
end
