class CreateSubscryptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscryptions do |t|
      t.string :price
      t.string :level
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
