class CreateReviewGenreIntermediates < ActiveRecord::Migration[6.1]
  def change
    create_table :review_genre_intermediates do |t|
      t.integer :review_id
      t.integer :game_genre_id

      t.timestamps
    end
  end
end
