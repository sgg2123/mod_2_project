class AddVideoToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :video, :string
    add_column :languages, :blog, :string
    add_column :languages, :course, :string
    add_column :languages, :book, :string
    add_column :languages, :school, :string
  end
end
