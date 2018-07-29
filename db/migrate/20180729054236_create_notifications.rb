class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.bigint :notified_by_id
      t.integer :speech_id
      t.string :notified_type
      t.boolean :read

      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
