class Worker < ApplicationRecord
  has_many :contracts

  validates :l_name, presence: true
  validates :f_name, presence: true
  validates :inn,  length: { minimum: 12 }
  validates :passport,  length: { minimum: 10 }
  validates :snils,  length: { minimum: 11 }
  validates :d_bday, presence: true
end
