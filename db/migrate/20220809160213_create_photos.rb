class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :nickname, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.text :image, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
