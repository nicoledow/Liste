class List < ApplicationRecord
    has_many :tasks
    has_many :notes, through: :tasks

    default_scope {order("created_at DESC")}

    scope :completed, -> { where(completed: true) }
    scope :incomplete, -> { where(completed: false) }
end
