class CreateQandas < ActiveRecord::Migration[5.0]
  def change
    create_table :qandas do |t|
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
