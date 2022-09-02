class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.string :game_title, null: false
      t.float :evaluation, null: false
      t.string :review_title, null: false
      t.text :review, null: false
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
