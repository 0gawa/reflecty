class CreateTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :templates do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :body
      t.boolean :is_premium

      t.timestamps
    end
  end
end
