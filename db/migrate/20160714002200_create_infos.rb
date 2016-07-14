class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string :author
      t.string :title
      t.text :content
      t.boolean :archived

      t.timestamps
    end
  end
end
