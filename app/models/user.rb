class User
  has_many :tasks
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
  
  
  
  
end