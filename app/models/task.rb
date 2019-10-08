class Task < ApplicationRecord
    has_many :assignments
    belongs_to :list
    has_many :notes
end
