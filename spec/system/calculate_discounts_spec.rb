require "rails_helper"

RSpec.describe "CalculateDiscounts", type: :system, js: true do
  it "displays the salary discount on input" do
    visit new_proponent_path

    fill_in "Salário", with: "3000"

    fill_in "CEP", with: "668191" # unfocus from salary field

    expect(page).to have_field('Desconto INSS', with: "R$ 281,62", normalize_ws: true)
  end
end
