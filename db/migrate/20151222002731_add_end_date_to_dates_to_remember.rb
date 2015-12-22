class AddEndDateToDatesToRemember < ActiveRecord::Migration
  def change
    add_column :date_to_remembers, :end_date, :date
  end
end
