class AddApplyUrlToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :apply_url, :string
  end
end
