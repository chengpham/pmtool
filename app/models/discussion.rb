class Discussion < ApplicationRecord
    belongs_to :project
    has_many :comments, dependent: :destroy

    validates :title, presence: {message: 'must be provided'}

end
