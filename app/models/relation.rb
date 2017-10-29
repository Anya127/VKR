class Relation < ApplicationRecord
  belongs_to :post
  belongs_to :unit
  has_many :contracts

  validates :d_vocation_pu, presence: true

 
end
