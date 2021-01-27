class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :nullify
    has_many :tasks, dependent: :nullify
    has_many :discussions, dependent: :nullify
    has_many :comments, dependent: :nullify
    has_many :favourites, dependent: :destroy
    has_many :favoured_project, through: :favourites, source: :project

    has_many :members, dependent: :destroy
    has_many :projects, through: :members

    attr_accessor :current_password, :new_password, :new_password_confirmation
    def full_name
        "#{first_name} #{last_name}"
    end
    def self.search_by_name(search)
        @names = search.split(/\s*,\s*/)
        where("first_name ILIKE ? OR last_name ILIKE ?", "%#{@names}","%#{@names}" )
    end
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :password, presence: true
end
