class AddColumnsToRealties < ActiveRecord::Migration[5.1]
  def change
    add_column :realties, :description, :string
    add_column :realties, :characs, :string
    add_column :realties, :secondary_images, :string, array: true, default: []
  end
end
