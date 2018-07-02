class AddColumnToSpeech < ActiveRecord::Migration[5.1]
  def change
    add_column :speeches, :overview, :text
  end
end
