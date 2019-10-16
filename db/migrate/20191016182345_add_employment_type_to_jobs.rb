class AddEmploymentTypeToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :employment_type, :integer, default: 0
  end
end
