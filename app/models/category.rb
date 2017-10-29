class Category < ApplicationRecord
  has_many :posts

  validates :name_c, presence: true
  validates :full_name_c, presence: true
  validates :d_vocation_c, presence: true

end

