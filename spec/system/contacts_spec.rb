require "rails_helper"

RSpec.describe "Contacts", type: :system do
  let!(:proponent) { create(:proponent) }

  describe "creating a contact" do
    it "allows a user to create a new contact" do
      visit proponent_path(proponent)

      click_link I18n.t("proponents.show.add_contact")

      within("#modal") do
        check "contact_reference"
        fill_in "contact_name", with: "João"
        fill_in "contact_telephone", with: "123456789"
        click_button I18n.t("helpers.actions.save")
      end

      expect(current_path).to eq(proponent_path(proponent))
      expect(page).to have_content("João")
      expect(page).to have_content("123456789")
    end
  end

  describe "editing a contact" do
    let!(:contact) { create(:contact, proponent: proponent, name: "Sara", telephone: "987654321", reference: true) }

    it "allows a user to edit an existing contact" do
      visit proponent_path(proponent)

      within "##{ActionView::RecordIdentifier.dom_id(contact)}" do
        click_link I18n.t("helpers.actions.edit")
      end

      fill_in "contact_name", with: "Maria"
      fill_in "contact_telephone", with: "123123123"
      click_button I18n.t("helpers.actions.save")

      expect(current_path).to eq(proponent_path(proponent))
      expect(page).to have_content("Maria")
      expect(page).to have_content("123123123")
    end
  end

  describe "deleting a contact" do
    let!(:contact) { create(:contact, proponent: proponent, name: "Tales", reference: true) }

    before { driven_by :selenium, using: :headless_chrome }

    it "allows a user to delete a contact" do
      visit proponent_path(proponent)

      expect(page).to have_content("Tales")

      within "##{ActionView::RecordIdentifier.dom_id(contact)}" do
        accept_confirm do
          click_button I18n.t("helpers.actions.destroy")
        end
      end

      expect(current_path).to eq(proponent_path(proponent))
      expect(page).not_to have_content("Mark Spencer")
    end
  end
end
