require "rails_helper"

RSpec.describe "Proponents", type: :feature do
  describe "#index" do
    before do
      create(:proponent, name: "Proponent #1")
      create(:proponent, name: "Proponent #2")
    end

    it "list the proponents" do
      visit root_path

      expect(page).to have_text "Proponent #1"
      expect(page).to have_text "Proponent #2"
    end
  end

  describe "#create" do
    context "when the creation of proponent is successfully" do
      it "shows the new proponent on page" do
        visit new_proponent_path

        fill_in "Nome", with: "João"
        fill_in "CPF", with: "12312312300"
        fill_in "Data de nascimento", with: "05/09/1990"
        fill_in "Salário", with: "8000"
        fill_in "CEP", with: "11222333"
        fill_in "Rua", with: "Rua #1"
        fill_in "Número", with: "123"
        fill_in "Cidade", with: "Cidade #1"
        fill_in "Bairro", with: "Bairro #1"
        select "São Paulo", from: "Estado"

        click_on "Salvar"

        expect(page).to have_text "João"
        expect(page).to have_text "12312312300"
        expect(page).to have_text "05/09/1990"
        expect(page).to have_text "R$ 8.000,00"
      end
    end

    context "when the creation of proponent fails" do
      it "shows the erros on page" do
        visit new_proponent_path

        fill_in "Nome", with: "João"
        fill_in "Salário", with: "8000"

        click_on "Salvar"

        expect(page).to have_text "Proponente não pode ser criado"
        expect(page).to have_text "CPF não pode ficar em branco"
        expect(page).to have_text "Data de nascimento não pode ficar em branco"
        expect(page).to have_text "CEP não pode ficar em branco"
        expect(page).to have_text "Rua não pode ficar em branco"
        expect(page).to have_text "Número não pode ficar em branco"
        expect(page).to have_text "Cidade não pode ficar em branco"
        expect(page).to have_text "Bairro não pode ficar em branco"
        expect(page).to have_text "Estado não pode ficar em branco"
      end
    end
  end

  describe "#update" do
    let!(:proponent) { create(:proponent) }

    context "when the update of proponent is successfully" do
      it "shows the new proponent on page" do
        visit edit_proponent_path(proponent)

        fill_in "Nome", with: "João"
        fill_in "CPF", with: "12312312300"
        fill_in "Data de nascimento", with: "05/09/1990"
        fill_in "Salário", with: "8000"

        click_on "Salvar"

        expect(page).to have_text "João"
        expect(page).to have_text "12312312300"
        expect(page).to have_text "05/09/1990"
        expect(page).to have_text "R$ 8.000,00"
      end
    end

    context "when the update of proponent fails" do
      it "shows the erros on page" do
        visit edit_proponent_path(proponent)

        fill_in "Nome", with: ""
        fill_in "Salário", with: ""

        click_on "Salvar"

        expect(page).to have_text "Proponente não pode ser atualizado"
        expect(page).to have_text "Nome não pode ficar em branco"
        expect(page).to have_text "Salário não pode ficar em branco"
      end
    end
  end

  describe "#detalhes" do
    before do
      create(:proponent, name: "Proponent #1")
      create(:proponent, name: "Proponent #2")
    end

    it "list the proponents" do
      visit root_path

      click_on "Detalhes", match: :first

      click_on "Remover", match: :first

      expect(page).to_not have_text "Proponent #1"
    end
  end
end
