class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.references :admin, foreign_key: true

      t.timestamps
    end
    add_index :events, [:admin_id, :created_at]
  end
end
