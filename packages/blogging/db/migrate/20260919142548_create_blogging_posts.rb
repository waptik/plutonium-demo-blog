class CreateBloggingPosts < ActiveRecord::Migration[8.1]
  def change
    create_table :blogging_posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :published, null: true

      t.timestamps
    end
  end
end
