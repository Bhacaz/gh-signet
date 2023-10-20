class CreatePrSignets < ActiveRecord::Migration[7.1]
  def change
    create_table :pr_signets do |t|
      t.string :query
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :sort, default: 0, limit: 1, null: false
      t.integer :order, default: 0, limit: 1, null: false

      t.timestamps
    end
  end
end
