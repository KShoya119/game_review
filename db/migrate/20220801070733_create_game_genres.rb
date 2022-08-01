class CreateGameGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :game_genres do |t|
      t.string :genre_name

      t.timestamps
    end
  end
end
