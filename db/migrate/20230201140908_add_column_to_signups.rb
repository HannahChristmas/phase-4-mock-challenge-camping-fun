class AddColumnToSignups < ActiveRecord::Migration[6.1]
  def change
    add_column :signups, :time, :integer
  end
end
