class CreateTestings < ActiveRecord::Migration
  def change
    create_table :testings do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
