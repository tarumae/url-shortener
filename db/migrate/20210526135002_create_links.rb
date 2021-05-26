class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.text :long_link
      t.string :short_link
      t.integer :counter, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
