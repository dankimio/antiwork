class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.integer :category
      t.integer :salary_min
      t.integer :salary_max
      t.boolean :remote, default: false
      t.boolean :visa_sponsorship, default: false
      t.string :city
      t.string :country
      t.integer :level
      t.text :description
      t.text :how_to_apply
      t.boolean :paid, default: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
