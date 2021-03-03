class DeleteUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :users
    drop_table :lists
  end


end
