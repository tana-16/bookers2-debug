class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.text :book_content
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
