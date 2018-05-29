class CreateRealties < ActiveRecord::Migration[5.1]
  def change
    create_table :realties do |t|
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
