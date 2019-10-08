class User < ApplicationRecord
    has_secure_password

    has_many :assignments
    has_many :tasks, through: :assignments
end
