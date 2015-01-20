class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :annual_income
      t.float :current_savings
      t.float :retirement_savings

      t.timestamps null: false
    end
  end
end
