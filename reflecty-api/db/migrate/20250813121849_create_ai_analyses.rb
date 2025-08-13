class CreateAiAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :ai_analyses do |t|
      t.references :entry, null: false, foreign_key: true
      t.string :analysis_type
      t.jsonb :result
      t.string :status

      t.timestamps
    end
  end
end
