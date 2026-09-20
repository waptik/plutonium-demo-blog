class AddUserToBloggingPosts < ActiveRecord::Migration[8.1]
  def change
    # Previous faulty version:
    #   add_reference :blogging_posts, :user, null: false, foreign_key: true
    # Failed with SQLite3::ConstraintException: NOT NULL constraint failed: blogging_posts.user_id
    # because existing posts from Chapter 2 testing cannot have null: false without a default or existing user.
    # Set to nullable (null: true) to allow existing posts and optional author assignment.
    add_reference :blogging_posts, :user, foreign_key: true
  end
end
