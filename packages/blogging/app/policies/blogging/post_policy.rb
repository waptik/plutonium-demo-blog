class Blogging::PostPolicy < Blogging::ResourcePolicy
  # Core actions

  # def create?
  #   true
  # end

  # def read?
  #   true
  # end

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
