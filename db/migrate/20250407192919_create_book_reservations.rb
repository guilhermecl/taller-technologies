class CreateBookReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :book_reservations do |t|
      t.references :book, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
