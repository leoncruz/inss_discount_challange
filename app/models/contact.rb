class Contact < ApplicationRecord
  belongs_to :proponent

  validates :telephone, presence: true
  validates :name, presence: true, if: :reference
end
