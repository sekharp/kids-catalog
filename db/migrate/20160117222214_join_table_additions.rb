class JoinTableAdditions < ActiveRecord::Migration
  def change
    add_column :book_users, :favorited, :boolean
    add_column :book_users, :read, :boolean
  end
end
