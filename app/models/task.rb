# == Schema Information
#
# Table name: tasks
#
#  id        :integer          not null, primary key
#  name      :string
#  completed :boolean          default(FALSE)
#  user_id   :integer
#

class Task < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  
  
end
