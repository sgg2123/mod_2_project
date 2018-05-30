class CreateUserLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_languages do |t|
      t.integer  :user_id
      t.integer  :language_id
    end
  end
end
