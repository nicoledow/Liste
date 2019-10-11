class List < ApplicationRecord
    has_many :tasks
    has_many :notes, through: :tasks

    scope :completed, -> { where(completed: true) }
    scope :incomplete, -> { where(completed: false) }
end
