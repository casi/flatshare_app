class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.text :description

      t.timestamps
    end
  end
end
