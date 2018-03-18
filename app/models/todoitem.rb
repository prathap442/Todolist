class Todoitem < ApplicationRecord
  belongs_to :todolist
  def completed?
     !completed_at.blank?
  end	
end
