class Task < ApplicationRecord
    belongs_to :project

    validates :title, presence: {message: 'must be provided'} , uniqueness: true

end
