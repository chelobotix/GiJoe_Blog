class AddFactionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :faction, :string
  end
end
