class AddFirstNameZenkakuKatakanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_zenkaku_katakana, :string
  end
end
