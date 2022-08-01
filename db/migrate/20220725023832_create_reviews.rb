class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.string :game_title
      t.float :evaluation
      t.string :review_title
      t.text :review
      t.integer :status

      t.timestamps
    end
  end
end
