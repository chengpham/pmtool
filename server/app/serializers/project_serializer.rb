class ProjectSerializer < ActiveModel::Serializer
  attributes( :id, :title, :description, :due_date, :created_at, :updated_at, :favourite_count )
  def favourite_count
    object.favourites.count
  end
  belongs_to :user, key: :creator
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :full_name
  end

  has_many :tasks
  class TaskSerializer < ActiveModel::Serializer
    attributes :id, :title, :due_date, :done
  end
  has_many :members
  class MemberSerializer < ActiveModel::Serializer
    attributes :member
    def member
      object.user.full_name
    end
  end
  has_many :discussions
  class DiscussionSerializer < ActiveModel::Serializer
    attributes :id, :title, :description
    
  end
  has_many :comments
    class CommentSerializer < ActiveModel::Serializer
      attributes :id, :body, :discussion_id
   end
end
