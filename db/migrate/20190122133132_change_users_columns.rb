class ChangeUsersColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :string
    remove_column :users, :image_age, :string
  end
end
