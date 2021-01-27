class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user, optional: true

    has_many :favourites, dependent: :destroy
    has_many :favouriters, through: :favourites, source: :user
    
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    has_many :members, dependent: :destroy
    has_many :users, through: :members
    
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    validates :due_date, presence: {message: 'must be provided'}
    validate :due_date_after_todays_date

    def tag_names
        self.tags.map(&:name).join(', ')
    end
    def tag_names=(rhs)
        self.tags=rhs.strip.split(/\s*,\s*/).map do|tag_name|
            Tag.find_or_initialize_by(name: tag_name)
        end
    end
    def members_name=(search)
        self.members=search.strip.split(/\s*,\s*/).map do|member|
            # User.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{member}","%#{member}").first
            User.find_or_initialize_by(first_name: member)
        end
    end

    private
    def due_date_after_todays_date
        if due_date < Date.current
            errors.add(:due_date, "can't be before todays date")
        end
    end

end
