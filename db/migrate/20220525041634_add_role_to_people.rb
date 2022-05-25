class AddRoleToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :role, :integer, default: 0
  end
end
