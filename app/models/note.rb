class Note < ApplicationRecord
    belongs_to :task
    belongs_to :user

    validates_presence_of :content
    validates_presence_of :task_id
end
