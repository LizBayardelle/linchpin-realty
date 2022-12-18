class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :notes
      t.references :user
      t.references :loan
      t.boolean :received, default: false

      t.timestamps
    end
  end
end
