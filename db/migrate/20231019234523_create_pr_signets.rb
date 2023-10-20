class CreatePrSignets < ActiveRecord::Migration[7.1]
  def change
    create_table :pr_signets do |t|
      t.string :query
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :order

      t.timestamps
    end
  end
end
