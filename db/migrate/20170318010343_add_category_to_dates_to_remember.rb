class AddCategoryToDatesToRemember < ActiveRecord::Migration
  def change
    add_column :date_to_remembers, :category, :string
  end
end
