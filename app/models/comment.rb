class Comment < ApplicationRecord
    


    # after_initialize :set_defaults
    # before_save :capitalize_title
    validates :body, presence: {message: 'must be provided'}
    # validates :body , length:{minimum: 2}
    # validates :title, uniqueness: {scope: :body }
    # validates :view_count, numericality: {greater_than_or_equal_to: 0}
    # scope :recent_ten, lambda{order("created_at DESC").limit(10)}
    # private
    # def capitalize_title
    #     self.title.capitalize!
    # end
    # def set_defaults
    #     self.view_count ||=0
    # end
end
