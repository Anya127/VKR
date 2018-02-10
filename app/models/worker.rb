class Worker < ApplicationRecord
  has_many :contracts
  belongs_to :user

  validates :l_name, presence: true
  validates :f_name, presence: true
  validates :inn,  length: { minimum: 12 }
  validates :passport,  length: { minimum: 10 }
  validates :snils,  length: { minimum: 11 }
  validates :d_bday, presence: true

  def full_name
    self.l_name + ' ' + self.f_name.mb_chars[0..0].to_s + '.' + self.s_name.mb_chars[0..0].to_s + '.'
  end
end
