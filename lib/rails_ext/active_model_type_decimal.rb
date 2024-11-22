module ActiveModel
  module Type
    class Decimal < Value
      private
        def cast_value(value)
          casted_value = \
            case value
            when ::Float
              convert_float_to_big_decimal(value)
            when ::Numeric
              BigDecimal(value, precision || BIGDECIMAL_PRECISION)
            when ::String
              begin
                # Original
                # value.to_d

                # Custom
                separator, delimiter = I18n.t([ :separator, :delimiter ], scope: "number.format")
                value.gsub(delimiter, "").gsub(separator, ".").to_d
              rescue ArgumentError
                BigDecimal(0)
              end
            else
              if value.respond_to?(:to_d)
                value.to_d
              else
                cast_value(value.to_s)
              end
            end

          apply_scale(casted_value)
        end
    end
  end
end
