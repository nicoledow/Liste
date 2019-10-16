class Assignment < ApplicationRecord
    belongs_to :user
    belongs_to :task

    default_scope {order("created_at DESC")}
end
