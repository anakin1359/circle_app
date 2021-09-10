class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :comment
      t.references :user, foreign_key: true
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
