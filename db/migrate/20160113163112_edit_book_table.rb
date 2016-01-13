class EditBookTable < ActiveRecord::Migration
  def change
    remove_column :books, :description
    remove_column :books, :author
    add_column :books, :author_first_name, :string
    add_column :books, :author_last_name, :string
    add_column :books, :isbn, :integer
  end
end
