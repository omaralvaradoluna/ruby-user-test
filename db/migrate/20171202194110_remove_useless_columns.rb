class RemoveUselessColumns < ActiveRecord::Migration[5.1]
  def change
      remove_column :users, :password
      remove_column :users, :token
  end
end
