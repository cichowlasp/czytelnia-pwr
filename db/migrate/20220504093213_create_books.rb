class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :type_of_book
      t.string :publisher
      t.boolean :available
      t.references :order
      t.references :library, null: false, foreign_key: true
      t.timestamps
    end
  end
end
