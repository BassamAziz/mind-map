class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :level
      t.references :parent, foreign_key: {to_table: :topics}, index: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
