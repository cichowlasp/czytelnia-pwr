class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :index, unique: true
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
