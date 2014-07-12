class AddUniqueIdandDescriptionToScripts < ActiveRecord::Migration
  def change
  	add_column :scripts, :description, :string
  end
end
