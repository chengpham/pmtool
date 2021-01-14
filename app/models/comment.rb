class Comment < ApplicationRecord
    belongs_to :discussion
    belongs_to :project

    validates :body, presence: {message: 'must be provided'}

end
