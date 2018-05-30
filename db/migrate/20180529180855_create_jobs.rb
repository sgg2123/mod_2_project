class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company_name
      t.text :description
      t.string :redirect_url
      t.integer :listing_id
      t.integer :language_id
    end
  end
end
