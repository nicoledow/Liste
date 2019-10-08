class Task < ApplicationRecord
    belongs_to :assignment
    belongs_to :list
    has_many :notes
end
