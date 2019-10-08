class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates_presence_of :email
    validates :email, uniqueness: { message: "Email already in use."}
    validates :password, length: { minimum: 5, message: "must be at least five characters." }

    has_many :assignments
    has_many :tasks, through: :assignments

    def manager?
        self.manager == true
    end
end
