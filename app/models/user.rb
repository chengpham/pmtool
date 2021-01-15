class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :nullify
    has_many :tasks, dependent: :nullify
    has_many :discussions, dependent: :nullify
    has_many :comments, dependent: :nullify
    attr_accessor :current_password, :new_password, :new_password_confirmation
    def full_name
        "#{first_name} #{last_name}"
    end
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :password, presence: true
end
