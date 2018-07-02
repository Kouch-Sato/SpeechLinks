class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :image, :binary
    add_column :users, :university, :integer
    add_column :users, :grade, :integer
  end
end
