class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :provider_id, index: true
      t.string :username, index: true
      t.string :email, index: true, limit: 500
      t.string :gho_token, limit: 500
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
  end
end
