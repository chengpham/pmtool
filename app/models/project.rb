class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user, optional: true

    has_many :favourites, dependent: :destroy
    has_many :favouriters, through: :favourites, source: :user
    
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    validates :due_date, presence: {message: 'must be provided'}
    validate :due_date_after_todays_date

    def tag_names
        self.tags.map(&:name).join(', ')
    end
    def tag_names=(rhs)
        self.tags=rhs.strip.split(/\s*,\s*/).map do|tag_name|
            Tag.find_or_initialize_by(name: tag_name)
            # it will try to find the 'tag_name' in a tag table
            # if a tag with 'tag_name' is not found ,
            #  it will call Tag.new(name: tag_name)
        end
    end

    private
    def due_date_after_todays_date
        if due_date < Date.current
            errors.add(:due_date, "can't be before todays date")
        end
    end

end
