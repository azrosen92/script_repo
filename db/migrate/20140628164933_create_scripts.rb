class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :name
      t.string :file_path
      t.integer :size
      t.integer :downloads

      t.timestamps
    end
  end
end
