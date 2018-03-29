class RemoveValuefromDoses < ActiveRecord::Migration[5.1]
  def change
    remove_column :doses, :value, :integer
  end
end
