class CreateDateToRemembers < ActiveRecord::Migration
  def change
    create_table :date_to_remembers do |t|
      t.date :date, index: true
      t.string :title, index: true

      t.timestamps null: false
    end
  end
end
