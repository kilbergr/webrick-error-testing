class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :language
      t.string :code
      t.string :highlighted

      t.timestamps null: false
    end
  end
end
