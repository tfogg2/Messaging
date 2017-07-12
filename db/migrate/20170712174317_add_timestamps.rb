class AddTimestamps < ActiveRecord::Migration[5.1]
  def change
    add_column(:users, :created_at, :datetime)
    add_column(:chatrooms, :created_at, :datetime)
    add_column(:messages, :created_at, :datetime)

    add_reference :messages, :chatroom, index: true
    add_foreign_key :messages, :chatrooms
    add_reference :messages, :user, index: true
    add_foreign_key :messages, :users
  end
end
