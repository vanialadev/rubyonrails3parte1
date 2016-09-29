class AddPremiumToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :premium, :boolean
  end
end
