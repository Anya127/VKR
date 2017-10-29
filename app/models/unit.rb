class Unit < ApplicationRecord
  belongs_to :unit
  has_many :relations

  validates :name_u, presence: true
  validates :full_name_u, presence: true

end

