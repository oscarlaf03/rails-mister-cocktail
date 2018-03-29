class RemoveUnitfromDoses < ActiveRecord::Migration[5.1]
  def change
    remove_column :doses, :unit, :string
  end
end
