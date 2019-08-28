class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :website
      t.string :logo

      t.timestamps
    end
    add_index :companies, :email, unique: true
  end
end
