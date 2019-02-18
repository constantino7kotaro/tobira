class RemovenameFromAreas < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :name, :integer
    add_column :areas, :name, :string
  end
end
