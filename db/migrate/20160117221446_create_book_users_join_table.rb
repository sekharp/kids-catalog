class CreateBookUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :books, :users, table_name: :book_users
  end
end
