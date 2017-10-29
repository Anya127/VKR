class Post < ApplicationRecord
  belongs_to :category
  has_many :relations

  validates :name_p, presence: true
  validates :full_name_p, presence: true
end

