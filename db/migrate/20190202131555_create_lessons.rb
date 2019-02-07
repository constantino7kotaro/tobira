class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.integer :skill_id
      t.integer :area_id
      t.integer :lesson_type_id
      t.text :content

      t.timestamps
    end
  end
end
