class Note < ApplicationRecord
    belongs_to :task

    validates_presence_of :content
    validates_presence_of :task_id
end
