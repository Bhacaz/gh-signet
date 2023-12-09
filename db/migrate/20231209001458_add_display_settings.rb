class AddDisplaySettings < ActiveRecord::Migration[7.1]
  def change
    add_column :pr_signets, :display_settings, :jsonb, null: false, default: {}
  end
end
