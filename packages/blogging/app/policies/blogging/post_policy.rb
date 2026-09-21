class Blogging::PostPolicy < Blogging::ResourcePolicy
  # Core actions

  # Anyone authenticated can create posts
  def create?
    true
  end

  # Anyone can view published posts, and post owner can view draft posts.
  def read?
    record.published? || owner?
  end

  # Only owner can update posts
  def update?
    owner?
  end

  # Only owner can delete posts
  def destroy?
    owner?
  end

  private

  def owner?
    record.user_id == user.id
  end

  # Core attributes

  # Control which columns appear in the index table
  def permitted_attributes_for_index
    [:title, :published, :created_at]
  end

  def permitted_attributes_for_create
    [:title, :body, :published, :user_id]
  end

  def permitted_attributes_for_read
    [:title, :body, :published, :user, :created_at]
  end

  # Associations

  def permitted_associations
    %i[user]
  end
end
