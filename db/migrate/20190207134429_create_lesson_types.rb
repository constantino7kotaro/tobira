class CreateLessonTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_types do |t|
      t.integer :name

      t.timestamps
    end
  end
end
