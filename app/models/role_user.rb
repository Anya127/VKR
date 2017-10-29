# Связь пользователя с ролью
# role - роль
# user - пользователь
# data - параметр связи (например, код факультета)

class RoleUser < ApplicationRecord
  belongs_to :role
  belongs_to :user
  
  validates :role_id, presence: true
  validates :user_id, presence: true
  
  Role::ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      self.role.name == rname
    end
  end
end
