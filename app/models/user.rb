# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  password_encrypted :string
#

class User < ActiveRecord::Base
  include Login
  
  has_many :tasks
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_encrypted, presence: true
  
  # returns an Array of Task objects that are incomplete
  #
  # returns an Array of Tasks
  def incomplete_tasks
   self.tasks.select{|task| !task.completed} 
  end
end
