class CreateReviewGenreIntermediates < ActiveRecord::Migration[6.1]
  def change
    create_table :review_genre_intermediates do |t|
      t.references :review, foreign_key: true
      t.references :game_genre, foreign_key: true

      t.timestamps
    end
  end
end
