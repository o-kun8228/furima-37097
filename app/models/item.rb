class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:status, :fee, :send_day, :shipping_area
#アクティブハッシュの場合は↑の書き方じゃなくて毎回ビロングトゥを書いていくように後で直す

  商品画像を1枚つけることが必須であること
  validates :image, presence: true
  商品名が必須であること
  validates :image, presence: true
  商品の説明が必須であること
  validates :image, presence: true
  カテゴリーの情報が必須 #未選択はだめ---を
  validates :category, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  商品の状態の情報が必須であること
  validates :status, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  配送料の負担の情報が必須であること
  validates :fee, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  発送元の地域の情報が必須であること
  validates :shipping_area, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  発送までの日数の情報が必須であること
  validates :send_day, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  価格の情報が必須であること
  validates :price , presence: true, numericality: { only_integer: true, in: 300..999999, message: "can't "}
  # 価格は¥300~¥9,999,999の間のみに指定されていることを確認するバリデーションを描く
  # 価格は半角数字のみ指定されていることを確認するバリデーションを書く


end
