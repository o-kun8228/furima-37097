class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :send_day
  belongs_to :shipping_area
  has_one_attached :image


  #商品画像を1枚つけることが必須であること
  validates :image, presence: true
  #商品名が必須であること
  validates :brand_name, presence: true
  #商品の説明が必須であること
  validates :description_item, presence: true
  #カテゴリーの情報が必須 #未選択はだめ---を
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  #商品の状態の情報が必須であること
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  #配送料の負担の情報が必須であること
  validates :fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  #発送元の地域の情報が必須であること
  validates :shipping_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  #発送までの日数の情報が必須であること
  validates :send_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  #価格の情報が必須であること
  validates :price , presence: true
  # , message: "Price can't "}
  # 価格は¥300~¥9,999,999の間のみに指定されていることを確認するバリデーションを描く
  # 価格は半角数字のみ指定されていることを確認するバリデーションを書く
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 999999}

end
