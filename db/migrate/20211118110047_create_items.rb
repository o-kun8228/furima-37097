class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :price, null: false
      t.string     :brand_name,null: false
      t.text       :description_item,null: false
      t.integer    :category_id,null: false
      t.integer    :status_id,null: false
      t.integer    :fee_id,null: false
      t.integer    :send_day_id,null: false
      t.integer    :shipping_area_id,null: false
      t.references :user,null: false,foreign_key: true






      t.timestamps
    end
  end
end
