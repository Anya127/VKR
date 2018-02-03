class Vocation < ApplicationRecord
  belongs_to :contract

  validates :type_v, presence: true
  validates :d_conclusion_v, presence: true
  validates :d_expiration_v, presence: true
  validates :order_date, presence: true
  validates :order_number, presence: true
end
