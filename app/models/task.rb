class Task < ApplicationRecord
  
  paginates_per 25
  
  validates :title, presence: true
  
  
  
  def status
    if completed == true
      "completed"
    else
      "todo"
    end
  end
end
