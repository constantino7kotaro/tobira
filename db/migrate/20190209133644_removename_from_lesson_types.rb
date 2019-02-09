class RemovenameFromLessonTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :lesson_types, :name, :integer
    add_column :lesson_types, :name, :string
  end
end
