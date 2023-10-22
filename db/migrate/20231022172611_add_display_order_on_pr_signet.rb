class AddDisplayOrderOnPrSignet < ActiveRecord::Migration[7.1]
  def change
    add_column :pr_signets, :display_order, :integer, null: false, default: 1
  end
end

