class List < ApplicationRecord
    belongs_to :team
    has_many :tasks
    has_many :notes, through: :tasks
end
