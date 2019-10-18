class Assignment < ApplicationRecord
    belongs_to :user
    belongs_to :task

    validates_uniqueness_of :user_id, scope: %i[task_id]
    default_scope {order("created_at DESC")}
end
