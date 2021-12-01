class LogAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :buy_log, :user_id, :item_id, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/,message:"is invalid. Include hyphen(-) cant over 12"}
    validates :token
  end

  def save

    buy_log = BuyLog.create(user_id: user_id, item_id: item_id)

    BuyerAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_log_id: buy_log.id)
  
  end

# rails g model ２つのモデルとテーブル作成
# 購入画面に遷移できるか（※ルーティングのネスト）
# 購入画面で、出品した商品のデータが表示されていること



end
