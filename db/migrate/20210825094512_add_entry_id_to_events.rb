class AddEntryIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :entry, foreign_key: true
  end
end
