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
  
  # updates to complete if not completed
  #
  # returns a Boolean if able to update
  def mark_done
    if !self.completed
      self.update(completed: true)
    else
      false
    end
  end
  
  # updates to not complete if already completed
  #
  # returns a Boolean if able to update
  def mark_undone
    if self.completed
      self.update(completed: false)
    else
      false
    end
  end
  
end
