class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string :title
      t.text :content
      t.boolean :archived
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :infos, [:user_id, :created_at]
  end
end
