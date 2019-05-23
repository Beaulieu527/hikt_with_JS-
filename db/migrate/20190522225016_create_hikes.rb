class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name
      t.string :summary
      t.string :difficulty
      t.string :location
      t.float :length
      t.string :img_url
      t.integer :user_id
      t.timestamps
    end
  end
end
