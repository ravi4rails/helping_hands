class CreateStoryResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :story_responses do |t|
      t.text :body
      t.references :story, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
