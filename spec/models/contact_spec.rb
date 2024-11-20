require "rails_helper"

RSpec.describe Contact, type: :model do
  describe "validations" do
    it { should validate_presence_of(:telephone) }

    context "when contact is a reference" do
      subject { build(:contact, reference: true) }

      it { is_expected.to validate_presence_of(:name) }
    end

    context "when contact is not a reference" do
      subject { build(:contact, reference: false) }

      it { is_expected.to_not validate_presence_of(:name) }
    end
  end
end
