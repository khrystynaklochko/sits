class Operator < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation
  
  validates :email, presence: true, 
                    uniqueness: true,
                    length: { minimum: 8, maximum: 50}

end
