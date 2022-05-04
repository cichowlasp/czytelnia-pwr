class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :user_data do |t|
      t.string :name
      t.string :surname
      t.string :university
      t.string :department
      t.string :field_of_study
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
