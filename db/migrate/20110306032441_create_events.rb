class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :event_type
      t.datetime :ended_at
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
