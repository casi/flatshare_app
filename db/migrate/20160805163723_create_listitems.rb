class CreateListitems < ActiveRecord::Migration[5.0]
  def change
    create_table :listitems do |t|
      t.string :item
      #t.boolean :shopping
      #t.boolean :todo
      t.boolean :done

      t.timestamps
    end
  end
end
