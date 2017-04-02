class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :published_on
      t.date :published_end
      t.text :body
      t.text :povtor

      t.timestamps
    end
  end
end
