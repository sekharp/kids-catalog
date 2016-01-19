class CreateBookUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :books, :users do |t|
      t.references :book_id
      t.references :user_id
      t.boolean :favorited
      t.boolean :read
    end
  end
end
