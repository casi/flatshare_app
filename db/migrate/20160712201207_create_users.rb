class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.date :birthday
      t.date :moved_in
      t.date :moved_out
      t.text :description

      t.timestamps
    end
  end
end
