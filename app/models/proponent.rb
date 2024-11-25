class Proponent < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :contacts, dependent: :destroy

  normalizes :cpf, with: ->(cpf) { cpf.gsub(/\D/, "") }

  validates :name, presence: true
  validates :cpf, presence: true, format: { with: /\A[0-9]{11}\z/, allow_blank: true }
  validates :birth_date, presence: true, comparison: { less_than: -> { Date.current }, allow_blank: true }
  validates :salary, presence: true, numericality: { greater_than: 0, allow_nil: true }

  accepts_nested_attributes_for :address, allow_destroy: true
end
