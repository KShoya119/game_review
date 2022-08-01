# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GameGenre.create([
  { genre_name: "シューティング" },
  { genre_name: "アクション" },
  { genre_name: "RPG" },
  { genre_name: "アドベンチャー" },
  { genre_name: "レース" },
  { genre_name: "パズル" },
  { genre_name: "シュミレーション" },
  { genre_name: "サンドボックス" },
  { genre_name: "音楽" },
  { genre_name: "テーブル" },
  { genre_name: "その他" }
])
