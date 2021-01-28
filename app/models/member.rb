class Member < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # validates :email, presence: true, uniqueness:{ case_sensitive: false}

  def members_name=(search)
    self.members=search.strip.split(/\s*,\s*/).map do|member|
        User.where("first_name ILIKE ?", "#{member}").first
        # User.find_or_initialize_by(first_name: member)
    end
  end
end
