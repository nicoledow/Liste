class List < ApplicationRecord
    has_many :tasks
    has_many :notes, through: :tasks
end
