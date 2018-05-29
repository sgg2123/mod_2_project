class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :lang_name
      t.text :history
      t.integer :jobs_available
      t.integer :average_salary
      t.text :description
      t.text :fields_of_application
    end
  end
end
