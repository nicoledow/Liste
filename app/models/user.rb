class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates_presence_of :email
    validates :email, uniqueness: { message: "Email already in use."}
    validates :password, length: { minimum: 5, message: "must be at least five characters." }

    has_many :assignments
    has_many :tasks, through: :assignments
    has_many :notes

    def manager?
        self.manager == true
    end

    def self.create_with_omniauth(auth)
      user = User.find_or_create_by(uid: auth['uid'])
      user.email = auth['info']['email']
      user.password = auth['uid']
      user.name = auth['info']['name']
      if User.exists?(user.id)
        user
      else
        user.save!
        user
      end
    end
end
