class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :content

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
