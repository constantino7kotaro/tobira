class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :sent_user_id
      t.integer :recieved_user_id
      t.text :content
      t.integer :read_flag

      t.timestamps
    end
  end
end
