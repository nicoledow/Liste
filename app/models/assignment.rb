class Assignment < ApplicationRecord
    belongs_to :user
    belongs_to :task

    validates_uniqueness_of :user_id, scope: %i[task_id]
    validates :task_id, presence: true
    validates :user_id, presence: true

    default_scope {order("created_at DESC")}

    def verify_task
      if !self.task 
        new_task = Task.create(description:"Please add a task")
        self.task = new_task
      end
    end
end
