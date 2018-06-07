class CreateRealties < ActiveRecord::Migration[5.1]
  def change
    create_table :realties do |t|
      t.string :title
      t.string :subtitle
      t.string :price
      t.string :rooms
      t.string :area
      t.string :price_per_meter
      t.string :main_image

      t.timestamps
    end
  end
end
