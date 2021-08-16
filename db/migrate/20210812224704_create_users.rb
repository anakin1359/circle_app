class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      # t.string :email
      t.string :description
      t.string :user_icon

      t.timestamps
    end
  end
end
