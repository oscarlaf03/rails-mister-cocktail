class AddDescriptionToDoses < ActiveRecord::Migration[5.1]
  def change
    add_column :doses, :description, :text
  end
end
