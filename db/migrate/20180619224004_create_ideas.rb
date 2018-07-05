class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :body
      t.integer :likes , default: 0

      t.timestamps
    end
  end
end
