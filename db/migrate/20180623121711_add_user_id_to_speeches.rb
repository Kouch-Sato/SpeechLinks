class AddUserIdToSpeeches < ActiveRecord::Migration[5.1]
  def change
    add_column :speeches, :user_id, :integer
  end
end
