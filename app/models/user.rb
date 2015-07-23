class User < ActiveRecord::Base
  include Login
  
  has_many :tasks
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_encrypted, presence: true
  
  
end