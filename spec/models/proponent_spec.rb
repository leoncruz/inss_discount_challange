require "rails_helper"

RSpec.describe Proponent, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:cpf) }
    it { should allow_value("11111111111").for(:cpf) }
    it { should_not allow_value("1").for(:cpf) }
    it { should_not allow_value("Abcd123").for(:cpf) }
    it { should_not allow_value("2222222222222222222").for(:cpf) }

    it { should validate_presence_of(:birth_date) }
    it { should validate_comparison_of(:birth_date).is_less_than(Date.today) }

    it { should validate_presence_of(:salary) }
    it { should validate_numericality_of(:salary).is_greater_than(0) }
  end
end
