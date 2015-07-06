class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :url
      t.string :image, array: true, default: []
      t.text :body
      t.string :category

      t.timestamps null: false
    end
  end
end
