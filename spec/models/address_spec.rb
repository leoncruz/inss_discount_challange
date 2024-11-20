require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:cep) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
  end
end
