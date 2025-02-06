class Task < ApplicationRecord
  
  validates :title, presence: true
  
  
  
  def status
    if completed == true
      "completed"
    else
      "todo"
    end
  end
end
