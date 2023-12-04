class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :student, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity
      t.date :loan_date
      t.date :return_date
      t.date :expected_return_date
      t.decimal :fine, precision: 8, scale: 2

      t.timestamps
    end
  end
end
