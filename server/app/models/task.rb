class Task < ApplicationRecord
    belongs_to :project
    belongs_to :user, optional: true
    validates :title, presence: {message: 'must be provided'} , uniqueness: true

end
