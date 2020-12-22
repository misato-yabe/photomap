class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title , null: false
      t.integer :prefecture_id , null: false
      t.integer :situation_id , null: false, foreign_key: true
      t.integer :weather_id , null: false
      t.integer :month_id , null: false
      t.integer :camera_id , null: false
      t.integer :lens_id , null: false
      t.text :comment
      t.references :user , foreign_key: true

      t.timestamps
    end
  end
end
