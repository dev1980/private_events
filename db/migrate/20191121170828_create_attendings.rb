class CreateAttendings < ActiveRecord::Migration[6.0]
  def change
    create_table :attendings do |t|
      t.integer :attendee_id
      t.integer :event_id

      t.timestamps
    end
    add_foreign_key :attendings, :users, column: :attendee_id
    add_foreign_key :attendings, :events, column: :event_id

  end
end
