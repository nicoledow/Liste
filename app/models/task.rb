class Task < ApplicationRecord
    has_many :assignments
    belongs_to :list
    has_many :notes


    def assigned?
      Assignment.find_by(task_id: self.id) ? true : false
    end
end
