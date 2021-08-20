class AddExtraToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :introduction, :text
    add_column :events, :entry_count, :integer
    add_column :events, :event_price, :integer
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :event_icon, :string
  end
end
