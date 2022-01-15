class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.string :name
      t.string :source_name
      t.string :source_url
      t.string :resource_url
      t.string :category
      t.datetime :date_published
      t.boolean :display, default: true

      t.timestamps
    end
  end
end
