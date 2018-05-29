class CompanyLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :company_languages do |t|
      t.integer :company_id
      t.integer :language_id
    end
  end
end
