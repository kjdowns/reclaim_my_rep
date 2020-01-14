class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :issue
      t.text :description
      t.boolean :has_responded
      t.boolean :is_meaningful
      t.integer :user_id
      t.integer :rep_id
    end
  end
end
