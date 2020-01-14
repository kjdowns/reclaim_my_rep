class CreateReps < ActiveRecord::Migration[5.2]
  def change
    create_table :reps do |t|
      t.string :title
      t.string :name
      t.string :address
      t.string :party
      t.string :phone
      t.string :website
      t.string :photo
      t.string :facebook
      t.string :twitter
      t.integer :user_id
    end
  end
end
