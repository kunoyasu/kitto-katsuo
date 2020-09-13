class Tickets < ActiveRecord::Migration[6.0]
  def change
        create_table :tickets do |t|
        t.string     :name,                       null: false 
        t.text       :introduction,               null: false 
        t.references :user,                       null: false , foreign_key: true
        t.integer    :category_id,                null: false 
        t.timestamps
       end
      end
    end