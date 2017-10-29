class Contract < ApplicationRecord
  belongs_to :worker
  belongs_to :relation
  has_many :vocations

  validates :number_c, presence: true
  validates :d_conclusion_c, presence: true
  validates :d_expiration_c, presence: true
  validates :stavka, presence: true
  validates :vocation_c, presence: true
  validates :special_conditions, presence: true
end

