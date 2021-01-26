class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user, optional: true

    has_many :favourites, dependent: :destroy
    has_many :favouriters, through: :favourites, source: :user

    
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    validates :due_date, presence: {message: 'must be provided'}
    validate :due_date_after_todays_date

    private
    def due_date_after_todays_date
        if due_date < Date.current
            errors.add(:due_date, "can't be before todays date")
        end
    end

end
