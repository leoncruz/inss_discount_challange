FactoryBot.define do
  factory :address do
    street { "MyString" }
    number { "MyString" }
    neighborhood { "MyString" }
    city { "MyString" }
    state { "MyString" }
    cep { "MyString" }
    proponent { nil }
  end
end
