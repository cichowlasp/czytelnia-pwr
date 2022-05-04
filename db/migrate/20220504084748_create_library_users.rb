class CreateLibraryUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :library_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :library, index: true
      t.timestamps
    end
  end
end
