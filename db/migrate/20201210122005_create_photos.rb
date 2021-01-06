class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title , null: false
      t.integer :prefecture_id , null: false
      t.integer :situation_id
      t.integer :weather_id
      t.integer :month_id
      t.integer :camera_id
      t.integer :lenz_id
      t.text :comment
      t.references :user , foreign_key: true

      t.timestamps
    end
  end
end
